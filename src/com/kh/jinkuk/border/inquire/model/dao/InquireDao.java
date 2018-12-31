package com.kh.jinkuk.border.inquire.model.dao;


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

import com.kh.jinkuk.border.inquire.model.vo.Inquire;
import com.kh.jinkuk.border.review.model.dao.ReviewDao;
import com.kh.jinkuk.border.review.model.vo.Review;

public class InquireDao {
	
	
	
	private Properties prop = new Properties();
	
	
	public InquireDao() {
	String fileName = ReviewDao.class.getResource("/sql/border/inquire/inquire.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	//페이징 처리 안된것
	public ArrayList<Inquire> selectList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	//페이징 처리 문의 리스트 메소드
	public ArrayList<Inquire> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquire> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Inquire>();
			
			
			while(rset.next()) {
				Inquire i = new Inquire();
				
				i.setM_no(rset.getInt("M_NO"));
				i.setM_title(rset.getString("M_TITLE"));
				i.setM_context(rset.getString("M_CONTEXT"));
				i.setRef_mno(rset.getInt("REF_MNO"));
				i.setReply_level(rset.getInt("REPLY_LEVEL"));
				i.setStatus(rset.getString("STATUS"));
				i.setM_date(rset.getDate("M_DATE"));
				i.setU_no(rset.getInt("U_NO"));
				i.setUser_id(rset.getString("USER_ID"));
				
				list.add(i);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("inquire Dao 확인"+list);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}

	//문의 상세보기 메소드
	public Inquire selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquire i = null;
		
		String query = prop.getProperty("selectOne");
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i=new Inquire();
				
				i.setM_no(rset.getInt("M_NO"));
				i.setM_title(rset.getString("M_TITLE"));
				i.setM_context(rset.getString("MCONTEXT"));
				i.setRef_mno(rset.getInt("REF_MNO"));
				i.setReply_level(rset.getInt("REPLY_LEVEL"));
				i.setStatus(rset.getString("STATUS"));
				i.setM_date(rset.getDate("M_DATE"));
				i.setU_no(rset.getInt("U_NO"));
				i.setUser_id(rset.getString("USER_ID"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return i;
	}


	public Inquire selectAdminOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquire ai = null;
		
		String query = prop.getProperty("selectAdminOne");
		return null;
	}

}
