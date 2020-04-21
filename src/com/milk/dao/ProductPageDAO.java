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
	
	
	//������ ���������� �������� ���� ������ �Է�
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
			System.out.println("[����]InsertProductPage() �޼ҵ��� ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}


	//�������� ���� �̹��� ����
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
			System.out.println("[����]updateProductPage() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	// page ����Ʈ ��ü�� �������� �޼ҵ�
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
			System.out.println("[����]selectAllPage() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(conn, ps, rs);
		}
		return list;
	}
	
	// page ����Ʈ ��ü�� �������� �޼ҵ�
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
			System.out.println("[����]selectAllPage() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(conn, ps, rs);
		}
		return list;
	}
	
	
	
	//��������ȣ ���޹޾� ��ǰ �̹��� �˻�
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
			System.out.println("[����]selectImage() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return pageList;
	}
	
	//�ø���ѹ� ���޹޾� ��ǰ �̹��� �˻�
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
			System.out.println("[����]selectSerial() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return page;
	}
	
	
}
