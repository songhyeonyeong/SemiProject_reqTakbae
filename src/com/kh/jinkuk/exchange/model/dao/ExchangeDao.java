package com.kh.jinkuk.exchange.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.exchange.model.vo.Exchange;
import com.kh.jinkuk.exchange.model.vo.ExchangeAjax;

public class ExchangeDao {
	private Properties prop = new Properties();
	
	public ExchangeDao() {
		String fileName = ExchangeDao.class.getResource("/sql/exchange/exchange.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public int getListCountSearch(Connection con, int uNo) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}


	public ArrayList<Exchange> selectList(Connection con, int currentPage, int limit, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Exchange> list = null;
		String query="";
	
		query = prop.getProperty("selectList");
		
		
		try {
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt = con.prepareStatement(query);
				pstmt.setInt(1, uNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			list= new ArrayList<Exchange>();
			
			while(rset.next()) {
				Exchange ex = new Exchange();
				
				ex.setrNum(rset.getInt("RNUM"));
				ex.setcDate(rset.getDate("C_DATE"));
				ex.setcMoney(rset.getInt("C_CMONEY"));
				ex.setrMoney(rset.getInt("C_RMONEY"));
				ex.setBankName(rset.getString("BANK_NAME"));
				ex.setBankNum(rset.getString("BANK_NUM"));
				ex.seteStatus(rset.getString("E_STATUS"));
				
				list.add(ex);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;	
	}


	public int InsertExchange(Connection con, int uno, int money, int rmoney) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("InsertExchange");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, money);
			pstmt.setInt(2, rmoney);
			pstmt.setInt(3, uno);
			pstmt.setString(4, "환전신청");
			
			result = pstmt.executeUpdate();
						
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}


	public int Update(Connection con, int uno, int money) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UpdateMoney");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, money);
			pstmt.setInt(2, uno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
			
		return result;
	}


	public int SearchMoney(Connection con, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int money=0;
		String query = prop.getProperty("searchmoney");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				money = rset.getInt("C_MONEY");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return money;
	}


	public ExchangeAjax SearchMoneye(Connection con, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ExchangeAjax money=null;
		String query = prop.getProperty("searchmoney");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uNo);
			
			rset = pstmt.executeQuery();
			
			money = new ExchangeAjax();
			while(rset.next()) {
				money.setMoney(rset.getInt("C_MONEY"));
				money.setPoint(rset.getInt("C_POINT"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return money;
	}




}
