package com.milk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

//DBCP(DataBase Connection Pool) 관련 인스턴스를 생성하여 Connection 인스턴스
//반환하거나 Connection 인스턴스를 제거하는 기능을 제공하기 위한 클래스
// => 저장매체가 DBMS인 DAO 클래스에서 상속받아 사용 
// => 추상클래스로 선언하는 것을 권장
public abstract class JdbcDAO {
	private static PoolDataSource _pds;
	
	static {
		_pds=PoolDataSourceFactory.getPoolDataSource();
		
		try {
			_pds.setConnectionFactoryClassName("oracle.jdbc.driver.OracleDriver");
			_pds.setURL("jdbc:oracle:thin:@182.237.126.17:1521:xe");
			_pds.setUser("milk");
			_pds.setPassword("mk1234");
			_pds.setInitialPoolSize(3);
			_pds.setMaxPoolSize(5);
			_pds.getConnection().close();
			
			/*
			_pds.setConnectionFactoryClassName("oracle.jdbc.driver.OracleDriver");
			_pds.setURL("jdbc:oracle:thin:@1:1521:xe");
			_pds.setUser("scott");
			_pds.setPassword("tiger");
			_pds.setInitialPoolSize(3);
			_pds.setMaxPoolSize(5);
			_pds.getConnection().close();
			*/
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection con=null;
		try {
			con=_pds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close(Connection con) {
		try {
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
