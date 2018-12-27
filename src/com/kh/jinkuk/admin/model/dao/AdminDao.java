package com.kh.jinkuk.admin.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.admin.model.vo.Admin;

public class AdminDao {
	private Properties prop = new Properties();
	
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//관리자 페이지 공고 게시물 관리
	public ArrayList<Admin> selectAll(Connection con) {
		ArrayList<Admin> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "SELECT USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT"
				+ " FROM MEMBER WHERE STATUS='Y' AND USER_DIV='신청자'";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);	

			list= new ArrayList<Admin>();
			System.out.println(query);
			while(rset.next()) {
				Admin m = new Admin();
				
				
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setU_date(rset.getDate("U_DATE"));
				m.setBlackList(rset.getString("BLACKLIST"));
				m.setC_money(rset.getInt("C_MONEY"));
				m.setC_point(rset.getInt("C_POINT"));
	
			
				
				list.add(m);
			
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return list;
	}

	public ArrayList<Admin> selectDeliver(Connection con) {
		ArrayList<Admin> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "SELECT USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT FROM MEMBER WHERE STATUS='Y' AND USER_DIV='기사'";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);	

			list= new ArrayList<Admin>();
			System.out.println(query);
			while(rset.next()) {
				Admin m = new Admin();
				
				
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setU_date(rset.getDate("U_DATE"));
				m.setBlackList(rset.getString("BLACKLIST"));
				m.setC_money(rset.getInt("C_MONEY"));
				m.setC_point(rset.getInt("C_POINT"));
	
			
				
				list.add(m);
			
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return list;
	}

	public ArrayList<Admin> selectBlack(Connection con) {
		ArrayList<Admin> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBlack");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);	

			list= new ArrayList<Admin>();
			System.out.println(query);
			while(rset.next()) {
				Admin m = new Admin();
				
				
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setU_date(rset.getDate("U_DATE"));
				m.setBlackList(rset.getString("BLACKLIST"));
				m.setC_money(rset.getInt("C_MONEY"));
				m.setC_point(rset.getInt("C_POINT"));
	
			
				
				list.add(m);
			
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return list;
	}

	public int goBlack(Connection con, Admin m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBlack");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}











