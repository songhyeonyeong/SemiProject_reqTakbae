package com.kh.jinkuk.member.model.service;


import java.sql.Connection;
import static com.kh.jinkuk.common.JDBCTemplate.*;

import com.kh.jinkuk.member.model.dao.MemberDao;
import com.kh.jinkuk.member.model.vo.Member;

public class MemberService {

	public Member loginCheck(Member reqMember) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, reqMember);
		
		close(con);
		
		return loginUser;
	}

}
