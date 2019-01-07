package com.kh.jinkuk.admin.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.commit;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;
import static com.kh.jinkuk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.admin.model.dao.AdminDao;
import com.kh.jinkuk.admin.model.vo.Admin;
import com.kh.jinkuk.admin.model.vo.Announcment;
import com.kh.jinkuk.admin.model.vo.Change;
import com.kh.jinkuk.admin.model.vo.Chart;
import com.kh.jinkuk.admin.model.vo.Exchange;
import com.kh.jinkuk.admin.model.vo.Inquiry;
import com.kh.jinkuk.admin.model.vo.LoadImg;
import com.kh.jinkuk.admin.model.vo.Point;
import com.kh.jinkuk.admin.model.vo.Report;
import com.kh.jinkuk.admin.model.vo.Review;



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
	
	public int deleteNotice(Announcment m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().deleteNotice(con,m);
	
		close(con);
		
		return result;
	}

	public int deleteToday(Announcment m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().deleteToday(con,m);
	
		close(con);
		
		return result;
	}
	
	public int deleteInquiry(Inquiry m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().deleteInquiry(con,m);
	
		if(result > 0)commit(con);
		else rollback(con);
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
	
	public int getListCount4() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCount4(con);
		close(con);
		return listCount;
	}

	
	public int getListCountAn() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCountAn(con);
		close(con);
		return listCount;
	}

	
	public int getListCountTo() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCountTo(con);
		close(con);
		return listCount;
	}
	
	
	public int getListCountMo() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCountMo(con);
		close(con);
		return listCount;
	}

	
	
	public ArrayList<Change> selectListMo(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Change> list = new AdminDao().selectListMo(con, currentPage, limit);
		
		close(con);
		
		return list;
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
	
	
	public ArrayList<Announcment> selectListAn(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Announcment> list = new AdminDao().selectListAn(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	
	public ArrayList<Announcment> selectListTo(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Announcment> list = new AdminDao().selectListTo(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	
	public ArrayList<Admin> selectJoinList(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Admin> list = new AdminDao().selectListJo(con, currentPage, limit);
		
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

	public int getListCountIn() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCountIn(con);
		close(con);
		return listCount;
	}

	public ArrayList<Inquiry> selectListIn(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Inquiry> list = new AdminDao().selectListIn(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public Inquiry selectOne(int num) {
		Connection con = getConnection();
		
		Inquiry n = new AdminDao().selectOne(con, num);
		
		
		close(con);
	
		return n;
	}

	public ArrayList<Inquiry> insertReply(Inquiry b) {
		System.out.println("서비스 board"+b);
		
		Connection con = getConnection();
		ArrayList<Inquiry> replyList = null;
		
		//inert -> commit -> select조회
		int result = new AdminDao().insertReply(con,b);
		
		if(result>0) {
			commit(con);
			replyList = new AdminDao().selectReplyList(con,b.getRef_mno());
		}else {
			rollback(con);
		}
		
		close(con);
		
		return replyList;



	}

	public Inquiry selectOneReply(int num) {
		Connection con = getConnection();
		
		Inquiry n = new AdminDao().selectOneReply(con, num);

		close(con);
	
		return n;
	}

	public int getListCountPo() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCountPo(con);
		close(con);
		return listCount;
	}

	public ArrayList<Point> selectListPo(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Point> list = new AdminDao().selectListPo(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getListCountEx() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCountEx(con);
		close(con);
		return listCount;
	}

	public ArrayList<Exchange> selectListEx(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Exchange> list = new AdminDao().selectListEx(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int updateEx(com.kh.jinkuk.exchange.model.vo.Exchange ex) {
		Connection con = getConnection();
		int result = new AdminDao().updateEx(con,ex);
	
		if(result > 0)commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

	public int getListCountRe() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCountRe(con);
		close(con);
		return listCount;
	}

	public ArrayList<Review> selectListRe(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Review> list = new AdminDao().selectListRe(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public Review selectReviewV(Review r) {
		Connection con =  getConnection();
		
		Review list = new AdminDao().selectOneReview(con,r);
		
		close(con);
		
		return list;
	}

	public ArrayList<Review> searchDeliId(String writer) {
		Connection con = getConnection();
		ArrayList<Review> list = new AdminDao().searchDeliId(con, writer);
		
		close(con);
		return list;
	}

	public ArrayList<Review> searchDeliName(String deliver) {
		Connection con = getConnection();
		ArrayList<Review> list = new AdminDao().searchDeliName(con, deliver);
		
		close(con);
		return list;
	}

	public int updateJoin(Admin m) {
		Connection con = getConnection();
		int result = new AdminDao().updateJoin(con,m);
	
		if(result > 0)commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

	public int getListCountRp() {
		Connection con = getConnection();
		int listCount = new AdminDao().getListCountRp(con);
		close(con);
		return listCount;
	}

	public ArrayList<Report> selectListRp(int currentPage, int limit) {
		Connection con =  getConnection();
		
		ArrayList<Report> list = new AdminDao().selectListRp(con,currentPage,limit);
		
		close(con);
		
		return list;
	}

	public ArrayList<Announcment> selectFilter(Announcment a) {
		Connection con =  getConnection();
		
		ArrayList<Announcment> list = new AdminDao().selectFilter(con,a);
		
		close(con);
		
		return list;
	}

	public LoadImg SelectImg(String num) {
		Connection con = getConnection();
		LoadImg cname= new AdminDao().selectImg(con,num);
		close(con);
		return cname;
	}

	public int deleteReview(Review m) {
		Connection con = getConnection();
		System.out.println(con);
		int result = new AdminDao().deleteReview(con,m);
	
		if(result > 0)commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

	public ArrayList<Chart> selectChart() {
		Connection con = getConnection();
		
		ArrayList<Chart> c = new AdminDao().selectChart(con);
		
		close(con);
		
		return c;
	}




























}
