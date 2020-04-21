package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.milk.dto.InputProductDTO;
import com.milk.dto.ProductDTO;

public class InputProductDAO extends JdbcDAO{
	private static InputProductDAO _dao;
	
	private InputProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new InputProductDAO();
	}
	
	public static InputProductDAO getDAO() {
		return _dao;
	}
// �Է� �޼ҵ�
	public int insertInputProduct(InputProductDTO input) {
		int rows = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		
		try {
			conn = getConnection();
			
			//�԰� ���� ���
			if(input.getIpAmount() == 0) {
				return 0;
			}
			
			// insert into input_product values('1234567890', SYSDATE, "1001", "1");
			String sql = "insert into input_product values(?, SYSDATE, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, input.getIpEmployeeNo());
			ps.setInt(2, input.getIpSerialNo());
			ps.setInt(3, input.getIpAmount());
			rows = ps.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[����]insertInputProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
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
	
	
}
