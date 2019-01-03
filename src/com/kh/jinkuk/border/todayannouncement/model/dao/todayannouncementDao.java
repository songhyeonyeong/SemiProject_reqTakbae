package com.kh.jinkuk.border.todayannouncement.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.jinkuk.common.JDBCTemplate.*;
import com.kh.jinkuk.border.announcment.model.dao.AnnouncmentDao;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;

public class todayannouncementDao {
	private Properties prop = new Properties();
	
	public todayannouncementDao() {
		
		String fileName = AnnouncmentDao.class.getResource("/sql/border/announcment/todayannouncement.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
				a.setRnum(rset.getInt("RNUM"));
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


	public int getListCountToday(Connection con) {
		PreparedStatement pstmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getListCountToday");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,"당일");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
			//당일공고 상세보기
			public Announcment selectOneToday(Connection con, int num) {
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				Announcment a = null;
				
				String query =prop.getProperty("selectOneToday2");
				try {
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, num);
					pstmt.setInt(2, num);
					pstmt.setString(3, "당일");
					
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						a = new Announcment();
						a.setCount(rset.getInt("COUNT"));
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
	

}
