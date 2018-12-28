package com.kh.jinkuk.admin.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.admin.model.dao.AdminDao;
import com.kh.jinkuk.admin.model.vo.Admin;



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
	
	
	public int deleteBlack(Admin m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().deleteBlack(con,m);
	
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
	
	
	public int getListCount3() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCount3(con);
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

	public ArrayList<Admin> selectBlackList(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Admin> list = new AdminDao().selectBlackList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int cancleBlack(Admin m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().cancleBlack(con,m);
	
		close(con);
		
		return result;
	}

	public ArrayList<Admin> searchId(String userId) {
		Connection con = getConnection();
		ArrayList<Admin> list = new AdminDao().searchId(con, userId);
		
		close(con);
		return list;
	}

	public ArrayList<Admin> searchName(String userName) {
		Connection con = getConnection();
		ArrayList<Admin> list = new AdminDao().searchName(con, userName);
		
		close(con);
		return list;
	}

	public ArrayList<Admin> DeliversearchId(String userId) {
		Connection con = getConnection();
		ArrayList<Admin> list = new AdminDao().DeliversearchId(con, userId);
		
		close(con);
		return list;
	}

	public ArrayList<Admin> DeliversearchName(String userName) {
		Connection con = getConnection();
		ArrayList<Admin> list = new AdminDao().DeliversearchName(con, userName);
		
		close(con);
		return list;
	}

	public ArrayList<Admin> BlacksearchId(String userId) {
		Connection con = getConnection();
		ArrayList<Admin> list = new AdminDao().BlackSearchId(con, userId);
		
		close(con);
		return list;
	}

	public ArrayList<Admin> BlackrsearchName(String userName) {
		Connection con = getConnection();
		ArrayList<Admin> list = new AdminDao().BlackSearchName(con, userName);
		
		close(con);
		return list;
	}











}
