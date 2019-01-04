package com.kh.jinkuk.border.review.model.dao;

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
import com.kh.jinkuk.border.review.model.vo.Review;



public class ReviewDao {
	
	private Properties prop = new Properties();
	
	
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/border/review/review.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Review> selectList(Connection con) {
	Statement stmt = null;
	ResultSet rset = null;
	ArrayList<Review> list = null;
	
	String query = prop.getProperty("selectList");
	
	try {
		stmt=con.createStatement();
		rset = stmt.executeQuery(query);
		System.out.println(query);
		list=new ArrayList<Review>();
		
		while(rset.next()) {
			Review r=new Review();
			
			r.setHno(rset.getInt("H_NO"));
			r.sethTitle(rset.getString("H_TITLE"));
			r.sethContext(rset.getString("H_CONTEXT"));
			r.sethGrade(rset.getInt("H_GRADE"));
			r.sethDate(rset.getDate("H_DATE"));
			r.setStatus(rset.getString("STATUS"));
			r.setUname(rset.getString("USER_ID"));
			r.setRnum(rset.getInt("RNUM"));
			
			list.add(r);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(rset);
		close(stmt);
	}
	
	
		System.out.println("Review Dao"+list);
		return list;
	}
	

	
	//후기 작성 메소드
	public int insertReview(Connection con, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReview");
		System.out.println(query);
		
		try {
			
			
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, r.gethTitle());
			pstmt.setString(2, r.gethContext());
			pstmt.setInt(3, r.gethGrade());
			pstmt.setInt(4,r.getUno());//로그인 한 유저번호 
			pstmt.setInt(5, r.getGno());//공고 번호 
			
			
		
			result=pstmt.executeUpdate();
			System.out.println("후기 작성 쿼리문 확인"+result);
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//페이징 처리 후 게시판 조회용 메소드
	public ArrayList<Review> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Review>();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setHno(rset.getInt("H_NO"));
				r.sethTitle(rset.getString("H_TITLE"));
				r.sethContext(rset.getString("H_CONTEXT"));
				r.sethGrade(rset.getInt("H_GRADE"));
				r.sethDate(rset.getDate("H_DATE"));
				r.setStatus(rset.getString("STATUS"));
				r.setRnum(rset.getInt("RNUM"));
				r.setUname(rset.getString("USER_ID"));
				r.setGno(rset.getInt("G_NO"));
				r.setDriname(rset.getString("USER_NAME"));
				
				
				list.add(r);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		System.out.println("dao 확인"+list);
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
	//후기 상세보기 메소드
	public Review selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Review r = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r=new Review();
				
				r.setHno(rset.getInt("H_NO"));
				r.sethTitle(rset.getString("H_TITLE"));
				r.sethContext(rset.getString("H_CONTEXT"));
				r.sethGrade(rset.getInt("H_GRADE"));
				r.sethDate(rset.getDate("H_DATE"));
				r.setStatus(rset.getString("STATUS"));
				r.setUname(rset.getString("USER_ID"));
				r.setDriname(rset.getString("USER_NAME"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(r);
		return r;
		
	
	}

	//후기 작성시 포인트 업데이트 메소드
	public int updatePoint(Connection con,Review r) {
		
		PreparedStatement pstmt = null;
		int resultPoint = 0;
		
		String query = prop.getProperty("updatePoint");
		
		System.out.println(r.getUno());
		
		//r.set(uno);//회원 번호 들어가 있음
		
		try {
			
			pstmt=con.prepareStatement(query);
			
			System.out.println("Dao  "+query);
			
			pstmt.setInt(1,r.getUno());
			pstmt.setInt(2, r.getUno());
			
			resultPoint=pstmt.executeUpdate();
			
			System.out.println(resultPoint);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		System.out.println("포인트 업데이트 dao"+resultPoint);
		
		return resultPoint;
	}
	
	////내가 넣은것까지 모두 grade출력하기
	public ArrayList<Review> selectGradeList(Connection con,Review r) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("totalGrade");
		
		try {
			pstmt=con.prepareStatement(query);
			
			
			
			rset = pstmt.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}



	

}
