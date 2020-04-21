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
import com.milk.dao.MemberDAO;
import com.milk.dao.OrderDAO;
import com.milk.dao.ProductPageDAO;
import com.milk.dao.ProductDAO;
import com.milk.dao.ProductDivisionDAO;
import com.milk.dto.BoardDTO;
import com.milk.dto.BuyingRecordDTO;
import com.milk.dto.ChartDataDTO;
import com.milk.dto.MemberDTO;
import com.milk.dto.OrderDTO;
import com.milk.dto.ProductDTO;
import com.milk.dto.ProductDivisionDTO;
import com.milk.dto.ProductPageDTO;


/**
 * Servlet implementation class GetData
 */
@WebServlet("/getdatamg")
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		// ���������� ��û�� ���� ó�� / �α��� ���°� �ƴѰ��
		if(session.getAttribute("login") == null) {
			out.print("error");
			return;
		}
		
		String type = request.getParameter("type");
		
		// user������ ��û�� ���� ó��
		if(type.equals("user")) {
			// ������� �����ϴ� �ν��Ͻ�
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			List<MemberDTO> userList = MemberDAO.getDAO().selectAllMember();
			
			if(userList.isEmpty()) return;
			
			int age = 0;
			
			buf.append("[");
			for(MemberDTO user : userList) {
				age = (new Date().getYear()+1900) - Integer.parseInt(user.getBirthday().substring(0, 4));
				String status = "";
				switch (user.getStatus()) {
				case 0: status="�޸�"; break;
				case 1: status="����"; break;
				case 7: status="������"; break;
				case 9: status="Ż��"; break;
				} 
				/*{
					id:"",
					name:"",
					age: "",
					tel: "",
					email: "",
					addr: "",
					status: "",
					joindate: "",
					lastlogin: "",
					birthday: ""
				}*/
				buf.append("{");
				buf.append("\"id\": \"" + user.getId()+"\",");
				buf.append("\"name\": \"" + user.getName()+"\",");
				buf.append("\"age\": \"" + age + "\",");
				buf.append("\"tel\": \"" + user.getPhone()+"\",");
				buf.append("\"email\": \"" + user.getEmail()+"\",");
				buf.append("\"addr\": \"(" + user.getZipcode()+") "+user.getAddress1()+", "+user.getAddress2() +"\",");
				buf.append("\"status\": \"" + status+"\",");
				buf.append("\"joindate\": \"" + user.getJoinDate().substring(0,10)+"\",");
				buf.append("\"lastlogin\": \"" + user.getLastLogin().substring(0,10)+"\",");
				buf.append("\"birthday\": \"" + user.getBirthday().substring(0,10)+"\"");
				buf.append("},");
			}
			
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
		
		// ���� �˻��� ���� ����Ʈ ��ȯ
		if(type.equals("userOption")) {
			// ���� �Ѱܹ���
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			
			// birthday = b, lastlogin = l, joindate = j
			String option = request.getParameter("option");
			
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			List<MemberDTO> userList = null;
			
			if(option.equals("b")) {
				userList = MemberDAO.getDAO().selectOPMember(start, end, MemberDAO.OP_BIRTHDAY);
			}else if(option.equals("l")) {
				userList = MemberDAO.getDAO().selectOPMember(start, end, MemberDAO.OP_LASTLOGIN);
			}else if(option.equals("j")) {
				userList = MemberDAO.getDAO().selectOPMember(start, end, MemberDAO.OP_JOINDATE);
			}else {
				// ��� �ƴҰ�� ��ȯ ����
				return;
			}
			
			if(userList.isEmpty()) return;
			
			int age = 0;
			
			buf.append("[");
			for(MemberDTO user : userList) {
				age = (new Date().getYear()+1900) - Integer.parseInt(user.getBirthday().substring(0, 4));
				String status = "";
				switch (user.getStatus()) {
				case 0: status="�޸�"; break;
				case 1: status="����"; break;
				case 7: status="������"; break;
				case 9: status="Ż��"; break;
				} 
				/*{
					id:"",
					name:"",
					age: "",
					tel: "",
					email: "",
					addr: "",
					status: "",
					joindate: "",
					lastlogin: "",
					birthday: ""
				}*/
				buf.append("{");
				buf.append("\"id\": \"" + user.getId()+"\",");
				buf.append("\"name\": \"" + user.getName()+"\",");
				buf.append("\"age\": \"" + age + "\",");
				buf.append("\"tel\": \"" + user.getPhone()+"\",");
				buf.append("\"email\": \"" + user.getEmail()+"\",");
				buf.append("\"addr\": \"(" + user.getZipcode()+") "+user.getAddress1()+", "+user.getAddress2() +"\",");
				buf.append("\"status\": \"" + status+"\",");
				buf.append("\"joindate\": \"" + user.getJoinDate().substring(0,10)+"\",");
				buf.append("\"lastlogin\": \"" + user.getLastLogin().substring(0,10)+"\",");
				buf.append("\"birthday\": \"" + user.getBirthday().substring(0,10)+"\"");
				buf.append("},");
			}
			
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
		
		
		// product ������ ��û�� ���� ó��
		if(type.equals("product")) {
			// ������� �����ϴ� �ν��Ͻ�
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			List<ProductDTO> productList = ProductDAO.getDAO().selectAllProduct();
			
			if(productList.isEmpty()) return;
			
			buf.append("[");
			for(ProductDTO product : productList) {
				String serialNo = changeSerial(product.getpSerialNo());
				/*{
					serial:"",
					div:"",
					name: "",
					origin: "",
					size: "",
					price: "",
					amount: "",
					sales: ""
				}*/
				buf.append("{");
				buf.append("\"serial\": \"" + serialNo+"\",");
				buf.append("\"div\": \"" + product.getpDivision()+"\",");
				buf.append("\"name\": \"" + product.getpName()+"\",");
				buf.append("\"origin\": \"" + product.getpOrigin()+"\",");
				buf.append("\"size\": \"" + product.getpSize()+"\",");
				buf.append("\"price\": \"" + product.getpPrice()+"\",");
				buf.append("\"amount\": \"" + product.getpAmount()+"\",");
				buf.append("\"sales\": \"" + product.getpSaleAmount()+"\"");
				buf.append("},");
			}
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
		
		// board ������ ��û�� ���� ó��
		if(type.equals("board")) {
			// ������� �����ϴ� �ν��Ͻ�
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			List<BoardDTO> boardList = BoardDAO.getDAO().selectAllBoarder();
			
			if(boardList.isEmpty()) return;
			
			buf.append("[");
			int state = 9999;
			String stateString = "";
			for(BoardDTO board : boardList) {
				state = board.getState();
				switch(state) {
				case 0: stateString = "�Խ���"; break;// �Խð���
				case 1: stateString = "��б�"; break;// ��б�
				case 8: stateString = "��Ȱ��"; break;// ��Ȱ��(����ó��)
				case 9: stateString = "����"; break;// ��������...!
				}
				/*{
					id:"",
					subject:"",
					regDate: "",
					readCount: "",
					content: "",
					ip: "",
					state: "",
					content: ""
				}*/
				buf.append("{");
				buf.append("\"id\": \"" + board.getId()+"\",");
				buf.append("\"title\": \"" + board.getSubject()+"\",");
				buf.append("\"regDate\": \"" + board.getRegDate()+"\",");
				buf.append("\"readCount\": \"" + board.getReadCount()+"\",");
				buf.append("\"content\": \"" + board.getContent()+"\",");
				buf.append("\"ip\": \"" + board.getIp()+"\",");
				buf.append("\"state\": \"" + board.getContent()+"\",");
				buf.append("\"state\": \"" + stateString+"\"");
				buf.append("},");
			}
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
		
		// order ������ ��û�� ���� ó��
		if(type.equals("order")) {
			// ������� �����ϴ� �ν��Ͻ�
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			List<OrderDTO> orderList = OrderDAO.getDAO().selectAllOrder();
			
			if(orderList.isEmpty()) return;
			
			buf.append("[");
			int state = 9999;
			String stateStr = "";
			for(OrderDTO order : orderList) {
				String serialNo = changeSerial(order.getSerialNo());
				int amount = order.getAmount();
				int price =  order.getPrice();
				
				state = order.getState();
				//�ֹ� ����  (0: �ֹ����� | 1: �ԱݿϷ� | 2: ��ۿϷ� )
				switch (state) {
				case 0:
					stateStr = "�ֹ�����";
					break;
				case 1:
					stateStr = "�ԱݿϷ�";
					break;
				case 2:
					stateStr = "��ۿϷ�";
					break;
				}
				
				/*{
					no:"",
					serial:"",
					amount: "",
					price: "",
					deposit: "",
					refund: "",
					state: "",
					user: "",
				}*/
				buf.append("{");
				buf.append("\"no\": \"" + order.getOrderNo()+"\",");
				buf.append("\"serial\": \"" + serialNo+"\",");
				buf.append("\"amount\": \"" + amount+"\",");
				buf.append("\"price\": \"" + DecimalFormat.getCurrencyInstance().format(price*amount)+"\",");
				buf.append("\"deposit\": \"" + order.getDeposit()+"\",");
				buf.append("\"refund\": \"" + order.getRefund()+"\",");
				buf.append("\"state\": \"" + stateStr+"\",");
				buf.append("\"user\": \"" + order.getUserId()+"\"");
				buf.append("},");
			}
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
		
		// order ������ ��û�� ���� ó��
		if(type.equals("batchOrder")) {
			String orderNo = request.getParameter("no");
			// ������� �����ϴ� �ν��Ͻ�
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			List<OrderDTO> orderList = OrderDAO.getDAO().selectOrderNoOrder(orderNo);
			
			if(orderList.isEmpty()) return;
			
			buf.append("[");
			int state = 9999;
			String stateStr = "";
			for(OrderDTO order : orderList) {
				String serialNo = changeSerial(order.getSerialNo());
				int amount = order.getAmount();
				int price =  order.getPrice();
				
				state = order.getState();
				//�ֹ� ����  (0: �ֹ����� | 1: �ԱݿϷ� | 2: ��ۿϷ� )
				switch (state) {
				case 0:
					stateStr = "�ֹ�����";
					break;
				case 1:
					stateStr = "�ԱݿϷ�";
					break;
				case 2:
					stateStr = "��ۿϷ�";
					break;
				}
				
				/*{
					no:"",
					serial:"",
					amount: "",
					price: "",
					deposit: "",
					refund: "",
					state: "",
					user: "",
				}*/
				buf.append("{");
				buf.append("\"no\": \"" + order.getOrderNo()+"\",");
				buf.append("\"serial\": \"" + serialNo+"\",");
				buf.append("\"amount\": \"" + amount+"\",");
				buf.append("\"price\": \"" + DecimalFormat.getCurrencyInstance().format(price*amount)+"\",");
				buf.append("\"deposit\": \"" + order.getDeposit()+"\",");
				buf.append("\"refund\": \"" + order.getRefund()+"\",");
				buf.append("\"state\": \"" + stateStr+"\",");
				buf.append("\"user\": \"" + order.getUserId()+"\"");
				buf.append("},");
			}
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
		
		
		// page ������ ��û�� ���� ó��
		if(type.equals("page")) {
			// ������� �����ϴ� �ν��Ͻ�
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			List<ProductPageDTO> pageList = ProductPageDAO.getDAO().selectAllPage();
			
			if(pageList.isEmpty()) return;
			
			buf.append("[");
			for(ProductPageDTO page : pageList) {
				/*{
					pageNo:"",
					serial:"",
					mainImage: "",
					admin: "",
				}*/
				buf.append("{");
				buf.append("\"pageNo\": \"" + page.getPpNo()+"\",");
				buf.append("\"serial\": \"" + changeSerial(page.getPpSerialNo())+"\",");
				buf.append("\"mainImage\": \"" +page.getPpMainImage()+"\",");
				buf.append("\"admin\": \"" + page.getPpEmployeeNo()+"\"");
				buf.append("},");
			}
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
		
		// pieChart ������ ��û�� ���� ó�� �迭�� ó��
		if(type.equals("pieChart")) {
			// ������� �����ϴ� �ν��Ͻ�
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			String date = request.getParameter("value");
			List<ChartDataDTO> list = OrderDAO.getDAO().selectChartData(date);
			
			if(list.isEmpty()) return;
			
			buf.append("[");
			for(ChartDataDTO data : list) {
				/*["name", "value"]*/
				buf.append("[");
				buf.append("\""+data.getName()+"\",");
				buf.append(""+data.getValue()+"");
				buf.append("],");
			}
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
		
		// boarderDivision ������ ��û�� ���� ó��
		if(type.equals("productDivision")) {
			// ������� �����ϴ� �ν��Ͻ�
			String result = "";
			StringBuffer buf = new StringBuffer();
			
			List<ProductDivisionDTO> list = ProductDivisionDAO.getDAO().selectAllProductDivision();
			
			if(list.isEmpty()) return;
			
			buf.append("[");
			for(ProductDivisionDTO pd : list) {
				/*{
				 	div: "",
				 	feature: "",
				 	size: "",
				}*/
				buf.append("{");
				buf.append("\"div\": \"" + pd.getPdDivision()+"\",");
				buf.append("\"feature\": \"" + pd.getPdFeature()+"\",");
				buf.append("\"size\": \"" + pd.getPdStdsize()+"\"");
				buf.append("},");
			}
			int c = buf.length();
			buf.replace(c-1, c, "]");
			out.print(buf.toString());
			return;
		}
	}
	
	// ������ �ø����ȣ�� 4�ڸ� ���������� ��ȯ �ϴ� �޼ҵ�
	public static String changeSerial(int serial) {
		String serialNo = "0000";
		
		if(serial > 0 && serial < 9) {
			serialNo = "000"+serial;
		}else if(serial > 10 && serial < 99){
			serialNo = "00"+serial;
		}else if(serial > 100 && serial < 999){
			serialNo = "0"+serial;
		}else {
			serialNo = ""+serial;
		}
		
		return serialNo;
	}
}
