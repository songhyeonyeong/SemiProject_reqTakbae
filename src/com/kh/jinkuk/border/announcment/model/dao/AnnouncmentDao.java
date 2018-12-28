package com.kh.jinkuk.border.announcment.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.border.announcment.model.vo.Announcment;

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

	//페이징 처리 후 게시판 조회용 메소드
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
				
				/*pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);*/
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<Announcment>();
				
				while(rset.next()) {
					Announcment a = new Announcment();
					
					a.setG_NO(rset.getInt("G_NO"));
					a.setG_TITLE(rset.getString("G_TITLE"));
					a.setG_CONTEXT(rset.getString("G_CONTEXT"));
					a.setG_DIV(rset.getString("G_DIV"));
					a.setG_S_DATE(rset.getDate("G_S_DATE"));
					a.setG_E_DATE(rset.getDate("G_E_DATE"));
					a.setG_S_AREA(rset.getString("G_S_AREA"));
					a.setG_E_AREA(rset.getString("G_E_AREA"));
					a.setG_TYPE(rset.getString("G_TYPE"));
					a.setG_SUM(rset.getInt("G_SUM"));
					a.setG_PRICE(rset.getInt("G_PRICE"));
					a.setG_SIZE(rset.getString("G_SIZE"));
					a.setG_DAY(rset.getDate("G_DAY"));
					a.setSTATUS(rset.getString("STATUS"));
					a.setU_NO(rset.getInt("U_NO"));
																		
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


		public int getListCount(Connection con) {
			Statement stmt = null;
			int listCount = 0;
			ResultSet rset = null;
			
			String query = prop.getProperty("listCount");
			
			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(stmt);
				close(rset);
			}
			
			
			
			return listCount;
		}


}
