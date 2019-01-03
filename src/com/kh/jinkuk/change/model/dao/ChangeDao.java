package com.kh.jinkuk.change.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jinkuk.change.model.vo.Change;
import static com.kh.jinkuk.common.JDBCTemplate.*;

public class ChangeDao {
		Properties prop = new Properties();
		
		public ChangeDao() {
			String fileName= ChangeDao.class.getResource("/sql/change/change.properties").getPath();
			
			try {
				prop.load(new FileReader(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	
	public int InsertChange(Connection con, Change c) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertChange");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, c.getCh_div());
			pstmt.setInt(2, c.getCh_rmoney());
			pstmt.setInt(3, c.getCh_cmoney());
			pstmt.setInt(4, c.getCh_ok());
			pstmt.setInt(5, c.getU_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
			
		return result;
	}

	public int UpdateMoney(Connection con, Change c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMoney");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, c.getCh_cmoney());
			pstmt.setInt(2, c.getU_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int CyberInsert(Connection con, Change c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMoney");
				
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,"충전");
			pstmt.setInt(2, c.getCh_cmoney());
			pstmt.setInt(3, c.getU_no());
			
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
