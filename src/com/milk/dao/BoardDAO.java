package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.milk.dto.BoardDTO;

public class BoardDAO extends JdbcDAO{
	private static BoardDAO _dao;
	
	public BoardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new BoardDAO();
	}
	
	public static BoardDAO getDAO() {
		return _dao;
	}
	
	//--------------------1.�Խñ� �Է�(�Խ���)------------------------//
	
	public int insertBoarder(BoardDTO board) {
		Connection con=null;
		PreparedStatement ps=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="insert into boarder values(?,?,?,?,sysdate,0,?,?,?,?,?,?,?)";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, board.getNum());
			ps.setString(2, board.getId());
			ps.setString(3, board.getWriter());
			ps.setString(4, board.getSubject());
			ps.setInt(5, board.getRef());
			ps.setInt(6, board.getReStep());
			ps.setString(7, board.getContent());
			ps.setString(8, board.getIp());
			ps.setInt(9, board.getState());
			ps.setString(10, board.getQna());
			ps.setInt(11, board.getSerial());
			
			rows=ps.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("[����]insertBoarder() �޼ҵ��� ����");
		} finally {
			close(con, ps);
			
		}
		return rows;
	}
	
	//-------------2. �Խñ� ��ȣ�� ����� �Խñ� ����--------------------//
		
	public int deleteBoard(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update boarder set state=9 where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[����]deleteBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		//-------------------- 3. �Խñ� ����-------------------// 
		
		public int updateBoard(BoardDTO board) {
			Connection con=null;
			PreparedStatement ps=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update boarder set subject=?,state=?,content=?,qna=? where num=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, board.getSubject());
				ps.setInt(2, board.getState());
				ps.setString(3, board.getContent());
				ps.setString(4, board.getQna());
				ps.setInt(5, board.getNum());
				
				rows=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[����]updateBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, ps);
			}
			return rows;
		}
	
	// ------------------4. �θ�� ���� ���� �޾� ���̺� �Խñ� ���� ���� ������ ���� ��ȯ------------------------//
		// 1, 1
		public int updateReStep(int ref, int reStep) {
		Connection con=null;
		PreparedStatement ps=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update boarder set re_step=re_step+1 where ref=? and re_step>?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, reStep);
			
			rows=ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[����]updateBoarder() �޼ҵ��� ����");
		} finally {
			close(con, ps);
		}
		return rows;
	}
	
	//------------------- 5. ������ �����÷��� ȣ��------//
	
	public int selectNextNum() {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int nextNum=0;
		try {
			con=getConnection();
			
			String sql="select boarder_seq.nextval from dual";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				nextNum=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectNextNum() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, ps, rs);
		}
		return nextNum;
	}
	
	//-----------------------------6. �Խñ� ���� �˻� ��ȯ---------------//
	public int selectBoarderCount(String search, String keyword) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {
				String sql="select count(*) from boarder where re_step=0 and state<>9 and state<>3";
				ps=con.prepareStatement(sql);
			} else {
				String sql="select count(*) from boarder where re_step=0 and "+search+" like '%'||?||'%' and state<>9 and state<>3";
				ps=con.prepareStatement(sql);
				ps.setString(1, keyword);
			}
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectBoarderCount() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, ps, rs);
		}
		return count;		
	}
	
	//-------------7. �Խñ� ��ȣ�� �Խñ� �˻�------------//
	public BoardDTO selectNumBoarder(int num) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		BoardDTO board=null;
		try {
			con=getConnection();
			
			String sql="select * from boarder where num=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				board=new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setRegDate(rs.getString("reg_date"));
				board.setReadCount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setReStep(rs.getInt("re_step"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setState(rs.getInt("state"));	
				board.setQna(rs.getString("qna"));
				
			}
		} catch (SQLException e) {
			System.out.println("[����]selectNumBoarder() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, ps, rs);
		}
		return board;
	}
	
	//--------------------8. ������, ������ ��ȣ�� ����� �Խñ� �˻� -------------------------//
	public List<BoardDTO> selectBoarder(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<BoardDTO> boardList=new ArrayList<BoardDTO>();
		try {
			con=getConnection();
			
			if(keyword.equals("")) {
				String sql="select * from (select rownum rn,temp.* from (select * from boarder where re_step=0 and state<>9 and state<>3 order by num desc) temp) where rn between ? and ?";
				ps=con.prepareStatement(sql);
				ps.setInt(1, startRow);
				ps.setInt(2, endRow);
			} else {
				String sql="select * from (select rownum rn,temp.* from "
						+"(select * from boarder where "
						+search+" like '%'||?||'%' and state!=9 and state<>9 and state<>3"
						+"order by num desc) "
						+"temp) where rn between ? and ?";
				ps=con.prepareStatement(sql);
				ps.setString(1, keyword);
				ps.setInt(2, startRow);
				ps.setInt(3, endRow);
			}
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO board=new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setRegDate(rs.getString("reg_date"));
				board.setReadCount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setReStep(rs.getInt("re_step"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setState(rs.getInt("state"));
				board.setQna(rs.getString("qna"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectBoarder() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, ps, rs);
		}
		return boardList;
	}
	
	//-------------------9. �Խñ� ��ȸ�� ����--------------//
	public int updateReadCount(int num) {
		Connection con=null;
		PreparedStatement ps=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update boarder set readcount=readcount+1 where num=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			
			rows=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]updateReadCount() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, ps);
		}
		return rows;
	}
	
	//--------------------10. �����ü ��ȸ(�Խñ۹�ȣ�� ����)-------------------------//
	public List<BoardDTO> selectAllComment(int reg) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<BoardDTO> boardList=new ArrayList<BoardDTO>();
		try {
			con=getConnection();
			String sql="select * from boarder where re_step<>0 and ref=? order by re_step desc";
			ps=con.prepareStatement(sql);
			ps.setInt(1, reg);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO board=new BoardDTO();
				
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setRegDate(rs.getString("reg_date"));
				board.setReadCount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setReStep(rs.getInt("re_step"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setState(rs.getInt("state"));
				board.setQna(rs.getString("qna"));
				
				
				boardList.add(board);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectAllBoarder(int reg) �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, ps, rs);
		}
		return boardList;
	}
	//--------------------11. �Խñ���ü ��ȸ-------------------------//
	public List<BoardDTO> selectAllBoarder() {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<BoardDTO> boardList=new ArrayList<BoardDTO>();
		try {
			con=getConnection();
			String sql="select * from boarder where re_step=0 order by re_step desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO board=new BoardDTO();
				
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setRegDate(rs.getString("reg_date"));
				board.setReadCount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setReStep(rs.getInt("re_step"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setState(rs.getInt("state"));
				board.setQna(rs.getString("qna"));
				
				
				boardList.add(board);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectAllBoarder(int reg) �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, ps, rs);
		}
		return boardList;
	}
	
	//--------------------12. �Խñ� �Է�(����)------------------------//
		public int insertReply(BoardDTO board) {
			Connection con=null;
			PreparedStatement ps=null;
			int rows=0;
			
			try {
				con=getConnection();
				String sql="insert into boarder values(?,?,?,null,sysdate,0,?,?,?,null,?,null, null)";
				
				ps=con.prepareStatement(sql);
				ps.setInt(1, board.getNum());
				ps.setString(2, board.getId());
				ps.setString(3, board.getWriter());
				ps.setInt(4, board.getRef());
				ps.setInt(5, board.getReStep());
				ps.setString(6, board.getContent());
				ps.setInt(7, board.getState());
				
				
				rows=ps.executeUpdate();
			
			} catch (SQLException e) {
				System.out.println("[����]insertBoarder() �޼ҵ��� ����");
			} finally {
				close(con, ps);
				
			}
			return rows;
		}
		
		//-----------------------------13. �Խñ� ���� �˻� ��ȯ---------------//
		public int selectReplyCount(int num, String search, String keyword) {
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				
				if(keyword.equals("")) {
					String sql="select count(*) from boarder where re_step<>0 and ref=?";
					ps=con.prepareStatement(sql);
					ps.setInt(1, num);
				} else {
					String sql="select count(*) from boarder where re_step<>0 and and ref=? "+search+" like '%'||?||'%'";
					ps=con.prepareStatement(sql);
					ps.setInt(1, num);
					ps.setString(2, keyword);
				}
				
				rs=ps.executeQuery();
				
				if(rs.next()) {
					count=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("[����]selectBoarderCount() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, ps, rs);
			}
			return count;		
		}
		
		//
		public int removeReply(int num) {
			Connection con=null;
			PreparedStatement ps=null;
			int row=0;
			try {
				con=getConnection();
				
				String sql="delete from boarder where num=?";
				ps=con.prepareStatement(sql);
				ps.setInt(1, num);
				
				row = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("[����]removeReply() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, ps);
			}
			return row;
		}
		
		//--------------------14. �Խñ� �Է�(����)------------------------//
				public int insertReview(BoardDTO board) {
					Connection con=null;
					PreparedStatement ps=null;
					int rows=0;
					
					try {
						con=getConnection();
						String sql="insert into boarder values(null,?,?,null,sysdate,0,?,?,?,null,3,null,?)";
						
						ps=con.prepareStatement(sql);
						ps.setString(1, board.getId());
						ps.setString(2, board.getWriter());
						ps.setInt(3, board.getRef());
						ps.setInt(4, board.getReStep());
						ps.setString(5, board.getContent());
						ps.setInt(6, board.getSerial());
						
						rows=ps.executeUpdate();
					
					} catch (SQLException e) {
						System.out.println("[����]insertBoarder() �޼ҵ��� ����");
					} finally {
						close(con, ps);
						
					}
					return rows;
				}
	//-------------------------15.���� ��ü ��ȸ----------------//
				public List<BoardDTO> selectAllreview() {
					Connection con=null;
					PreparedStatement ps=null;
					ResultSet rs=null;
					List<BoardDTO> boardList=new ArrayList<BoardDTO>();
					try {
						con=getConnection();
						String sql="select * from boarder where state=3 order by reg_date desc";
						ps=con.prepareStatement(sql);
						rs=ps.executeQuery();
						
						while(rs.next()) {
							BoardDTO board=new BoardDTO();
							
							board.setNum(rs.getInt("num"));
							board.setId(rs.getString("id"));
							board.setWriter(rs.getString("writer"));
							board.setSubject(rs.getString("subject"));
							board.setRegDate(rs.getString("reg_date"));
							board.setReadCount(rs.getInt("readcount"));
							board.setRef(rs.getInt("ref"));
							board.setReStep(rs.getInt("re_step"));
							board.setContent(rs.getString("content"));
							board.setIp(rs.getString("ip"));
							
							boardList.add(board);
						}
					} catch (SQLException e) {
						System.out.println("[����]selectAllreview() �޼ҵ��� SQL ���� = "+e.getMessage());
					} finally {
						close(con, ps, rs);
					}
					return boardList;
				}
				
				
				
				
				//-------------------------16.��ǰ�� ���� ��ȸ----------------//
				public List<BoardDTO> selectReview(int no) {
					Connection con=null;
					PreparedStatement ps=null;
					ResultSet rs=null;
					List<BoardDTO> boardList=new ArrayList<BoardDTO>();
					try {
						con=getConnection();
						String sql="select * from boarder where state=3 and serial=?";
						ps=con.prepareStatement(sql);
						ps.setInt(1, no);
						rs=ps.executeQuery();
						
						while(rs.next()) {
							BoardDTO board=new BoardDTO();
							
							board.setNum(rs.getInt("num"));
							board.setId(rs.getString("id"));
							board.setWriter(rs.getString("writer"));
							board.setSubject(rs.getString("subject"));
							board.setRegDate(rs.getString("reg_date"));
							board.setReadCount(rs.getInt("readcount"));
							board.setRef(rs.getInt("ref"));
							board.setReStep(rs.getInt("re_step"));
							board.setContent(rs.getString("content"));
							board.setIp(rs.getString("ip"));
							
							boardList.add(board);
						}
					} catch (SQLException e) {
						System.out.println("[����]selectReview(int reg) �޼ҵ��� SQL ���� = "+e.getMessage());
					} finally {
						close(con, ps, rs);
					}
					return boardList;
				}
				
				
				
				
				
				
}

