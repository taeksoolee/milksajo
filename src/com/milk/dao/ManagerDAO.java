package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.milk.dto.ManagerDTO;

public class ManagerDAO extends JdbcDAO{
	private static ManagerDAO _dao;
	
	private ManagerDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ManagerDAO();
	}
	
	public static ManagerDAO getDAO() {
		return _dao;
	}
// 입력 메소드
	public int insertManager(ManagerDTO manager) {
		Connection conn = null;
		PreparedStatement ps = null;
		int rows=0;
		try {
			conn = getConnection();
			
			String sql = "INSERT iNTO MANAGER VALUES(?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, manager.getmEmployeeNo());
			ps.setString(2, manager.getmPassword());
			ps.setString(3, manager.getmName());
			ps.setInt(4, manager.getmGrade());
			
			rows = ps.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]insertManager() 메소드의 SQL 오류 = "+e.getMessage());
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
	public int updateManager(ManagerDTO manager) {
		Connection conn = null;
		PreparedStatement ps = null;
		int rows=0;
		try {
			conn = getConnection();
			
			String sql = "UPDATE MANAGER SET m_password=?, m_name=?, m_grade where m_employee_no=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, manager.getmPassword());
			ps.setString(2, manager.getmName());
			ps.setInt(3, manager.getmGrade());
			ps.setInt(4, manager.getmEmployeeNo());
			
			rows = ps.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]updateManager() 메소드의 SQL 오류 = "+e.getMessage());
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
// 삭제 메소드	
	public int deleteManager(int m_employee_no) {
		Connection conn = null;
		PreparedStatement ps = null;
		int rows = 0;
		try {
			conn = getConnection();
			
			String sql="DELETE FROM MANAGER WHERE m_employee_no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, m_employee_no);
			
			rows = ps.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]deleteManager() 메소드의 SQL 오류 = "+e.getMessage());
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
// 다중검색 메소드	
	public List<ManagerDTO> selectAllManager() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ManagerDTO> managerList = new ArrayList<ManagerDTO>();
		try {
			conn = getConnection();
			
			String sql = "SELECT * From MANAGER ORDER BY m_employee_no DESC";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ManagerDTO manager=new ManagerDTO();
				manager.setmEmployeeNo(rs.getInt("m_employee_no"));
				manager.setmPassword(rs.getString("m_password"));
				manager.setmName(rs.getString("m_name"));
				manager.setmGrade(rs.getInt("m_grade"));
				managerList.add(manager);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllManager() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps, rs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return managerList;
	}
// 단일검색 메소드	
	public ManagerDTO selectNoManager(int m_employee_no) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ManagerDTO manager = null;
		
		try {
			conn = getConnection();
			
			String sql = "SELECT * From MANAGER WHERE m_employee_no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, m_employee_no);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				manager = new ManagerDTO();
				
				manager.setmEmployeeNo(rs.getInt("m_employee_no"));
				manager.setmPassword(rs.getString("m_password"));
				manager.setmName(rs.getString("m_name"));
				manager.setmGrade(rs.getInt("m_grade"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectManager() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			try {
				close(conn, ps, rs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return manager;
	}
}
