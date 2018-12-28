package com.kh.jinkuk.mypage.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.mypage.model.dao.MypageDao;
import com.kh.jinkuk.mypage.model.vo.MyDeliverNotice;
import com.kh.jinkuk.mypage.model.vo.MyR_M_article;
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

	public int getListCountMOK(int uno) {
		Connection con = getConnection();

		int listCount = new MypageDao().getListCountMOK(con, uno);

		close(con);

		return listCount;
	}


	public ArrayList<MyDeliverNotice> selectDevilerList(int currentPage, int limit, int uno) {
		
		ArrayList<MyDeliverNotice> list = null;
		Connection con = getConnection();

		list = new MypageDao().selectDevilerList(con, currentPage, limit, uno);

		close(con);

		return list;
	}

	public int getListCountReqnotice(int uno) {
		Connection con = getConnection();

		int listCount = new MypageDao().getListCountReqnotice(con, uno);

		close(con);

		return listCount;
	}

	public ArrayList<MyR_M_article> selectRequestNoticeList(int currentPage, int limit, int uno) {
		ArrayList<MyR_M_article> list = null;
		Connection con = getConnection();

		list = new MypageDao().selectRequestNoticeList(con, currentPage, limit, uno);

		close(con);

		return list;
	}

	public int getListCountMyMatchingDel(int uno) {
		Connection con = getConnection();

		int listCount = new MypageDao().getListCountMyMatchingDel(con, uno);

		close(con);

		return listCount;
	}

	public ArrayList<MyR_M_article> selectMyMatchingDelList(int currentPage, int limit, int uno) {
		ArrayList<MyR_M_article> list = null;
		Connection con = getConnection();

		list = new MypageDao().selectMyMatchingDelList(con, currentPage, limit, uno);

		close(con);

		return list;
	}

}
