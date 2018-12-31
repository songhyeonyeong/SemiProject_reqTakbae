package com.kh.jinkuk.cybermoney_breakdown.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.cybermoney_breakdown.model.dao.Cybermoney_breakdownDao;
import com.kh.jinkuk.cybermoney_breakdown.model.vo.Cybermoney_breakdown;


public class Cybermoney_breakdownService {

	public int getListCount(int uNo) {
		Connection con = getConnection();
		
		int listCount = new Cybermoney_breakdownDao().getListCount(con, uNo);
		close(con);
		
		return listCount;
	}

	public ArrayList<Cybermoney_breakdown> selectList(int currentPage, int limit, int uNo, String userDiv) {
		Connection con = getConnection();
		
		ArrayList<Cybermoney_breakdown> list = new Cybermoney_breakdownDao().selectList(con,currentPage,limit,uNo,userDiv);
		
		close(con);
		
		return list;
	}

	public ArrayList<Cybermoney_breakdown> selectListSearch(int currentPage, int limit, int uNo, String div) {
		Connection con = getConnection();
		
		ArrayList<Cybermoney_breakdown> list = new Cybermoney_breakdownDao().selectListSearch(con,currentPage,limit,uNo,div);
		
		close(con);
		
		return list;
	}

	public int getListCountSearch(int uNo, String div) {
		Connection con = getConnection();
		
		int listCount = new Cybermoney_breakdownDao().getListCountSearch(con, uNo, div);
		close(con);
		
		return listCount;
	}

}
