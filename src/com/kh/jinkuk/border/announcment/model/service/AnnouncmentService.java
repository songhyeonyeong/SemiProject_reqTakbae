package com.kh.jinkuk.border.announcment.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.border.announcment.model.dao.AnnouncmentDao;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;

public class AnnouncmentService {

	//페이징처리 적용한 게시물 조회용 메소드
	public ArrayList<Announcment> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Announcment> list 
			= new AnnouncmentDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getListCount() {	
		
		Connection con = getConnection();
		int listCount = new AnnouncmentDao().getListCount(con);
		close(con);
		return listCount;
	}
}
