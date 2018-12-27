package com.kh.jinkuk.mypage.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.mypage.model.dao.MypageDao;
import com.kh.jinkuk.mypage.model.vo.Mynotice;

public class MypageService {

	public int getListCount(int uno) {
		Connection con = getConnection();

		int listCount = new MypageDao().getListCount(con, uno);

		close(con);

		return listCount;
	}

	public ArrayList<Mynotice> selectList(int currentPage, int limit, int uno) {
		ArrayList<Mynotice> list = null;
		Connection con = getConnection();

		list = new MypageDao().selectList(con, currentPage, limit, uno);

		close(con);

		return list;

	}

}
