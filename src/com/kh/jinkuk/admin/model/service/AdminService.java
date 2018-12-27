package com.kh.jinkuk.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;

import com.kh.jinkuk.admin.model.dao.AdminDao;
import com.kh.jinkuk.admin.model.vo.Admin;
import static com.kh.jinkuk.common.JDBCTemplate.*;

public class AdminService {

	public ArrayList<Admin> selectAll() {
		Connection con = getConnection();
		System.out.println(con);
		ArrayList<Admin> list = new AdminDao().selectAll(con);
	
		close(con);
		
		return list;
	}

	public ArrayList<Admin> selectDeliver() {
		Connection con = getConnection();
		System.out.println(con);
		ArrayList<Admin> list = new AdminDao().selectDeliver(con);
	
		close(con);
		
		return list;
	}

	public ArrayList<Admin> selectBlack() {
		Connection con = getConnection();
		System.out.println(con);
		ArrayList<Admin> list = new AdminDao().selectBlack(con);
	
		close(con);
		
		return list;
	}

}
