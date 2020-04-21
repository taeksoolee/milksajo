package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.milk.dto.MemberDTO;

public class MemberDAO extends JdbcDAO {
	// 선택 검색을 위한 상수 필드
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
	
	//회원정보를 전달받아 MEMBER 테이블에 저장하고 저장행의 갯수를 반환하는 메소드
	// => 아이디, 비밀번호, 이름, 이메일, 전화번호, 우편번호, 기본주소, 상세주소는 입력값을 이용하여 저장
	// => 회원상태 - 0 : 휴면회원, 1 : 일반회원, 7: 관리자, 9: 삭제회원
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
			System.out.println("[에러]insertMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 해당 아이디의 회원정보를 검색하여 반환하는 단일검색 메소드	
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
			System.out.println("[에러]selectIdMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 해당 회원정보의 최신 로그인 일자를 현재로 업데이트하고 변경행의 갯수를 반환하는 메소드
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
			System.out.println("[에러]updateLastLogin() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 변경행의 갯수를 반환하는 메소드
	// => 비밀번호, 이름, 이메일, 전화번호, 우편번호, 기본주소, 상세주소 변경 
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
			System.out.println("[에러]updateMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//ID를 전달받아 MEMBER 테이블에 저장된 회원정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
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
			System.out.println("[에러]deleteMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//MEMBER 테이블에 저장된 회원목록을 검색하여 반환하는 메소드
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
			System.out.println("[에러]selectAllMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return memberList;		
	}
	
	//ID와 상태를 전달받아 MEMBER 테이블에 저장된 해당 회원의 상태를 변경하고 변경행의 갯수를 반환하는 메소드
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
			System.out.println("[에러]updateStatusMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//아이디찾기페이지 : 이름과 생년월일을 입력받아 아이디를 반환받는 메소드
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
			System.out.println("[에러]selectSearchMemberId() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		
		// 결과값 없으면 null 반환
		return id;		
	}
	
	//비밀번호찾기 : 아이디와 이메일을 입력받아 아이디를 반환받는 메소드
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
			System.out.println("[에러]selectSearchMemberPwd() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		
		//결과값 없으면 null 반환
		return m;		
	}
	
	
	
	//MEMBER 테이블에 저장된 회원목록을 검색하여 반환하는 메소드(옵션(joindate, birthday, lastlogin)을 지정하여 범위(다중) 검색)
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
				// 잘못검색하면 널로 반환
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
				System.out.println("[에러]selectOPMember() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return memberList;		
		}
}
