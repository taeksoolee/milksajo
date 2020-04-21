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

import com.milk.dao.ManagerDAO;
import com.milk.dto.ManagerDTO;

/**
 * Servlet implementation class CheckId
 */
@WebServlet("/checkid")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		String mgrNo = request.getParameter("mgrNo");
		
		if(mgrNo == null || mgrNo.equals("")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		ManagerDTO manager = ManagerDAO.getDAO().selectNoManager(Integer.parseInt(mgrNo));
		
		if(manager != null && (manager.getmEmployeeNo()+"").equals(mgrNo)){
			out.print("true");
		}else {
			out.print("false");
		}
		
		out.flush();
		out.close();
	}
}
