package com.kh.jinkuk.border.announcment.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.border.announcment.model.dao.AnnouncmentDao;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;

public class AnnouncmentService {
	
	public class BoardService {

		public ArrayList<Announcment> selectList() {
			Connection con = getConnection();
			
			ArrayList<Announcment> list = new AnnouncmentDao().selectAnnouncment(con);
			
			close(con);
			
			return list;
		}
	}
}
