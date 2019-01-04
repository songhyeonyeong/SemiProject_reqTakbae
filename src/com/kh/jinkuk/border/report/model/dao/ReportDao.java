package com.kh.jinkuk.border.report.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jinkuk.border.report.model.vo.Report;
import com.kh.jinkuk.mypage.model.dao.MypageDao;
import static com.kh.jinkuk.common.JDBCTemplate.*;

public class ReportDao {
	
	private Properties prop = new Properties();
	
	public ReportDao() {
		
		String fileName = MypageDao.class.getResource("/sql/border/report/report.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertReport(Connection con, Report r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertreport");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, r.getTitle());
			pstmt.setString(2, r.getReport());
			pstmt.setString(3, r.getArea());
			pstmt.setInt(4, r.getGno());
			pstmt.setInt(5, r.getUno());
			pstmt.setInt(6, r.getGno());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int upMember(Connection con, Report r) {
		PreparedStatement pstmt;
		int result = 0;
		
		
		
		
		return 0;
	}

}
