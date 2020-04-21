package com.milk.mg;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.dao.BoardDAO;
import com.milk.dao.InputProductDAO;
import com.milk.dao.MemberDAO;
import com.milk.dao.OrderDAO;
import com.milk.dao.ProductDAO;
import com.milk.dao.ProductDivisionDAO;
import com.milk.dao.ProductPageDAO;
import com.milk.dto.BoardDTO;
import com.milk.dto.BuyingRecordDTO;
import com.milk.dto.ChartDataDTO;
import com.milk.dto.InputProductDTO;
import com.milk.dto.ManagerDTO;
import com.milk.dto.MemberDTO;
import com.milk.dto.OrderDTO;
import com.milk.dto.ProductDTO;
import com.milk.dto.ProductDivisionDTO;
import com.milk.dto.ProductPageDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ChangeData
 */
@WebServlet("/changedatamg")
public class ChangeData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		// 비정상적인 요청에 대한 처리 / 로그인 상태가 아닌경우
		if(session.getAttribute("login") == null) {
			out.print("error");
			return;
		}
		
		if(request.getMethod().equals("GET")) {
			return;
		}
		
		String type = request.getParameter("type");
		
		// user데이터 상태변경에 대한 요청에 대한 처리
		if(type.equals("userStatusChange")) {
			// 업데이트를 처리
			String value = request.getParameter("value");
			
			// 요청한 id 값의 배열 저장
			String[] values = value.split(";");
			
			// 요청한 상태 저장
			int status = Integer.parseInt(request.getParameter("key"));
			System.out.println(status);
			int rows = 0;
			for(String id : values) {
				// 업데이트 후 업데이트 된 행 갯수 반환
				if(MemberDAO.getDAO().updateStatusMember(id, status) == 1) {
					rows++;
				}
			}
			out.print(rows);
			return;
		}
		
		
		
		// 제품구분 처리 이벤트
		if(type.equals("div")) {
			String func = request.getParameter("func");
			
			String div = request.getParameter("div");
			System.out.println(div);
			String feature = request.getParameter("feature");
			String size = request.getParameter("size");
			
			ProductDivisionDTO pd = new ProductDivisionDTO();
			
			pd.setPdDivision(div);
			pd.setPdFeature(feature);
			pd.setPdStdsize(size);
					
			switch(func) {
			case "add":
				ProductDivisionDAO.getDAO().insertProductDivision(pd);
				out.print("success");
				return;
			case "modify":
				ProductDivisionDAO.getDAO().updateProductDivision(pd);
				out.print("success");
				return;
			case "delete":
				ProductDivisionDAO.getDAO().deleteProductDivision(pd);
				out.print("success");
				return;
			}
			out.print("fail");
			return;
		}
		
		if(type.equals("inputProduct")) {
			// 업데이트를 처리
			ManagerDTO login = (ManagerDTO)session.getAttribute("login");
			// 로그인 안되어있을때 처리
			if(login==null) {
				return;
			}
			int emp = login.getmEmployeeNo();
			int serial = Integer.parseInt(request.getParameter("serial"));
			int amount = Integer.parseInt(request.getParameter("amount"));
				
			InputProductDTO ip = new InputProductDTO();
			ip.setIpEmployeeNo(emp);
			ip.setIpSerialNo(serial);
			ip.setIpAmount(amount);
			
			ProductDTO p = ProductDAO.getDAO().selectSerialProduct(serial);
			p.setpSerialNo(serial);
			p.setpAmount(p.getpAmount()+amount);
			
			int rows = InputProductDAO.getDAO().insertInputProduct(ip);
			rows += ProductDAO.getDAO().updateProductAmount(p);
			
			if(rows==2) {
				out.print(amount);
			}else {
				out.print(0);
			}
			return;
		}
		
		if(type.equals("changeProduct")) {
			int rows = 0;
			if(request.getParameter("func").equals("add")) {
				int serial = Integer.parseInt(request.getParameter("serial"));
				String div = request.getParameter("div");
				String name = request.getParameter("name");
				String origin = request.getParameter("origin");
				int size = Integer.parseInt(request.getParameter("size"));
				int price = Integer.parseInt(request.getParameter("price"));
				
				ProductDTO p = new ProductDTO();
				
				p.setpSerialNo(serial);
				p.setpDivision(div);
				p.setpName(name);
				p.setpOrigin(origin);
				p.setpSize(size);
				p.setpPrice(price);
				//입력
				rows = ProductDAO.getDAO().insertProduct(p);
				
			}else if(request.getParameter("func").equals("modify")) {
				int serial = Integer.parseInt(request.getParameter("serial"));
				String name = request.getParameter("name");
				String origin = request.getParameter("origin");
				int size = Integer.parseInt(request.getParameter("size"));
				int price = Integer.parseInt(request.getParameter("price"));
				
				ProductDTO p = new ProductDTO();
				
				p.setpSerialNo(serial);
				p.setpName(name);
				p.setpOrigin(origin);
				p.setpSize(size);
				p.setpPrice(price);
				
				rows = ProductDAO.getDAO().updateProduct(p);
				
			}else if(request.getParameter("func").equals("delete")) {
				int serial = Integer.parseInt(request.getParameter("serial"));
				ProductDTO p = new ProductDTO();
				
				rows = ProductDAO.getDAO().deleteSerialProduct(serial);
			}
			
			out.println(rows);
			return;
		}
		
		
		//페이지 업데이트
		if(type.equals("pageUpdate")) {
			response.setContentType("text/html; charset=utf-8");
			//서버경로
			// String uploadDir = request.getServletContext().getRealPath("/upload");
			
			//컨텍스트 경로
			String uploadDir = "/images";
			MultipartRequest mr = new MultipartRequest(request, uploadDir, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy()); // 30*1024*1024 : 30mb
			
			int serial = Integer.parseInt(request.getParameter("serial"));
			int employeNo = Integer.parseInt(request.getParameter("no"));
			String fileone = mr.getFilesystemName("fileone");
			
			ProductPageDTO pp = new ProductPageDTO();
			pp.setPpSerialNo(serial);
			pp.setPpEmployeeNo(employeNo);
			pp.setPpMainImage(fileone);
			
			int rows = ProductPageDAO.getDAO().InsertProductPage(pp);
			
			out.println(rows);
			return;
		}
		
		
		//페이지 업데이트
		if(type.equals("batch")) {
			response.setContentType("text/html; charset=utf-8");
			String orderNo = request.getParameter("orderNo");
			int rows = 0;
			// 검색
			List<OrderDTO> orders = OrderDAO.getDAO().selectOrderNoOrder(orderNo);
			int total = 0;
			int serial = 0;
			
			//for문돌며 입력
			for(OrderDTO o : orders) {
				// 입금해야하는 금액
				total = o.getPrice() * o.getAmount();
				serial = o.getSerialNo();
				System.out.println(total);
				// 입금처리
				rows += OrderDAO.getDAO().updateDepositBuyingRecord(orderNo, serial, total);
			}
			out.print(rows);
			return;
		}
		
		//페이지 업데이트
		if(type.equals("pageUpdate")) {
			response.setContentType("text/html; charset=utf-8");
			//서버경로
			// String uploadDir = request.getServletContext().getRealPath("/upload");
			
			//컨텍스트 경로
			String uploadDir = "/images";
			MultipartRequest mr = new MultipartRequest(request, uploadDir, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy()); // 30*1024*1024 : 30mb
			
			int serial = Integer.parseInt(request.getParameter("serial"));
			int employeNo = Integer.parseInt(request.getParameter("no"));
			String fileone = mr.getFilesystemName("fileone");
			
			ProductPageDTO pp = new ProductPageDTO();
			pp.setPpSerialNo(serial);
			pp.setPpEmployeeNo(employeNo);
			pp.setPpMainImage(fileone);
			
			int rows = ProductPageDAO.getDAO().InsertProductPage(pp);
			
			out.println(rows);
			return;
		}
	}
}