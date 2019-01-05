//package com.kh.jinkuk.border.todayannouncement.model.service;
//
//import java.sql.Connection;
//import java.util.ArrayList;
//import static com.kh.jinkuk.common.JDBCTemplate.*;
//
//import com.kh.jinkuk.border.announcment.model.dao.AnnouncmentDao;
//import com.kh.jinkuk.border.announcment.model.vo.Announcment;
//import com.kh.jinkuk.border.todayannouncement.model.dao.todayannouncementDao;
//
//public class todayannouncementService {
//
//	public int getListCountToday() {
//		Connection con = getConnection();
//
//		int count =new todayannouncementDao().getListCountToday(con);
//		
//		close(con);
//		return count;
//	}
////페이징처리 적용한 당일 게시물 조회용 메소드
//	public ArrayList<Announcment> selectTodayList(int currentPage, int limit) {
//		Connection con = getConnection();
//		
//		ArrayList<Announcment> list 
//			= new todayannouncementDao().selectTodayList(con, currentPage, limit);
//		
//		close(con);
//		
//		return list;
//	}
//	//당일 상세페이지
//			public Announcment selectOneToday(int num) {
//				
//				Connection con = getConnection();
//				
//				Announcment a = null;
//				
//				Announcment result = new todayannouncementDao().selectOneToday(con, num);
//				if(result  !=null ) {
//					commit(con);
//				}else {
//					rollback(con);
//				}
//				
//				close(con);
//				
//				return result;
//			}
//
//}
