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
import com.kh.jinkuk.admin.model.vo.Announcment;
import com.kh.jinkuk.admin.model.vo.Change;
import com.kh.jinkuk.admin.model.vo.Exchange;
import com.kh.jinkuk.admin.model.vo.Inquiry;
import com.kh.jinkuk.admin.model.vo.Point;


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
	
	public int deleteNotice(Connection con, Announcment m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getG_NO());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteToday(Connection con, Announcment m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getG_NO());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	public int deleteInquiry(Connection con, Inquiry m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteInquiry");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getM_no());
			
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

	public int getListCountAn(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query =prop.getProperty("AnnounceCount");
			
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

	public ArrayList<Announcment> selectListAn(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Announcment> list = null;
		
		String query = "SELECT RNUM,G_NO, G_S_AREA, G_E_AREA,G_TITLE, G_DAY, G_SIZE, G_PRICE, G_P_DIV "
				+ "		FROM (SELECT ROWNUM RNUM,G_NO, G_S_AREA, G_E_AREA, G_TITLE, G_DAY, G_SIZE, G_PRICE, G_P_DIV "
				+ "			  FROM (SELECT A.G_NO, A.G_S_AREA, A.G_E_AREA, A.G_TITLE, A.G_DAY, A.G_SIZE, A.G_PRICE, AP.G_P_DIV "
				+ "					FROM ANNOUNCEMENT A "
				+ "					JOIN ANNOUNCEMENT_PAYMENT AP ON(A.G_NO = AP.G_NO) "
				+ "					WHERE A.STATUS='Y' "
				+ "					AND A.G_DIV='일반' "
				+ "					ORDER BY G_NO ASC)) "
				+ "WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			

			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Announcment>();
			
			while(rset.next()) {
				Announcment m = new Announcment();
				
				
			m.setG_NO(rset.getInt("G_NO"));
			m.setG_S_AREA(rset.getString("G_S_AREA"));
			m.setG_E_AREA(rset.getString("G_E_AREA"));
			m.setG_TITLE(rset.getString("G_TITLE"));
			m.setG_DAY(rset.getDate("G_DAY"));
			m.setG_SIZE(rset.getString("G_SIZE"));
			m.setG_PRICE(rset.getInt("G_PRICE"));
			m.setG_P_DIV(rset.getString("G_P_DIV"));
	
			
				
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
	
	
	public int getListCountTo(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query =prop.getProperty("AnnounceCount");
			
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

	public ArrayList<Announcment> selectListTo(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Announcment> list = null;
		
		String query = "SELECT RNUM,G_NO, G_S_AREA, G_E_AREA,G_TITLE, G_DAY, G_SIZE, G_PRICE, G_P_DIV "
				+ "		FROM (SELECT ROWNUM RNUM,G_NO, G_S_AREA, G_E_AREA, G_TITLE, G_DAY, G_SIZE, G_PRICE, G_P_DIV "
				+ "			  FROM (SELECT A.G_NO, A.G_S_AREA, A.G_E_AREA, A.G_TITLE, A.G_DAY, A.G_SIZE, A.G_PRICE, AP.G_P_DIV "
				+ "					FROM ANNOUNCEMENT A "
				+ "					JOIN ANNOUNCEMENT_PAYMENT AP ON(A.G_NO = AP.G_NO) "
				+ "					WHERE A.STATUS='Y' "
				+ "					AND A.G_DIV='당일' "
				+ "					ORDER BY G_NO ASC)) "
				+ "WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			

			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Announcment>();
			
			while(rset.next()) {
				Announcment m = new Announcment();
				
				
			m.setG_NO(rset.getInt("G_NO"));
			m.setG_S_AREA(rset.getString("G_S_AREA"));
			m.setG_E_AREA(rset.getString("G_E_AREA"));
			m.setG_TITLE(rset.getString("G_TITLE"));
			m.setG_DAY(rset.getDate("G_DAY"));
			m.setG_SIZE(rset.getString("G_SIZE"));
			m.setG_PRICE(rset.getInt("G_PRICE"));
			m.setG_P_DIV(rset.getString("G_P_DIV"));
	
			
				
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

	public int getListCountIn(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query =prop.getProperty("InquiryCount");
			
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

	public ArrayList<Inquiry> selectListIn(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = null;
		
		String query = prop.getProperty("selectInquiry");
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			

			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Inquiry>();
			
			while(rset.next()) {
				Inquiry m = new Inquiry();
				
				m.setM_no(rset.getInt("M_NO"));
				m.setM_title(rset.getString("M_TITLE"));
				m.setM_context(rset.getString("M_CONTEXT"));
				m.setM_date(rset.getDate("M_DATE"));
				m.setU_no(rset.getString("USER_ID"));
				
			
				
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

	public Inquiry selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquiry n = null;
		int result = 0;
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			System.out.println(query);
			pstmt.setInt(1, num);
			

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Inquiry();
				
				n.setM_no(rset.getInt("M_NO"));
				n.setM_title(rset.getString("M_TITLE"));
				n.setM_context(rset.getString("M_CONTEXT"));
				n.setM_date(rset.getDate("M_DATE"));
				n.setU_no(rset.getString("USER_ID"));
				
				result = pstmt.executeUpdate();
				
			}
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return n;
	}

	public int insertReply(Connection con, Inquiry b) {
		PreparedStatement pstmt = null;
		int result=0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getM_context());
			pstmt.setInt(2, b.getRef_mno());
	

			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;



	}

	public ArrayList<Inquiry> selectReplyList(Connection con, int i) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = null;
		
		String query = "SELECT I.M_CONTEXT, I.M_DATE FROM INQUIRY I WHERE I.REPLY_LEVEL=1 AND I.REF_MNO = ? AND I.STATUS ='Y'";
				
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Inquiry>();
			
			while(rset.next()) {
				Inquiry b = new Inquiry();
				

				b.setM_context(rset.getString("M_CONTEXT"));
				b.setM_date(rset.getDate("M_DATE"));
				
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;



	}

	public Inquiry selectOneReply(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquiry n = null;
		int result = 0;
		
		String query = prop.getProperty("selectOneReply");
		
		try {
			pstmt = con.prepareStatement(query);
			System.out.println(query);
			pstmt.setInt(1,num);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Inquiry();
				

				n.setM_context(rset.getString("M_CONTEXT"));
				n.setM_date(rset.getDate("M_DATE"));

				
			}


		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return n;
	}

	public int getListCountMo(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query =prop.getProperty("ChargeCount");
			
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

	public ArrayList<Change> selectListMo(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Change> list = null;
		
		String query = prop.getProperty("selectCharge");
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			

			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Change>();
			
			while(rset.next()) {
				Change m = new Change();
				
				m.setCh_no(rset.getInt("CH_NO"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setUser_name(rset.getString("USER_NAME"));
				m.setCh_rmoney(rset.getInt("CH_RMONEY"));
				m.setCh_cmoney(rset.getInt("CH_CMONEY"));
				m.setBank_num(rset.getString("BANK_NUM"));
				m.setBank_name(rset.getString("BANK_NAME"));
				m.setCh_date(rset.getDate("CH_DATE"));

				
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

	public int getListCountPo(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query =prop.getProperty("PointCount");
			
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

	public ArrayList<Point> selectListPo(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Point> list = null;
		
		String query = prop.getProperty("selectPoint");
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Point>();
			
			while(rset.next()) {
				Point m = new Point();
				
				m.setP_no(rset.getInt("RNUM"));
				m.setUserId(rset.getString("USER_ID"));
				m.setP_date(rset.getDate("P_DATE"));
				m.setP_usePoint(rset.getInt("P_USEPOINT"));
				m.setUser_point(rset.getInt("C_POINT"));
				m.setP_note(rset.getString("G_TITLE"));

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

	public int getListCountEx(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query =prop.getProperty("ExchangeCount");
			
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

	public ArrayList<Exchange> selectListEx(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Exchange> list = null;
		
		String query = prop.getProperty("selectExchange");
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Exchange>();
			
			while(rset.next()) {
				Exchange m = new Exchange();
				m.setC_no(rset.getInt("RNUM"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setUser_name(rset.getString("USER_NAME"));
				m.setcMoney(rset.getInt("C_CMONEY"));
				m.setrMoney(rset.getInt("C_RMONEY"));
				m.setBankNum(rset.getString("BANK_NUM"));
				m.setBankName(rset.getString("BANK_NAME"));
				m.setcDate(rset.getDate("C_DATE"));
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





