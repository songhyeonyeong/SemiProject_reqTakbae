package com.kh.jinkuk.border.review.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.commit;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;
import static com.kh.jinkuk.common.JDBCTemplate.rollback;
import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.border.review.model.dao.ReviewDao;
import com.kh.jinkuk.border.review.model.vo.Review;


public class ReviewService {
	
	
	public ArrayList<Review> selectList() {
		Connection con = getConnection();
	
		ArrayList<Review> list = new ReviewDao().selectList(con);
		
		close(con);
		
		return list;
	}
	

	//후기 게시물 작성 메소드
	public int insertReview(Review r) {
		Connection con = getConnection();
		
		int result = new ReviewDao().insertReview(con, r);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}


	//페이징 처리 적용한 게시물 조회용 메소드
	public ArrayList<Review> selectList(int currentPage, int limit,String driname) {
		Connection con = getConnection();
		
		ArrayList<Review> list 
			= new ReviewDao().selectList(con, currentPage, limit,driname);
		System.out.println("reviewService 확인"+list);
		
		close(con);
		
		return list;
	}
	
	//페이징 처리 카운트 메소드
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new ReviewDao().getListCount(con);
		close(con);
		
		return listCount;
	}

	//후기 상세보기 메소드
	public Review selectOne(int num) {
		Connection con = getConnection();
		
		Review r=new ReviewDao().selectOne(con, num);
		
	
		close(con);
		return r;
	}

	

}
