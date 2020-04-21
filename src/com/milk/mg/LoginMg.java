package com.milk.mg;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.tomcat.util.json.JSONParser;

import com.milk.dao.ManagerDAO;
import com.milk.dto.ManagerDTO;
import com.milk.util.Utility;

/********************************************
 * ������������ �α��� ��� ��ȯ �� �α��� ������ ������ �����ϴ� ����
********************************************/

@WebServlet("/loginmg")
public class LoginMg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		String mgrNo = request.getParameter("mgrNo");
		String mgrPwd = Utility.encrypt(request.getParameter("mgrPwd"));
		
		// �߸��� ��û�� ���� ó��
		if(mgrNo == null || mgrPwd == null
				|| mgrNo.equals("") || mgrPwd.equals("")
				|| !Pattern.matches("^[0-9]{10}$", mgrNo)) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		ManagerDTO manager = ManagerDAO.getDAO().selectNoManager(Integer.parseInt(mgrNo));
		
		if(manager == null) {
			out.print("false");
			return;
		}
		
		if(manager.getmPassword() != null && manager.getmPassword().equals(mgrPwd)) {
			// login ���� ����
			HttpSession session = request.getSession();
			session.setAttribute("login", manager);
			//log �ۼ�
			System.out.println("(" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + ")login >> " + manager.getmEmployeeNo());
			out.print("true");
		}else {
			out.print("false");
		}
		
		out.flush();
		out.close();
 	}
}