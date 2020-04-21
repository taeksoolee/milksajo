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
	
	//���ο� ��ǰ�� �߰��ϱ� ���� �޼ҵ�
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
			System.out.println("[����]insertProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//��ǰ�� ������ �����ϴ� �޼ҵ�
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
			System.out.println("[����]updateProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	// ��� ������ �����ϴ� �޼ҵ�
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
			System.out.println("[����]updateProductAmount() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	
	//��ǰ ���� ���� �޼ҵ�
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
			System.out.println("[����]updateAmunt() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//�ش� ��ǰ ���� �޼ҵ�
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
			System.out.println("[����]deleteProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	//�ش� ��ǰ ���� �޼ҵ�
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
			System.out.println("[����]deleteSerialProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	
	
	
	
	//��� ��ǰ �˻� �޼ҵ�
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
			System.out.println("[����]selectAllProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	
	//Ư�� ��ǰ �˻� �޼ҵ�
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
			System.out.println("[����]selectProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	
	//��ǰ �ø��� �ѹ��� ���޹޾� �ش� ��ǰ�� ������ ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]selectProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	
	//���� �˻��޼ҵ�
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
			System.out.println("[����]selectProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
}
