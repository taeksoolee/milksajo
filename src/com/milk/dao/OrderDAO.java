package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.milk.dto.BuyingInfDTO;
import com.milk.dto.BuyingRecordDTO;
import com.milk.dto.ChartDataDTO;
import com.milk.dto.MemberOrderDTO;
import com.milk.dto.OrderDTO;

public class OrderDAO extends JdbcDAO{
	private static OrderDAO _dao;
	
	private OrderDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new OrderDAO();
	}
	
	public static OrderDAO getDAO() {
		return _dao;
	}
	
	// 주문번호를 생성하는 메소드 
	public static String createOrderNo() {
		String r = "";
		String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
		
		List<String> list = _dao.selectBROrderNo(today);
		
		if(list.size() == 0) {
			// 오늘자 정보가 없다면
			r = today + "001";
		}else {
			// 오늘자 정보가 있다면
			r = (Long.parseLong((list.get(0)))+1)+"";
			
		}
		return r;
	}
	
	
	//주문일자(자동저장), user id 저장 메소드
	public int insertBuyingInf(String orderNo, String id) {
		int rows = 0;
		//String orderNo = createOrderNo();
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			// insert into bying_record values()
			String sql = "insert into buying_inf values(?, ?)";
		
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, orderNo);
			ps.setString(2, id);
			
			rows = ps.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]insertBuyingInf() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rows;
	}
	
	
	// 입력 메소드 // 주문일자는 자동완성되서 처리
	public int insertBuyingRecord(BuyingRecordDTO record) {
		int rows = 0;
		//String orderNo = createOrderNo();
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			// insert into bying_record values()
			String sql = "insert into buying_record values(?, ?, ?, 0, 0, 0)";
		
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, record.getBrOrderNo());
			ps.setInt(2, record.getBrSerialNo());
			ps.setInt(3, record.getBrAmount());
			
			rows = ps.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]insertBuying_record() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rows;
	}
	
	
	// 수정 메소드
	public int updateBuyingRecord(BuyingRecordDTO record) {
		int rows = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			// update product set p_division=?, p_name=?, p_origin=?, p_size=?, p_price=?, p_amount=?, p_sale_amount=? where p_serial_no=?;
			String sql = "update buying_record set BR_SERIAL_NO=?, BR_AMOUNT=?, BR_DEPOSIT=?, BR_REFUND=?, BR_REFUND=?, BR_STATE=? where BR_ORDER_NO=?";
		
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, record.getBrSerialNo());
			ps.setInt(2, record.getBrAmount());
			ps.setInt(3, record.getBrDeposit());
			ps.setInt(4, record.getBrRefund());
			ps.setInt(5, record.getBrState());
			ps.setString(6, record.getBrOrderNo());
			
			rows = ps.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]updateBuyingRecord() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rows;
	}
	
	//입금처리하는 DAO 메소드
	public int updateDepositBuyingRecord(String orderNo, int serial, int deposit) {
		int rows = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			// update product set p_division=?, p_name=?, p_origin=?, p_size=?, p_price=?, p_amount=?, p_sale_amount=? where p_serial_no=?;
			String sql = "update buying_record set BR_DEPOSIT=?, BR_STATE=1 where BR_ORDER_NO=? and br_serial_no=?";
		
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, deposit);
			ps.setString(2, orderNo);
			ps.setInt(3, serial);
			
			rows = ps.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]updateDepositBuyingRecord() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rows;
	}
	
	
// 구매기록(Buying_record)과 구매정보(Buying_inf), 상품(product)를 조인하여 다중검색 실행
	public List<OrderDTO> selectAllOrder() {
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			// order_no, serial_no, amount, deposit, refund, state, user_id 이름으로 출력됨
			//String sql = "select br_order_no order_no, br_serial_no serial_no, br_amount amount, p_price price, br_deposit deposit, br_refund refund, br_state state, bi_user_id user_id from buying_record join buying_inf on buying_record.br_order_no = buying_inf.bi_order_no join product on buying_record.br_serial_no=product.p_serial_no";
			String sql = "select br_order_no order_no, br_serial_no serial_no, br_amount amount, p_price price, br_deposit deposit, br_refund refund, br_state state, bi_user_id user_id from buying_record join buying_inf on buying_record.br_order_no = buying_inf.bi_order_no join product on buying_record.br_serial_no=product.p_serial_no";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderDTO order = new OrderDTO();
				
				order.setOrderNo(rs.getString("order_no"));
				order.setSerialNo(rs.getInt("serial_no"));
				order.setAmount(rs.getInt("amount"));
				order.setPrice(rs.getInt("price"));
				order.setDeposit(rs.getInt("deposit"));
				order.setRefund(rs.getInt("refund"));
				order.setState(rs.getInt("state"));
				order.setUserId(rs.getString("user_id"));
					
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllOrder() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps, rs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return orderList;
	}
	
	// 구매기록(Buying_record)과 구매정보(Buying_inf), 상품(product)를 조인하여 다중검색 실행
		public List<OrderDTO> selectOrderNoOrder(String orderNo) {
			List<OrderDTO> orderList = new ArrayList<OrderDTO>();
			
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				
				// order_no, serial_no, amount, deposit, refund, state, user_id 이름으로 출력됨
				//String sql = "select br_order_no order_no, br_serial_no serial_no, br_amount amount, p_price price, br_deposit deposit, br_refund refund, br_state state, bi_user_id user_id from buying_record join buying_inf on buying_record.br_order_no = buying_inf.bi_order_no join product on buying_record.br_serial_no=product.p_serial_no";
				String sql = "select br_order_no order_no, br_serial_no serial_no, br_amount amount, p_price price, br_deposit deposit, br_refund refund, br_state state, bi_user_id user_id from buying_record join buying_inf on buying_record.br_order_no = buying_inf.bi_order_no join product on buying_record.br_serial_no=product.p_serial_no where buying_record.br_order_no=?";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, orderNo);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					OrderDTO order = new OrderDTO();
					
					order.setOrderNo(rs.getString("order_no"));
					order.setSerialNo(rs.getInt("serial_no"));
					order.setAmount(rs.getInt("amount"));
					order.setPrice(rs.getInt("price"));
					order.setDeposit(rs.getInt("deposit"));
					order.setRefund(rs.getInt("refund"));
					order.setState(rs.getInt("state"));
					order.setUserId(rs.getString("user_id"));
						
					orderList.add(order);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectOrderNoOrder() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				try {
					close(conn, ps, rs);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return orderList;
		}
	
	
// Buying_record에서 주어진 날짜(yyyyMMdd)에 해당하는 주문 상품 리스트 및 총수량을 반환 
	public List<ChartDataDTO> selectChartData(String date) {
		List<ChartDataDTO> list = new ArrayList<ChartDataDTO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from (SELECT distinct name, sum(amount) over(partition by name order by amount desc, name) amount from (select p_name name, br_amount amount from buying_record br join product p on br.br_serial_no=p.p_serial_no where br_order_no like ?||'___')) data order by amount";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ChartDataDTO data = new ChartDataDTO();
				data.setName(rs.getString(1));
				data.setValue(rs.getString(2));
				
				list.add(data);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectChartData() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps, rs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}


//오늘날짜에 주문자가 있는지 검색하여 오늘자 주문번호를 출력
	public List<String> selectBROrderNo(String today){
		List<String> list = new ArrayList<String>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			// order_no, serial_no, amount, deposit, refund, state, user_id 이름으로 출력됨
			String sql = "select bi_order_no from buying_inf where bi_order_no like ?||'%' order by bi_order_no desc";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, today); // yyyyMMdd
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString(1);
				list.add(no);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectBROrderNo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps, rs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
// 회원 id를 받아 해당 회원의 주문정보를 반환
	public List<MemberOrderDTO> selectMemberIdOrder(String id){
		List<MemberOrderDTO> list = new ArrayList<MemberOrderDTO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			// order_no, serial_no, amount, deposit, refund, state, user_id 이름으로 출력됨
			String sql = "select bi_order_no order_no, pp_main_image image, p_name product, br_amount amount, (br_amount*p_price) price, br_state state from member m join buying_inf bi on m.id=bi.bi_user_id join buying_record br on br.br_order_no=bi.bi_order_no join product p on p.p_serial_no=br.br_serial_no join product_page pp on p.p_serial_no=pp.pp_serial_no where id=? order by id";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberOrderDTO mo = new MemberOrderDTO();
				
				mo.setOrderNo(rs.getString("order_no"));
				mo.setImage(rs.getString("image"));
				mo.setProduct(rs.getString("product"));
				mo.setAmount(rs.getInt("amount"));
				mo.setPrice(rs.getInt("price"));
				mo.setState(rs.getInt("state"));
				
				list.add(mo);
			}
		} catch (SQLException e) {
			//System.out.println("[에러]selectBROrderNo() 메소드의 SQL 오류 = "+e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				close(conn, ps, rs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
}