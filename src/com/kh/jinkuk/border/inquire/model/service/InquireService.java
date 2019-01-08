package com.kh.jinkuk.border.inquire.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.commit;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;
import static com.kh.jinkuk.common.JDBCTemplate.rollback;
import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.kh.jinkuk.border.inquire.model.dao.InquireDao;
import com.kh.jinkuk.border.inquire.model.vo.Inquire;
import com.kh.jinkuk.border.review.model.vo.Review;



public class InquireService {
	
	public ArrayList<Inquire>selectList(){
		
		Connection con =getConnection();
		ArrayList<Inquire> list = new InquireDao().selectList(con);
		close(con);
		
		return list;
		
		
	}
	
	
	
	
	//페이징 처리 카운트 메소드
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount=new InquireDao().getListCount(con);
		
		return listCount;
	}

	//페이징 처리 문의 리스트 메소드(*)
	public ArrayList<Inquire> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Inquire> list = new InquireDao().selectList(con,currentPage, limit);
		System.out.println("InquireService 확인 :"+list);
		
		close(con);
		
		return list;
		
		

	}
	
	//댓글 상태 여부 가져오기
	public ArrayList<Inquire> selectRefList() {
		Connection con = getConnection();
		
		ArrayList<Inquire> statuslist = new InquireDao().selectRefList(con);
		
		
		close(con);
		
		return statuslist;
	}


	//신청자 문의 상세보기 부분 메소드
	public Inquire selectOne(int num) {
		Connection con = getConnection();
		
		Inquire i = new InquireDao().selectOne(con, num);
		
		close(con);
		
		return i;
	}



	//관리자 문의 상세보기 부분 메소드
	public Inquire selectAdminOne(int num) {
		Connection con = getConnection();
		
		Inquire ai=new InquireDao().selectAdminOne(con, num);
		close(con);
		return ai;
	}



	//사용자 문의 글 삭제 메소드
	public int deleteInquire(Inquire i) {
		Connection con = getConnection();
		int iresult = new InquireDao().deleteInquire(con, i);
		
		if(iresult>0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return iresult;
	}



	//관리자 문의 댓글 삭제 메소드
	public int deleteAdminInquire(Inquire i) {
		Connection con = getConnection();
		int aresult = new InquireDao().deleteAdminInquire(con, i);
		
		if(aresult>0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return aresult;
	}



	//문의 작성 메소드
	public int insertInquire(Inquire i) {
		Connection con = getConnection();
		
		int result = new InquireDao().insertInquire(con, i);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}



	//문의 수정 메소드
	public int updateInquire(Inquire i) {
		
		Connection con = getConnection();
		
		int result = new InquireDao().updateInquire(con, i);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}



	//제목으로 찾기 
	public ArrayList<Inquire> searchTitle(String titleS) {
		Connection con =getConnection();
		ArrayList<Inquire> list = new InquireDao().searchTitle(con,titleS);
		close(con);
		
		return list;
	}



	//내용으로 찾기
	public ArrayList<Inquire> searchText(String textS) {
		Connection con =getConnection();
		ArrayList<Inquire> list = new InquireDao().searchText(con,textS);
		close(con);
		
		return list;
	}
















}
