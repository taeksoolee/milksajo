package com.milk.mg;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import javax.rmi.CORBA.Util;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.dao.ManagerDAO;
import com.milk.dto.ManagerDTO;
import com.milk.util.Utility;
import com.milk.util.Validation;

/**
 * Servlet implementation class JoinMg
 */
@WebServlet("/joinmg")
public class JoinMg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String result = "false";
		
		PrintWriter out = response.getWriter();
		String mgrNo = request.getParameter("mgrNo");
		String mgrPwd = request.getParameter("mgrPwd");
		String mgrRPwd = request.getParameter("mgrRPwd");
		String mgrName = request.getParameter("mgrName");
		String mgrCode = request.getParameter("mgrCode");
		
// 잘못된 요청에 대한 처리
		if(mgrNo == null || mgrPwd == null || mgrRPwd == null || mgrName == null || mgrCode == null
				|| mgrNo.equals("") || mgrPwd.equals("") || mgrRPwd.equals("") || mgrName.equals("") || mgrCode.equals("") || mgrPwd.equals("")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
// 유효성 검사
		//no
		System.out.println(mgrNo instanceof String);
		System.out.println(Validation.test(mgrNo, Validation.regMgrNo));
		System.out.println(ManagerDAO.getDAO().selectNoManager(Integer.parseInt(mgrNo)));
		
		if(!Validation.test(mgrNo, Validation.regMgrNo) || ManagerDAO.getDAO().selectNoManager(Integer.parseInt(mgrNo)) != null) {
			System.out.println("no");
			out.print(result);
			return;
		}
		//pwd
		if(!Validation.test(mgrPwd, Validation.regMgrPwd)) {
			System.out.println("pwd");
			out.print(result);
			return;
		}
		//name
		if(!Validation.test(mgrName, Validation.regMgrName)) {
			System.out.println("name");
			out.print(result);
			return;
		}
		
		if(!Validation.checkMgrJoinCode(mgrCode)) {
			out.print(result);
			return;
		}
		
// 주어진 정보로 manager객체 생성
		ManagerDTO manager = new ManagerDTO();
		manager.setmEmployeeNo(Integer.parseInt(mgrNo));
		manager.setmPassword(Utility.encrypt(mgrPwd));
		manager.setmName(Utility.stripTag(mgrName));
		manager.setmGrade(1);

// 회원가입
		int rows = ManagerDAO.getDAO().insertManager(manager);

// 회원가입 성공시 결과값 true로 변경
		System.out.println(rows);
		if(rows == 1) {
			result = "true";
		}

		System.out.println("(" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + ")join >> "+mgrName + "/" + mgrNo);
		
		
		out.print(result);
		
		out.flush();
		out.close();
	}

}
