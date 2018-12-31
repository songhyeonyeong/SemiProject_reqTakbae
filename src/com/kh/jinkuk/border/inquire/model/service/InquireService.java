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

	//신청자 문의 상세보기 메소드
	public Inquire selectOne(int num) {
		Connection con = getConnection();
		
		Inquire i = new InquireDao().selectOne(con, num);
		
		close(con);
		
		return i;
	}



	//관리자 
	public Inquire selectAdminOne(int num) {
		Connection con = getConnection();
		
		Inquire ai=new InquireDao().selectAdminOne(con, num);
		close(con);
		return ai;
	}

}
