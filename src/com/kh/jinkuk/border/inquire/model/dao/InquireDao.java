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
	
	//댓글 상태 여부 메소드
	public ArrayList<Inquire> selectRefList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquire> statuslist = null;
		
		String query = prop.getProperty("refStatus");
		
		
		
		try {
			pstmt=con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			statuslist = new ArrayList<Inquire>();
			
			while(rset.next()) {
				Inquire i = new Inquire();
				
				i.setRefstatus(rset.getInt("REF_MNO"));
				
				
				
				
				statuslist.add(i);
				
			}
			
			System.out.println("댓글 확인 dao  "+statuslist);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return statuslist;
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
				i.setRnum(rset.getInt("RNUM"));
				
				
				
				
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
	//페이징 처리 리스트카운트 메소드
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

	//신청자 문의작성 상세보기 메소드
	public Inquire selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquire i = null;
	
		
		String query = prop.getProperty("selectOne");
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			System.out.println("DAO"+num);
			rset = pstmt.executeQuery();
			
			
			
			if(rset.next()) {
				i=new Inquire();
				
				i.setM_no(rset.getInt("M_NO"));
				i.setM_title(rset.getString("M_TITLE"));
				i.setM_context(rset.getString("M_CONTEXT"));
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
		
		System.out.println("inquireDao-selectOne "+i);
		return i;
	}

	//관리자 문의댓글 작성 상세보기 메소드
	public Inquire selectAdminOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquire ai = null;
		
		String query = prop.getProperty("selectAdminOne");
		System.out.println(query);
		try {
			pstmt=con.prepareStatement(query);
			 pstmt.setInt(1, num);
			 System.out.println("num"+num);
			 rset=pstmt.executeQuery();
			
			 
			 if(rset.next()) {
				 
				 ai=new Inquire();
				ai.setM_context(rset.getString("M_CONTEXT"));
				ai.setM_date(rset.getDate("M_DATE"));
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("관리자 댓글 확인"+ai);
		
		return ai;
	}

	//사용자 문의 글삭제 메소드
	public int deleteInquire(Connection con, Inquire i) {
		PreparedStatement pstmt = null;
		int iresult = 0;
		
		String query = prop.getProperty("deleteInquire");
		//String query2=prop.getProperty("deleteAdminInquire");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, i.getM_no());
			//pstmt.setInt(1, i.getM_no());
			iresult = pstmt.executeUpdate();
			//result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return iresult;
	}

	//관리자 문의 댓글 삭제 메소드
	public int deleteAdminInquire(Connection con, Inquire i) {
		PreparedStatement pstmt = null;
		int aresult = 0;
		
		String query=prop.getProperty("deleteAdminInquire");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, i.getM_no());
		
			aresult = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return aresult;
	}

	//문의 글 작성 메소드
	public int insertInquire(Connection con, Inquire i) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertInquire");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, i.getM_title());
			pstmt.setString(2, i.getM_context());
			pstmt.setInt(3, i.getU_no());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//문의 수정 메소드
	public int updateInquire(Connection con, Inquire i) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateInquire");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, i.getM_title());
			pstmt.setString(2, i.getM_context());
			pstmt.setInt(3,i.getM_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("InquireDao확인본"+result);
		return result;
	}


	public ArrayList<Inquire> searchTitle(Connection con,String titleS) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquire> list = null;
		
		System.out.println("타이틀확인 :"+titleS);
		
		String query = prop.getProperty("searchTitle");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,titleS);
		
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
				i.setRnum(rset.getInt("RNUM"));
				
			
				list.add(i);
				
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


	public ArrayList<Inquire> searchText(Connection con,String textS) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquire> list = null;
		
		System.out.println("타이틀확인 :"+textS);
		
		String query = prop.getProperty("searchTitle");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,textS);
		
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
				i.setRnum(rset.getInt("RNUM"));
				
			
				list.add(i);
				
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
