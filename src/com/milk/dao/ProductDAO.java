package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.milk.dto.ProductDTO;

public class ProductDAO extends JdbcDAO {
	private static ProductDAO _dao;
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new ProductDAO();
	}
	
	public static ProductDAO getDAO() {
		return _dao;
	}
	
	//새로운 제품을 추가하기 위한 메소드
	public int insertProduct(ProductDTO product) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "insert into product values(?, ?, ?, ?, ?, ?, 0, 0, 0)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, product.getpSerialNo());
			pstmt.setString(2, product.getpDivision());
			pstmt.setString(3, product.getpName());
			pstmt.setString(4, product.getpOrigin());
			pstmt.setInt(5, product.getpSize());
			pstmt.setInt(6, product.getpPrice());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//제품의 정보를 수정하는 메소드
	public int updateProduct(ProductDTO product) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "update product set p_division=?, p_name=?, p_origin=?, p_size=?, p_price=? where p_serial_no=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, product.getpDivision());
			pstmt.setString(2, product.getpName());
			pstmt.setString(3, product.getpOrigin());
			pstmt.setInt(4, product.getpSize());
			pstmt.setInt(5, product.getpPrice());
			pstmt.setInt(6, product.getpSerialNo());
			
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	// 재고 수량을 변경하는 메소드
	public int updateProductAmount(ProductDTO product) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "update product set p_amount=? where p_serial_no=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, product.getpAmount());
			pstmt.setInt(2, product.getpSerialNo());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateProductAmount() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	
	//제품 수량 수정 메소드
	public int updateAmunt(int serial) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "update product set p_amount=p_amount-1, p_sale_amount=p_sale_amount+1 where p_serial_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, serial);
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateAmunt() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//해당 제품 삭제 메소드
	public int deleteProduct(ProductDTO product) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "delete from product where p_serial_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product.getpSerialNo());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	//해당 제품 삭제 메소드
	public int deleteSerialProduct(int serial) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "delete from product where p_serial_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, serial);
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteSerialProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	
	
	
	
	//모든 제품 검색 메소드
	public List<ProductDTO> selectAllProduct() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			con = getConnection();
			
			String sql = "select * from product order by p_serial_no";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setpSerialNo(rs.getInt("p_serial_no"));
				product.setpDivision(rs.getString("p_division"));
				product.setpName(rs.getString("p_name"));
				product.setpOrigin(rs.getString("p_origin"));
				product.setpSize(rs.getInt("p_size"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpAmount(rs.getInt("p_amount"));
				product.setpSaleAmount(rs.getInt("p_sale_amount"));
				product.setpStatus(rs.getInt("p_status"));
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	
	//특정 상품 검색 메소드
	//select * from product where p_name like ? || '%' order by p_serial_no
	public List<ProductDTO> selectProduct(String name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			con = getConnection();
			
			String sql = "select * from product where p_name like '%' || ? || '%' order by p_serial_no";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setpSerialNo(rs.getInt("p_serial_no"));
				product.setpDivision(rs.getString("p_division"));
				product.setpName(rs.getString("p_name"));
				product.setpOrigin(rs.getString("p_origin"));
				product.setpSize(rs.getInt("p_size"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpAmount(rs.getInt("p_amount"));
				product.setpSaleAmount(rs.getInt("p_sale_amount"));
				product.setpStatus(rs.getInt("p_status"));
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	
	//제품 시리얼 넘버를 전달받아 해당 제품의 정보를 반환하는 메소드
	public List<ProductDTO> selectNoProduct(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select * from product where p_serial_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setpSerialNo(rs.getInt("p_serial_no"));
				product.setpDivision(rs.getString("p_division"));
				product.setpName(rs.getString("p_name"));
				product.setpOrigin(rs.getString("p_origin"));
				product.setpSize(rs.getInt("p_size"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpAmount(rs.getInt("p_amount"));
				product.setpSaleAmount(rs.getInt("p_sale_amount"));
				product.setpStatus(rs.getInt("p_status"));
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	
	//단일 검색메소드
	public ProductDTO selectSerialProduct(int serial) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO product = null;
		try {
			con = getConnection();
			
			String sql = "select * from product where p_serial_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, serial);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				product = new ProductDTO();
				product.setpSerialNo(rs.getInt("p_serial_no"));
				product.setpDivision(rs.getString("p_division"));
				product.setpName(rs.getString("p_name"));
				product.setpOrigin(rs.getString("p_origin"));
				product.setpSize(rs.getInt("p_size"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpAmount(rs.getInt("p_amount"));
				product.setpSaleAmount(rs.getInt("p_sale_amount"));
				product.setpStatus(rs.getInt("p_status"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
}
