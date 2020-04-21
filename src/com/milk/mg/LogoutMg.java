package com.milk.mg;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.milk.dto.ManagerDTO;

@WebServlet("/logoutmg")
public class LogoutMg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
// Get 요청시 에러페이지로
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	}

//	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ManagerDTO manager = (ManagerDTO)session.getAttribute("login");
		//log 작성
		System.out.println("(" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + ")logout >> " + manager.getmEmployeeNo());
		session.removeAttribute("login");
	}
}