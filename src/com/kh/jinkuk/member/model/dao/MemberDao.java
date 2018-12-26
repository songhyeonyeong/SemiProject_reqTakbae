package com.kh.jinkuk.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jinkuk.member.model.vo.Member;
import com.kh.jinkuk.member.model.dao.MemberDao;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginCheck(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("loginSelect");
		Member m = null;
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1,reqMember.getUser_id());
			pstmt.setString(2,reqMember.getUser_pwd());
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				m=new Member();
				m.setU_no(rset.getInt("U_NO"));
				m.setBank_name(rset.getString("BANK_NAME"));
				m.setBank_num(rset.getString("BANK_NUM"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setUser_pwd(rset.getString("USER_PWD"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setBacklist(rset.getString("BLACKLIST"));
				m.setUser_div(rset.getString("USER_DIV"));
				m.setC_money(rset.getInt("C_MONEY"));
				m.setC_point(rset.getInt("C_POINT"));
				m.setLogin_div(rset.getString("LOGIN_DIV"));
				m.setUser_name(rset.getString("USER_NAME"));
				m.setU_date(rset.getDate("U_DATE"));
				m.setStatus(rset.getString("STATUS"));
				m.setK_trans(rset.getString("K_TRANS"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return m;
	}

	public boolean idCheck(Connection con, String SId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean flag = false;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, SId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				flag=true; //중복있음
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
}
