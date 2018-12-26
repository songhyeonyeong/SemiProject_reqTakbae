package com.kh.jinkuk.cybermoney_breakdown.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.cybermoney_breakdown.model.vo.Cybermoney_breakdown;

public class Cybermoney_breakdownDao {
	private Properties prop = new Properties();
	
	public Cybermoney_breakdownDao(){
		String fileName = Cybermoney_breakdownDao.class.getResource("/sql/Cybermoney_breakdown/Cybermoney_breakdown.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con) {
		Statement stmt =null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
			
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
		
	}

	public ArrayList<Cybermoney_breakdown> selectList(Connection con, int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
