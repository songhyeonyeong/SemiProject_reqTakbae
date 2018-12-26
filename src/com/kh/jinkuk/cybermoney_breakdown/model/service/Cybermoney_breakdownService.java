package com.kh.jinkuk.cybermoney_breakdown.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.cybermoney_breakdown.model.dao.Cybermoney_breakdownDao;
import com.kh.jinkuk.cybermoney_breakdown.model.vo.Cybermoney_breakdown;


public class Cybermoney_breakdownService {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new Cybermoney_breakdownDao().getListCount(con);
		close(con);
		
		return listCount;
	}

	public ArrayList<Cybermoney_breakdown> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Cybermoney_breakdown> list = new Cybermoney_breakdownDao().selectList(con,currentPage,limit);
		
		close(con);
		
		return list;
	}

}
