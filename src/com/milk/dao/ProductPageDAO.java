package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.milk.dto.ProductPageDTO;

public class ProductPageDAO extends JdbcDAO{
	private static ProductPageDAO _dao;
	
	private ProductPageDAO() {}
	
	static {
		_dao = new ProductPageDAO();
	}
	
	public static ProductPageDAO getDAO() {
		return _dao;
	}
	
	
	//관리자 페이지에서 페이지에 대한 정보를 입력
	public int InsertProductPage(ProductPageDTO page) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="INSERT PRODUCT_PAGE VALUES(PRODUCT_PAGE_SEQ.NEXTVAL, ?, ?, ?)";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, page.getPpSerialNo());
			pstmt.setString(2, page.getPpMainImage());
			pstmt.setInt(3, page.getPpEmployeeNo());
			
			rows=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("[에러]InsertProductPage() 메소드의 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}


	//페이지의 메인 이미지 수정
	public int updateProductPage(ProductPageDTO page) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="UPDATE PRODUCT_PAGE  SET pp_main_image=?, pp_serial_no=? WHERE pp_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, page.getPpMainImage());
			pstmt.setInt(2, page.getPpSerialNo());
			pstmt.setInt(3, page.getPpSerialNo());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateProductPage() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	// page 리스트 전체를 가져오는 메소드
	public List<ProductPageDTO> selectAllPage(){
		List<ProductPageDTO> list = new ArrayList<ProductPageDTO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			String sql = "select * from product_page order by pp_no";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductPageDTO page = new ProductPageDTO();
				
				page.setPpNo(rs.getInt("pp_no"));
				page.setPpSerialNo(rs.getInt("pp_serial_no"));
				page.setPpMainImage(rs.getString("pp_main_image"));
				page.setPpEmployeeNo(rs.getInt("pp_employee_no"));
				
				list.add(page);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllPage() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(conn, ps, rs);
		}
		return list;
	}
	
	// page 리스트 전체를 가져오는 메소드
	public List<ProductPageDTO> selectMgrAllPage(){
		List<ProductPageDTO> list = new ArrayList<ProductPageDTO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			String sql = "select * from product_page order by pp_no";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductPageDTO page = new ProductPageDTO();
				
				page.setPpNo(rs.getInt("pp_no"));
				page.setPpSerialNo(rs.getInt("pp_serial_no"));
				page.setPpMainImage(rs.getString("pp_main_image"));
				page.setPpEmployeeNo(rs.getInt("pp_employee_no"));
				
				list.add(page);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllPage() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(conn, ps, rs);
		}
		return list;
	}
	
	
	
	//페이지번호 전달받아 제품 이미지 검색
	public List<ProductPageDTO> selectImage(int no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductPageDTO> pageList = new ArrayList<ProductPageDTO>();
		try {
			con=getConnection();
			String sql="select pp_serial_no, pp_main_image from product_page where pp_no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductPageDTO page = new ProductPageDTO();
				page.setPpSerialNo(rs.getInt("pp_serial_no"));
				page.setPpMainImage(rs.getString("pp_main_image"));
				pageList.add(page);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectImage() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return pageList;
	}
	
	//시리얼넘버 전달받아 제품 이미지 검색
	public ProductPageDTO selectSerial(int no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductPageDTO page = null;
		try {
			con=getConnection();
			String sql="select pp_main_image from product_page where pp_serial_no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				page = new ProductPageDTO();
				page.setPpMainImage(rs.getString("pp_main_image"));
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectSerial() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return page;
	}
	
	
}
