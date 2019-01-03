package com.kh.jinkuk.member.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.jinkuk.common.JDBCTemplate.*;

import com.kh.jinkuk.member.model.dao.MemberDao;
import com.kh.jinkuk.member.model.vo.Images;
import com.kh.jinkuk.member.model.vo.Member;

public class MemberService {

	public Member loginCheck(Member reqMember) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, reqMember);
		
		close(con);
		
		return loginUser;
	}

	public boolean idCheck(String SId) {
		Connection con = getConnection();
		
		boolean flag = new MemberDao().idCheck(con, SId);
		
		close(con);
		
		return flag;
	}

	public int insertMember(Member reqMember) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, reqMember);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public String find(String name, String email, String userDiv) {
		Connection con = getConnection();
		
		String id = new MemberDao().find(con, name, email, userDiv);
		
		close(con);

		return id;
	}

	public int findPw(String email, String userDiv, String id, String userPwd) {
		Connection con = getConnection();
		
		int result = new MemberDao().findPw(con, email, userDiv,id, userPwd);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int insertImg(ArrayList<Images> fileList) {
		Connection con = getConnection();
		
		/*int uno = new MemberDao().findUno(con,userId);
		
		for(int i = 0; i < fileList.size(); i++) {
			fileList.get(i).setU_no(uno);
		}*/
		
		int result = new MemberDao().insertImg(con, fileList);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int findUno(String userId) {
		Connection con = getConnection();
		
		int uno = new MemberDao().findUno(con,userId);
		
		close(con);
		
		return uno;
	}

	public int snsJoinCheck(String kakaoId) {
		Connection con = getConnection();
		
		int result = new MemberDao().snsJoinCheck(con, kakaoId);
		
		close(con);
		
		return result;
	}

}




