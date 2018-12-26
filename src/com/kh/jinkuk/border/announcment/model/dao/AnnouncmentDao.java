package com.kh.jinkuk.border.announcment.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.border.announcment.model.vo.Announcment;

public class AnnouncmentDao {
	
	private Properties prop = new Properties();

	public ArrayList<Announcment> selectAnnouncment(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Announcment> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Announcment>();
			
			while(rset.next()) {
				Announcment a = new Announcment();
				
				a.setG_NO(rset.getInt("G_NO"));
				a.setG_S_DATE(rset.getDate("G_S_DATE"));
				a.setG_S_AREA(rset.getString("G_S_AREA"));
				a.setG_E_AREA(rset.getString("G_E_AREA"));
				a.setG_CONTEXT(rset.getString("G_CONTEXT"));
				a.setG_E_DATE(rset.getDate("G_E_DATE"));
				a.setG_SIZE(rset.getString("G_SIZE"));
				a.setG_SUM(rset.getInt("G_SUM"));
				a.setSTATUS(rset.getString("STATUS"));
				
				list.add(a);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

}
