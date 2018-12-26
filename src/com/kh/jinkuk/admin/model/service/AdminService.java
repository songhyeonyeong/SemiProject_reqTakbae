package com.kh.jinkuk.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.admin.model.dao.AdminDao;
import com.kh.jinkuk.admin.model.vo.Admin;
import static com.kh.jinkuk.common.JDBCTemplate.*;

public class AdminService {

	public ArrayList<Admin> selectAll() {
		Connection con = getConnection();
		
		ArrayList<Admin> list = new AdminDao().selectAll(con);
		
		close(con);
		
		return list;
	}

}
