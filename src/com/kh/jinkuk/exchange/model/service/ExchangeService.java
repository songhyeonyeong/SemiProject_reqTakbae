package com.kh.jinkuk.exchange.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.exchange.model.dao.ExchangeDao;
import com.kh.jinkuk.exchange.model.vo.Exchange;
import com.kh.jinkuk.exchange.model.vo.ExchangeAjax;

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

	public int InsertExchange(int uno, int money, int rmoney) {
		Connection con = getConnection();
		
		int result = new ExchangeDao().InsertExchange(con, uno, money, rmoney);
		
		int up = new ExchangeDao().Update(con, uno, money);
		
		if(result > 0 && up > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int SearchMoney(int uNo) {
		Connection con = getConnection();
		
		int money = new ExchangeDao().SearchMoney(con, uNo);
		/*int money = new ExchangeDao().SearchMoney(con, uNo);*/
		
		
		close(con);
		
		return money;
	}

	public ExchangeAjax SearchMoneye(int uNo) {
		Connection con = getConnection();
		
		ExchangeAjax money = new ExchangeDao().SearchMoneye(con, uNo);
		/*int money = new ExchangeDao().SearchMoney(con, uNo);*/
		
		
		close(con);
		
		return money;
	}

}
