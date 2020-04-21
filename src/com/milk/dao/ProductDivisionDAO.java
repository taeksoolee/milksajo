package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.milk.dto.ProductDTO;
import com.milk.dto.ProductDivisionDTO;

public class ProductDivisionDAO extends JdbcDAO{
	private static ProductDivisionDAO _dao;
	
	public ProductDivisionDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new ProductDivisionDAO();
	}
	
	public static ProductDivisionDAO getDAO() {
		return _dao;
	}
	
	//새로운 제품구분을 추가하기 위한 메소드
	public int insertProductDivision(ProductDivisionDTO pd) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "insert into product_division values(?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pd.getPdDivision());
			pstmt.setString(2, pd.getPdFeature());
			pstmt.setString(3, pd.getPdStdsize());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertProductDivision() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//제품의 정보를 수정하는 메소드
	public int updateProductDivision(ProductDivisionDTO pd) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "update product_division set PD_FEATURE=?, PD_STDSIZE=? where PD_DIVISION=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pd.getPdFeature());
			pstmt.setString(2, pd.getPdStdsize());
			pstmt.setString(3, pd.getPdDivision());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateProductDivision() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//해당 제품구분 삭제 메소드
	public int deleteProductDivision(ProductDivisionDTO pd) {
		Connection con =null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "delete from product where pd_division=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pd.getPdDivision());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteProductDivision() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//모든 제품구분 검색 메소드
	public List<ProductDivisionDTO> selectAllProductDivision() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProductDivisionDTO> list = new ArrayList<ProductDivisionDTO>();
		try {
			con = getConnection();
			
			String sql = "select * from product_division order by pd_division";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDivisionDTO pd = new ProductDivisionDTO();
				
				pd.setPdDivision(rs.getString("pd_division"));
				pd.setPdFeature(rs.getString("pd_feature"));
				pd.setPdStdsize(rs.getString("pd_stdSize"));
				
				list.add(pd);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllProductDivision() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}
