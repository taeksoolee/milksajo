package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.milk.dto.CartDTO;
import com.milk.dto.ProductDTO;
import com.milk.dto.ProductPageDTO;


public class CartDAO extends JdbcDAO {
	private static CartDAO _dao;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new CartDAO();
	}
	
	public static CartDAO getDAO() {
		return _dao;
	}
	
	
	//장바구니에 상품 등록하는 메소드
	public int insertCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "insert into cart values(?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getCaUserId());
			pstmt.setInt(2, cart.getCaAmount());
			pstmt.setInt(3, cart.getCaSerialNo());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//장바구니 목록에 제품 수량 변경 메소드
	public int updateCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "update cart set ca_amount=? where ca_user_id=? and ca_serial_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart.getCaAmount());
			pstmt.setString(2, cart.getCaUserId());
			pstmt.setInt(3, cart.getCaSerialNo());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//장바구니 목록에 제품 삭제
	public int deleteCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "delete from cart where ca_serial_no=? and ca_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart.getCaSerialNo());
			pstmt.setString(2, cart.getCaUserId());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//장바구니 목록의 모든 제품 삭제
	//delete from cart where ca_user_id=?
	public int deleteAllCart(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "delete from cart where ca_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteAllCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	// 카트를 받아오는 메소드
	public List<CartDTO> selectIdCartt(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		try {
			con = getConnection();
			
			String sql ="select * from cart where ca_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setCaUserId(rs.getString("ca_user_id"));
				cart.setCaAmount(rs.getInt("ca_amount"));
				cart.setCaSerialNo(rs.getInt("ca_serial_no"));
				
				cartList.add(cart);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdCartt() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cartList;
	}
	
	//장바구니 목록 확인 메소드
	public List<CartDTO> selectCart(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		try {
			con = getConnection();
			
			String sql ="select ca_amount, p_serial_no, p_name, p_price, p_size, pp_main_image from cart c join" + 
					" product p on p.p_serial_no=c.ca_serial_no join product_page g on c.ca_serial_no=g.pp_serial_no" + 
					" and c.ca_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setCaAmount(rs.getInt("ca_amount"));
				
				ProductDTO product = new ProductDTO();
				product.setpSerialNo(rs.getInt("p_serial_no"));
				product.setpName(rs.getString("p_name"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpSize(rs.getInt("p_size"));
				cart.product=product;
				
				ProductPageDTO page = new ProductPageDTO();
				page.setPpMainImage(rs.getString("pp_main_image"));
				cart.page=page;
				
				cartList.add(cart);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cartList;
	}
	
	
	//주문 목록 메소드
	public List<CartDTO> selectOrder(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<CartDTO> orderList = new ArrayList<CartDTO>();
		try {
			con = getConnection();
			
			String sql ="select ca_amount, p_serial_no, p_name, p_price, pp_main_image from cart c join" + 
					" product p on p.p_serial_no=c.ca_serial_no join product_page g on c.ca_serial_no=g.pp_serial_no" + 
					" and c.ca_user_id=? and c.ca_serial_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getCaUserId());
			pstmt.setInt(2, cart.getCaSerialNo());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO order = new CartDTO();
				order.setCaAmount(rs.getInt("ca_amount"));
				
				ProductDTO product = new ProductDTO();
				product.setpSerialNo(rs.getInt("p_serial_no"));
				product.setpName(rs.getString("p_name"));
				product.setpPrice(rs.getInt("p_price"));
				order.product=product;
				
				ProductPageDTO page = new ProductPageDTO();
				page.setPpMainImage(rs.getString("pp_main_image"));
				order.page=page;
				
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectOrder() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	
	//주문 목록 메소드
	public CartDTO selectNoCart(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CartDTO cart = null;
		try {
			con = getConnection();
			
			String sql ="select ca_amount, p_serial_no, p_name, p_price, pp_main_image from cart c join" + 
					" product p on p.p_serial_no=c.ca_serial_no join product_page g on c.ca_serial_no=g.pp_serial_no" + 
					" and c.ca_serial_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cart = new CartDTO();
				cart.setCaAmount(rs.getInt("ca_amount"));
				
				ProductDTO product = new ProductDTO();
				product.setpSerialNo(rs.getInt("p_serial_no"));
				product.setpName(rs.getString("p_name"));
				product.setpPrice(rs.getInt("p_price"));
				cart.product=product;
				
				ProductPageDTO page = new ProductPageDTO();
				page.setPpMainImage(rs.getString("pp_main_image"));
				cart.page=page;
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNoCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cart;
	}
	
	//상품확인 메소드
	public CartDTO selectIdCart(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CartDTO cart = null;
		try {
			con = getConnection();
			
			String sql ="select ca_serial_no from cart where ca_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cart = new CartDTO();
				cart.setCaSerialNo(rs.getInt("ca_serial_no"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cart;
	}
	
	
	
	
	
	
	
}
