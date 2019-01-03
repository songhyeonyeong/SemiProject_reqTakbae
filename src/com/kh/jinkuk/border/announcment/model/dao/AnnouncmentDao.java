package com.kh.jinkuk.border.announcment.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.border.announcment.model.vo.InsertAnnouncment;

public class AnnouncmentDao {
	
	private Properties prop = new Properties();
	
	public AnnouncmentDao() {
		
		String fileName = AnnouncmentDao.class.getResource("/sql/border/announcment/announcment.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	//페이징 처리 후 전체 게시판 조회용 메소드
		public ArrayList<Announcment> selectList(Connection con, int currentPage, int limit) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Announcment> list = null;
			
			String query = prop.getProperty("selectList");
			
			try {
				pstmt = con.prepareStatement(query);
				
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				
				pstmt.setString(1, "일반");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				list = new ArrayList<Announcment>();
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Announcment a = new Announcment();
					
					a.setG_NO(rset.getInt("G_NO"));
					a.setG_TITLE(rset.getString("G_TITLE"));
					a.setG_S_DATE(rset.getDate("G_S_DATE"));
					a.setG_S_AREA(rset.getString("G_S_AREA"));
					a.setG_E_AREA(rset.getString("G_E_AREA"));
					a.setG_PRICE(rset.getInt("G_PRICE"));
					a.setG_SIZE(rset.getString("G_SIZE"));
					a.setG_DAY(rset.getDate("G_DAY"));
					a.setG_P_DIV(rset.getString("G_P_DIV"));
																		
					list.add(a);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
		
			
			return list;
		}
		
		//페이징 처리 후 당일 게시판 조회용 메소드
		public ArrayList<Announcment> selectTodayList(Connection con, int currentPage, int limit) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Announcment> list = null;
			
			String query = prop.getProperty("selectTodayList");
			
			try {
				pstmt = con.prepareStatement(query);
				
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				
				pstmt.setString(1, "당일");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				list = new ArrayList<Announcment>();
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Announcment a = new Announcment();
					
					a.setG_NO(rset.getInt("G_NO"));
					a.setG_TITLE(rset.getString("G_TITLE"));
					a.setG_S_DATE(rset.getDate("G_S_DATE"));
					a.setG_S_AREA(rset.getString("G_S_AREA"));
					a.setG_E_AREA(rset.getString("G_E_AREA"));
					a.setG_PRICE(rset.getInt("G_PRICE"));
					a.setG_SIZE(rset.getString("G_SIZE"));
					a.setG_DAY(rset.getDate("G_DAY"));
					a.setG_P_DIV(rset.getString("G_P_DIV"));
					
					list.add(a);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			System.out.println(list);
			return list;
		}


		public int getListCount(Connection con) {
			
			PreparedStatement pstmt = null;
			int listCount = 0;
			ResultSet rset = null;

			String query = prop.getProperty("listCount");

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "당일");
				rset = pstmt.executeQuery();
				if (rset.next()) {
					listCount = rset.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}

			return listCount;
	}

	/*	public int updateCount(Connection con, int num) {
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("updateCount");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, num);
				pstmt.setInt(2, num);
				
				result = pstmt.executeUpdate();
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}*/
		//전체 공고 상세보기
		public Announcment selectOne(Connection con, int num) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Announcment a = null;
			
			String query = "SELECT DISTINCT A.G_TITLE, B.USER_ID, A.G_S_DATE, A.G_TYPE, A.G_E_DATE, A.G_SIZE, A.G_PRICE, A.G_S_AREA, A.G_E_AREA, A.G_DAY, A.G_CONTEXT, P.G_P_DIV FROM ANNOUNCEMENT A JOIN ANNOUNCEMENT_PAYMENT P ON(A.G_NO = P.G_NO) JOIN MEMBER B ON (A.U_NO = B.U_NO) WHERE A.G_NO=? AND A.G_DIV = '일반'";
			System.out.println(query);
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, num);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					a = new Announcment();
					
					a.setUSER_ID(rset.getString("USER_ID"));
					a.setG_TITLE(rset.getString("G_TITLE"));
					a.setG_S_DATE(rset.getDate("G_S_DATE"));
					a.setG_E_DATE(rset.getDate("G_E_DATE"));
					a.setG_TYPE(rset.getString("G_TYPE"));
					a.setG_S_AREA(rset.getString("G_S_AREA"));
					a.setG_E_AREA(rset.getString("G_E_AREA"));
					a.setG_PRICE(rset.getInt("G_PRICE"));
					a.setG_SIZE(rset.getString("G_SIZE"));
					a.setG_DAY(rset.getDate("G_DAY"));
					a.setG_CONTEXT(rset.getString("G_CONTEXT"));
					a.setG_P_DIV(rset.getString("G_P_DIV"));
					
				}
			
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return a;
		}
		
		//당일공고 상세보기
		public Announcment selectOneToday(Connection con, int num) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Announcment a = null;
			
			String query = "SELECT DISTINCT A.G_TITLE, B.USER_ID, A.G_S_DATE, A.G_TYPE, A.G_E_DATE, A.G_SIZE, A.G_PRICE, A.G_S_AREA, A.G_E_AREA, A.G_DAY, A.G_CONTEXT, P.G_P_DIV FROM ANNOUNCEMENT A JOIN ANNOUNCEMENT_PAYMENT P ON(A.G_NO = P.G_NO) JOIN MEMBER B ON (A.U_NO = B.U_NO) WHERE A.G_NO=? AND A.G_DIV = '당일'";
			System.out.println(query);
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, num);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					a = new Announcment();
					
					a.setUSER_ID(rset.getString("USER_ID"));
					a.setG_TITLE(rset.getString("G_TITLE"));
					a.setG_S_DATE(rset.getDate("G_S_DATE"));
					a.setG_E_DATE(rset.getDate("G_E_DATE"));
					a.setG_TYPE(rset.getString("G_TYPE"));
					a.setG_S_AREA(rset.getString("G_S_AREA"));
					a.setG_E_AREA(rset.getString("G_E_AREA"));
					a.setG_PRICE(rset.getInt("G_PRICE"));
					a.setG_SIZE(rset.getString("G_SIZE"));
					a.setG_DAY(rset.getDate("G_DAY"));
					a.setG_CONTEXT(rset.getString("G_CONTEXT"));
					a.setG_P_DIV(rset.getString("G_P_DIV"));
					
				}
			
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return a;
		}
		
		//게시판 작성 
		public int insertBoard(Connection con, InsertAnnouncment i) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("insertBoard");
			System.out.println(query);
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
}
