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
	
	public int goBlackDeliver(Connection con, Admin m) {
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
	

	public int deleteMember(Connection con, Admin m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
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
	
	public int deleteDeliver(Connection con, Admin m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
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

	public int deleteBlack(Connection con, Admin m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBlack");
		
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


	
	
	public int getListCount(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query ="SELECT COUNT(*) FROM MEMBER WHERE USER_DIV='신청자' AND STATUS='Y'";
			
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public int getListCount2(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query ="SELECT COUNT(*) FROM MEMBER WHERE USER_DIV='기사' AND STATUS='Y'";
			
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	
	public int getListCount3(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query =prop.getProperty("blackListCount");
			
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	
	
	public ArrayList<Admin> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Admin> list = null;
		
		String query = "SELECT RNUM,U_NO, USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
				+ "		FROM (SELECT ROWNUM RNUM,U_NO, USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
				+ "			  FROM (SELECT U_NO, USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
				+ "					FROM MEMBER "
				+ "					WHERE STATUS='Y' "
				+ "					AND USER_DIV='신청자'"
				+ "					ORDER BY U_NO ASC)) "
				+ "		WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
		
	
		
		return list;
	}

	public ArrayList<Admin> selectList2(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Admin> list = null;
		
		String query = "SELECT RNUM,U_NO, USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
				+ "		FROM (SELECT ROWNUM RNUM,U_NO, USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
				+ "			  FROM (SELECT U_NO, USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
				+ "					FROM MEMBER "
				+ "					WHERE STATUS='Y' "
				+ "					AND USER_DIV='기사'"
				+ "					ORDER BY U_NO ASC)) "
				+ "		WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
		
	
		
		return list;
	}

	public ArrayList<Admin> selectBlackList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Admin> list = null;
		
		String query = prop.getProperty("selectblackListPaging");
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
		
	
		
		return list;
	}

	public int cancleBlack(Connection con, Admin m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("cancleBlack");
		
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

	public ArrayList<Admin> searchId(Connection con, String userId) {
		ArrayList<Admin> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query ="SELECT USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
					+ "FROM MEMBER "
					+ "WHERE USER_ID LIKE '%'||?||'%' AND USER_DIV='신청자'";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
	
		return list;
	}

	public ArrayList<Admin> searchName(Connection con, String userName) {
		ArrayList<Admin> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query ="SELECT USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
					+ "FROM MEMBER "
					+ "WHERE USER_NAME LIKE '%'||?||'%' AND USER_DIV='신청자'";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
	
		return list;
	}

	public ArrayList<Admin> DeliversearchId(Connection con, String userId) {
		ArrayList<Admin> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query ="SELECT USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
					+ "FROM MEMBER "
					+ "WHERE USER_ID LIKE '%'||?||'%' AND USER_DIV='기사'";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
	
		return list;
	}
	

	public ArrayList<Admin> DeliversearchName(Connection con, String userName) {
		ArrayList<Admin> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query ="SELECT USER_ID, USER_NAME, PHONE, EMAIL, U_DATE, BLACKLIST, C_MONEY, C_POINT "
					+ "FROM MEMBER "
					+ "WHERE USER_NAME LIKE '%'||?||'%' AND USER_DIV='기사'";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
	
		return list;
	}

	public ArrayList<Admin> BlackSearchId(Connection con, String userId) {
		ArrayList<Admin> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query =prop.getProperty("searchId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
	
		return list;
	}

	public ArrayList<Admin> BlackSearchName(Connection con, String userName) {
		ArrayList<Admin> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query =prop.getProperty("searchName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Admin>();
			
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
			close(pstmt);
			close(rset);
		}
	
		return list;
	}




	


}













