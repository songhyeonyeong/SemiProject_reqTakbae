package com.kh.jinkuk.border.announcment.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.commit;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;
import static com.kh.jinkuk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.border.announcment.model.dao.AnnouncmentDao;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.border.announcment.model.vo.InsertAnnouncment;

public class AnnouncmentService {

	//페이징처리 적용한 전체 게시물 조회용 메소드
	public ArrayList<Announcment> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Announcment> list 
			= new AnnouncmentDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	//페이징처리 적용한 당일 게시물 조회용 메소드
		public ArrayList<Announcment> selectTodayList(int currentPage, int limit) {
			Connection con = getConnection();
			
			ArrayList<Announcment> list 
				= new AnnouncmentDao().selectTodayList(con, currentPage, limit);
			
			close(con);
			
			return list;
		}

	public int getListCount() {	
		
		Connection con = getConnection();
		int listCount = new AnnouncmentDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	//전체 상세페이지
	public Announcment selectOne(int num) {
		
		Connection con = getConnection();
		
		Announcment a = null;
		
		Announcment result = new AnnouncmentDao().selectOne(con, num);
				
				/*new AnnouncmentDao().updateCount(con, num);*/
		
		if(result  !=null ) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//당일 상세페이지
		public Announcment selectOneToday(int num) {
			
			Connection con = getConnection();
			
			Announcment a = null;
			
			Announcment result = new AnnouncmentDao().selectOneToday(con, num);
					
					/*new AnnouncmentDao().updateCount(con, num);*/
			
			if(result  !=null ) {
				commit(con);
			}else {
				rollback(con);
			}
			
			close(con);
			
			return result;
		}
	
	//게시판 작성페이지
	public int insertBoard(InsertAnnouncment i) {
		
		Connection con = getConnection();
		
		int result = new AnnouncmentDao().insertBoard(con, i);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}
	
	

}
