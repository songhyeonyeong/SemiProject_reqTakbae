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

	public int goBlack(Admin m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().goBlack(con,m);
	
		close(con);
		
		return result;
	}
	
	
	public int goBlackDeliver(Admin m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().goBlackDeliver(con,m);
	
		close(con);
		
		return result;
	}
	

	public int deleteMember(Admin m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().deleteMember(con,m);
	
		close(con);
		
		return result;
	}
	
	
	public int deleteDeliver(Admin m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().deleteDeliver(con,m);
	
		close(con);
		
		return result;
	}


	public int getListCount() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	
	public int getListCount2() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCount2(con);
		close(con);
		return listCount;
	}
	

	public ArrayList<Admin> selectList(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Admin> list = new AdminDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public ArrayList<Admin> selectList2(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Admin> list = new AdminDao().selectList2(con, currentPage, limit);
		
		close(con);
		
		return list;
	}








}
