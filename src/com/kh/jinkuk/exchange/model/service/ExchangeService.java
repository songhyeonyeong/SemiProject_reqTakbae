package com.kh.jinkuk.exchange.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.exchange.model.dao.ExchangeDao;
import com.kh.jinkuk.exchange.model.vo.Exchange;

public class ExchangeService {

	public int getListCountSearch(int uNo) {
		Connection con = getConnection();
		
		int listCount = new ExchangeDao().getListCountSearch(con, uNo);
		close(con);
		
		return listCount;
	}

	public ArrayList<Exchange> selectList(int currentPage, int limit, int uNo) {
		Connection con = getConnection();
		
		ArrayList<Exchange> list = new ExchangeDao().selectList(con,currentPage,limit,uNo);
		
		close(con);
		
		return list;
	}

}
