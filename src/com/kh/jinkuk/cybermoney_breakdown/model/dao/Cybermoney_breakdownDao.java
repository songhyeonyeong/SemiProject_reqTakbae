package com.kh.jinkuk.cybermoney_breakdown.model.dao;

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

import com.kh.jinkuk.cybermoney_breakdown.model.vo.Cybermoney_breakdown;

public class Cybermoney_breakdownDao {
	private Properties prop = new Properties();
	
	public Cybermoney_breakdownDao(){
		String fileName = Cybermoney_breakdownDao.class.getResource("/sql/cybermoney_breakdown/cybermoney_breakdown.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con, int uNo) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}

	public ArrayList<Cybermoney_breakdown> selectList(Connection con, int currentPage, int limit, int uNo, String userDiv) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cybermoney_breakdown> list = null;
		String query="";
		if(userDiv.equals("신청자")) {
			query = prop.getProperty("selectListU");
		}else {
			query = prop.getProperty("selectListG");
		}
		
		try {
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt = con.prepareStatement(query);
			if(userDiv.equals("신청자")) {
				pstmt.setInt(1, uNo);
				pstmt.setString(2, "충전");
				pstmt.setString(3, "공고취소");
				pstmt.setString(4, "공고등록");
				pstmt.setString(5, "포인트적립");
				pstmt.setString(6, "포인트사용");
				pstmt.setInt(7, startRow);
				pstmt.setInt(8, endRow);
			}else {
				pstmt.setInt(1, uNo);
				pstmt.setString(2, "배송료");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
			
			rset = pstmt.executeQuery();
			
			list= new ArrayList<Cybermoney_breakdown>();
			
			while(rset.next()) {
				Cybermoney_breakdown cyber = new Cybermoney_breakdown();
				
				cyber.setR_num(rset.getInt("RNUM"));
				cyber.setCm_div(rset.getString("CM_DIV"));
				cyber.setCm_date(rset.getDate("CM_DATE"));
				cyber.setCm_use(rset.getInt("CM_USE"));
				cyber.setC_money(rset.getInt("C_MONEY"));
				cyber.setC_point(rset.getInt("C_POINT"));
				cyber.setCm_note(rset.getString("CM_NOTE"));
				
				list.add(cyber);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		
		return list;
	}

	public int getListCountSearch(Connection con, int uNo, String div) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String query = prop.getProperty("listCountSearch");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uNo);
			pstmt.setString(2, div);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Cybermoney_breakdown> selectListSearch(Connection con, int currentPage, int limit, int uNo, String div) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cybermoney_breakdown> list = null;
		String query="";
		query = prop.getProperty("selectDiv");
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, uNo);
			pstmt.setString(2, div);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list= new ArrayList<Cybermoney_breakdown>();
			
			while(rset.next()) {
				Cybermoney_breakdown cyber = new Cybermoney_breakdown();
				
				cyber.setR_num(rset.getInt("RNUM"));
				cyber.setCm_div(rset.getString("CM_DIV"));
				cyber.setCm_date(rset.getDate("CM_DATE"));
				cyber.setCm_use(rset.getInt("CM_USE"));
				cyber.setC_money(rset.getInt("C_MONEY"));
				cyber.setCm_note(rset.getString("CM_NOTE"));
				
				list.add(cyber);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		
		return list;
	}

	

	

}
