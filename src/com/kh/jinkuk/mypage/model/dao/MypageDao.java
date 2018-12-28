package com.kh.jinkuk.mypage.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.mypage.model.vo.MyDeliverNotice;
import com.kh.jinkuk.mypage.model.vo.MyR_M_article;
import com.kh.jinkuk.mypage.model.vo.Mynotice;

public class MypageDao {

	private Properties prop = new Properties();

	public MypageDao() {

		String fileName = MypageDao.class.getResource("/sql/mypage/mypage-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con, int uno) {

		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return listCount;
	}

	public ArrayList<Mynotice> selectList(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Mynotice> list = null;
		Mynotice m = null;
		String query = prop.getProperty("selectListMynotice");
		list = new ArrayList<Mynotice>();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new Mynotice();
				m.setG_NO(rset.getInt("G_NO"));
				m.setG_DIV(rset.getString("G_DIV"));
				m.setG_CONTEXT(rset.getString("G_CONTEXT"));
				m.setG_DAY(rset.getDate("G_DAY"));
				m.setUSER_ID(rset.getString("USER_ID"));
				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCountMOK(Connection con, int uno) {

		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCountMOK");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return listCount;
	}

	public ArrayList<MyDeliverNotice> selectDevilerList(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyDeliverNotice> list = null;
		MyDeliverNotice m = null;
		String query = prop.getProperty("selectListMyDeliver");
		list = new ArrayList<MyDeliverNotice>();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new MyDeliverNotice();
				m.setG_NO(rset.getInt("G_NO"));
				m.setG_DIV(rset.getString("G_DIV"));
				m.setG_CONTEXT(rset.getString("G_CONTEXT"));
				m.setG_DAY(rset.getDate("G_DAY"));
				m.setUSER_ID(rset.getString("USER_ID"));
				m.setD_STATUS(rset.getString("B_STATUS"));
				list.add(m);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCountReqnotice(Connection con, int uno) {

		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("getListCountReqnotice");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return listCount;
	}

	public ArrayList<MyR_M_article> selectRequestNoticeList(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyR_M_article> list = null;
		MyR_M_article m = null;
		String query = prop.getProperty("selectRequestNoticeList");
		list = new ArrayList<MyR_M_article>();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new MyR_M_article();
				m.setG_div(rset.getString("G_DIV"));
				m.setG_no(rset.getInt("G_NO"));
				m.setG_context(rset.getString("G_CONTEXT"));
				m.setG_day(rset.getDate("G_DAY"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setG_p_div(rset.getString("G_P_DIV"));
				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCountMyMatchingDel(Connection con, int uno) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("getListCountMyMatchingDel");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return listCount;
	}

	public ArrayList<MyR_M_article> selectMyMatchingDelList(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyR_M_article> list = null;
		MyR_M_article m = null;
		String query = prop.getProperty("selectMyMatchingDelList");
		list = new ArrayList<MyR_M_article>();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new MyR_M_article();
				m.setG_div(rset.getString("G_DIV"));
				m.setG_no(rset.getInt("G_NO"));
				m.setG_context(rset.getString("G_CONTEXT"));
				m.setG_day(rset.getDate("G_DAY"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setB_status(rset.getString("B_STATUS"));
				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}


}
