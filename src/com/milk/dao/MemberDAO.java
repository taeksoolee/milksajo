package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.milk.dto.MemberDTO;

public class MemberDAO extends JdbcDAO {
	// ���� �˻��� ���� ��� �ʵ�
	public static final int OP_BIRTHDAY = 1;  
	public static final int OP_JOINDATE = 2;  
	public static final int OP_LASTLOGIN = 3;
	
	private static MemberDAO _dao;
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new MemberDAO();
	}
	
	public static MemberDAO getDAO() {
		return _dao;
	}
	
	//ȸ�������� ���޹޾� MEMBER ���̺� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	// => ���̵�, ��й�ȣ, �̸�, �̸���, ��ȭ��ȣ, �����ȣ, �⺻�ּ�, ���ּҴ� �Է°��� �̿��Ͽ� ����
	// => ȸ������ - 0 : �޸�ȸ��, 1 : �Ϲ�ȸ��, 7: ������, 9: ����ȸ��
	public int insertMember(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
	
		try {
			con=getConnection();
			
			String sql="insert into member values(?,?,?,?,?,?,?,?,?,sysdate,sysdate,1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirthday());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getZipcode());
			pstmt.setString(8, member.getAddress1());
			pstmt.setString(9, member.getAddress2());
			
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//���̵� ���޹޾� MEMBER ���̺� �ش� ���̵��� ȸ�������� �˻��Ͽ� ��ȯ�ϴ� ���ϰ˻� �޼ҵ�	
	public MemberDTO selectIdMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO member=null;
		try {
			con=getConnection();
			
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				member=new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setBirthday(rs.getString("birthday"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setZipcode(rs.getString("zipcode"));				
				member.setAddress1(rs.getString("address1"));				
				member.setAddress2(rs.getString("address2"));				
				member.setJoinDate(rs.getString("join_date"));
				member.setLastLogin(rs.getString("last_login"));
				member.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			System.out.println("[����]selectIdMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	//���̵� ���޹޾� MEMBER ���̺� ����� �ش� ȸ�������� �ֽ� �α��� ���ڸ� ����� ������Ʈ�ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int updateLastLogin(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set last_login=sysdate where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]updateLastLogin() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//ȸ�������� ���޹޾� MEMBER ���̺� ����� ȸ�������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	// => ��й�ȣ, �̸�, �̸���, ��ȭ��ȣ, �����ȣ, �⺻�ּ�, ���ּ� ���� 
	public int updateMember(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
	
		try {
			con=getConnection();
			
			String sql="update member set password=?,name=?,birthday=?, phone=?, email=?, zipcode=?, address1=?, address2=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getBirthday());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getZipcode());
			pstmt.setString(7, member.getAddress1());
			pstmt.setString(8, member.getAddress2());
			pstmt.setString(9, member.getId());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]updateMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//ID�� ���޹޾� MEMBER ���̺� ����� ȸ�������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int deleteMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="delete from member where id=?";
			pstmt=con.prepareStatement(sql);			
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]deleteMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//MEMBER ���̺� ����� ȸ������� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public List<MemberDTO> selectAllMember() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<MemberDTO> memberList=new ArrayList<MemberDTO>();
		try {
			con=getConnection();
			
			String sql="select * from member order by id";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member=new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setBirthday(rs.getString("birthday"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setZipcode(rs.getString("zipcode"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setJoinDate(rs.getString("join_date"));
				member.setLastLogin(rs.getString("last_login"));
				member.setStatus(rs.getInt("status"));
				memberList.add(member);				
			}
		} catch (SQLException e) {
			System.out.println("[����]selectAllMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return memberList;		
	}
	
	//ID�� ���¸� ���޹޾� MEMBER ���̺� ����� �ش� ȸ���� ���¸� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int updateStatusMember(String id, int status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update member set status=? where id=?";
			pstmt=con.prepareStatement(sql);			
			pstmt.setInt(1, status);
			pstmt.setString(2, id);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]updateStatusMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//���̵�ã�������� : �̸��� ��������� �Է¹޾� ���̵� ��ȯ�޴� �޼ҵ�
	public String selectSearchMemberId(String name, String birthDay) {
		String id = null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select * from member where name=? and birthday=?";

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, birthDay);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectSearchMemberId() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		
		// ����� ������ null ��ȯ
		return id;		
	}
	
	//��й�ȣã�� : ���̵�� �̸����� �Է¹޾� ���̵� ��ȯ�޴� �޼ҵ�
	public MemberDTO selectSearchMemberPwd(String id, String email) {
		MemberDTO m = null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select * from member where id=? and email=?";

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member=new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setBirthday(rs.getString("birthday"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setZipcode(rs.getString("zipcode"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setJoinDate(rs.getString("join_date"));
				member.setLastLogin(rs.getString("last_login"));
				member.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			System.out.println("[����]selectSearchMemberPwd() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		
		//����� ������ null ��ȯ
		return m;		
	}
	
	
	
	//MEMBER ���̺� ����� ȸ������� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�(�ɼ�(joindate, birthday, lastlogin)�� �����Ͽ� ����(����) �˻�)
		public List<MemberDTO> selectOPMember(String start, String end, int option) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			List<MemberDTO> memberList=new ArrayList<MemberDTO>();
			try {
				con=getConnection();
				
				String sql="select * from member order by id";
				
				switch (option) {
				case 1: 
					sql = "select * from member where birthday between ? and ? order by id";
					break;
				case 2:
					sql = "select * from member where join_date between ? and ? order by id";
					break;
				case 3:
					sql = "select * from member where last_login between ? and ? order by id";
					break;
				// �߸��˻��ϸ� �η� ��ȯ
				default: return memberList;
				}

				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, start);
				pstmt.setString(2, end);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					MemberDTO member=new MemberDTO();
					
					member.setId(rs.getString("id"));
					member.setPassword(rs.getString("password"));
					member.setName(rs.getString("name"));
					member.setBirthday(rs.getString("birthday"));
					member.setPhone(rs.getString("phone"));
					member.setEmail(rs.getString("email"));
					member.setZipcode(rs.getString("zipcode"));
					member.setAddress1(rs.getString("address1"));
					member.setAddress2(rs.getString("address2"));
					member.setJoinDate(rs.getString("join_date"));
					member.setLastLogin(rs.getString("last_login"));
					member.setStatus(rs.getInt("status"));
					memberList.add(member);				
				}
			} catch (SQLException e) {
				System.out.println("[����]selectOPMember() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return memberList;		
		}
}
