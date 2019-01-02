package com.kh.jinkuk.member.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.member.model.vo.Images;
import com.kh.jinkuk.member.model.vo.Member;

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
		}finally {
			close(pstmt);
			close(rset);
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
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return flag;
	}

	public int insertMember(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="";
		
		if(reqMember.getUser_div().equals("신청자")) {
			query = prop.getProperty("insertMember");
		}else if(reqMember.getUser_div().equals("기사")) {
			query = prop.getProperty("insertGisa");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getBank_name());
			pstmt.setString(2, reqMember.getBank_num());
			pstmt.setString(3, reqMember.getUser_id());
			pstmt.setString(4, reqMember.getUser_pwd());
			pstmt.setString(5, reqMember.getPhone());
			pstmt.setString(6, reqMember.getEmail());
			pstmt.setString(7, reqMember.getUser_div());
			pstmt.setString(8, reqMember.getLogin_div());
			pstmt.setString(9, reqMember.getUser_name());
			
			if(reqMember.getUser_div().equals("기사")) {
				pstmt.setString(10, reqMember.getK_trans());
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String find(Connection con, String name, String email, String userDiv) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String id="";
		
		String query = prop.getProperty("findId");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, userDiv);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				id = rset.getString("USER_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return id;
	}

	public int findPw(Connection con, String email, String userDiv, String id, String userPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePw");
	
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, userPwd);
			pstmt.setString(2, id);
			pstmt.setString(3, email);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int findUno(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int uno=0;
		
		String query = prop.getProperty("finduno");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				uno = rset.getInt("U_NO");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return uno;
	}

	public int insertImg(Connection con, ArrayList<Images> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertimg");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getI_div());
				pstmt.setString(2, "N");
				pstmt.setString(3, fileList.get(i).getI_o_name());
				pstmt.setString(4, fileList.get(i).getI_c_name());
				pstmt.setString(5, fileList.get(i).getI_path());
				pstmt.setInt(6, fileList.get(i).getU_no());
				
				result += pstmt.executeUpdate();
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}








