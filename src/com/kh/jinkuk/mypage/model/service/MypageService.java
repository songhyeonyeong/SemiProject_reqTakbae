package com.kh.jinkuk.mypage.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.admin.model.dao.AdminDao;
import com.kh.jinkuk.admin.model.vo.Inquiry;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.mypage.model.dao.MypageDao;
import com.kh.jinkuk.mypage.model.vo.MyCharge;
import com.kh.jinkuk.mypage.model.vo.MyDeliverNotice;
import com.kh.jinkuk.mypage.model.vo.MyExchange;
import com.kh.jinkuk.mypage.model.vo.MyR_M_article;
import com.kh.jinkuk.mypage.model.vo.Mynotice;
import com.kh.jinkuk.mypage.model.vo.SelectReqGisa;

public class MypageService {

	public int getListCount(int uno) {
		Connection con = getConnection();

		int listCount = new MypageDao().getListCount(con, uno);

		close(con);

		return listCount;
	}

	public ArrayList<Mynotice> selectList(int currentPage, int limit, int uno) {
		ArrayList<Mynotice> list = null;
		Connection con = getConnection();

		list = new MypageDao().selectList(con, currentPage, limit, uno);

		close(con);

		return list;

	}

	public int getListCountMOK(int uno) {
		Connection con = getConnection();

		int listCount = new MypageDao().getListCountMOK(con, uno);

		close(con);

		return listCount;
	}

	public ArrayList<MyDeliverNotice> selectDevilerList(int currentPage, int limit, int uno) {

		ArrayList<MyDeliverNotice> list = null;
		Connection con = getConnection();

		list = new MypageDao().selectDevilerList(con, currentPage, limit, uno);

		close(con);

		return list;
	}

	public int getListCountReqnotice(int uno) {
		Connection con = getConnection();

		int listCount = new MypageDao().getListCountReqnotice(con, uno);

		close(con);

		return listCount;
	}

	public ArrayList<MyR_M_article> selectRequestNoticeList(int currentPage, int limit, int uno) {
		ArrayList<MyR_M_article> list = null;
		Connection con = getConnection();

		list = new MypageDao().selectRequestNoticeList(con, currentPage, limit, uno);

		close(con);

		return list;
	}

	public int getListCountMyMatchingDel(int uno) {
		Connection con = getConnection();

		int listCount = new MypageDao().getListCountMyMatchingDel(con, uno);

		close(con);

		return listCount;
	}

	public ArrayList<MyR_M_article> selectMyMatchingDelList(int currentPage, int limit, int uno) {
		ArrayList<MyR_M_article> list = null;
		Connection con = getConnection();

		list = new MypageDao().selectMyMatchingDelList(con, currentPage, limit, uno);

		close(con);

		return list;
	}

	public int updateB_status(String value, int gno, int uno) {
		Connection con = getConnection();
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result = 0;
		int money = 0;
		money = new MypageDao().selectmoney(con, gno);
		result1 = new MypageDao().updateB_status(con, value, gno);
		result2 = new MypageDao().update_cmoneybd(con, value, gno, uno, money);
		result3 = new MypageDao().update_gisainfo(con, value, gno, uno, money);

		if (money > 0 && result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
			result = 0;
		}
		close(con);

		return result;
	}

	public ArrayList<SelectReqGisa> SelectReqGisaList(int gno) {
		ArrayList<SelectReqGisa> list = null;
		Connection con = getConnection();

		list = new MypageDao().SelectReqGisaList(gno, con);
		close(con);
		return list;
	}

	public SelectReqGisa SelectDetailGisa(int num) {
		Connection con = getConnection();
		String cname= new MypageDao().selectgisaimg(con,num);
		SelectReqGisa srg = new MypageDao().SelectDetailGisa(con, num);
		srg.setImgname(cname);
		close(con);
		return srg;
	}

	public int upReqInserMAT(int uno, int gno) {
		Connection con = getConnection();
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result = 0;
		result1 = new MypageDao().upReq(uno, gno, con);
		result2 = new MypageDao().InserMAT(uno, gno, con);
		result3 = new MypageDao().InserShipping(uno, gno, con);
		result4 = new MypageDao().up_AP(uno, gno, con);
		
		if (result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
			result = 0;
		}

		close(con);

		return result;
	}

	public ArrayList<Inquiry> selectListInMp(int currentPage, int limit, int uno) {
		Connection con = getConnection();

		ArrayList<Inquiry> list = new MypageDao().selectListIn(con, currentPage, limit, uno);
		

		close(con);

		return list;
	}

		
	public ArrayList<MyCharge> ChargeList(int uno) {
		Connection con = getConnection();

		ArrayList<MyCharge> list = new MypageDao().ChargeList(con, uno);

		close(con);

		return list;
	}

	public int updateBstatusGisa(String value, int gno) {
		Connection con = getConnection();
		int result = 0;
		result =new MypageDao().updateB_status(con, value, gno);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result ;
	}
	public ArrayList<MyExchange> ExchangeList(int uno) {
		Connection con = getConnection();
		
		ArrayList<MyExchange> list = new MypageDao().ExchangeList(con, uno);
		
		close(con);
		
		return list;
	}

	public int updateMember(String uno, String userPwd, String phone, String email, String bankName, String accnum) {
		Connection con = getConnection();
		
		int result = new MypageDao().updateMember(con, uno,userPwd,phone,email,bankName);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int leaveMember(String uno) {
		Connection con = getConnection();
		
		int result = new MypageDao().leaveMember(con, uno);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<String> findGisaImgAddr(String uno) {
		Connection con = getConnection();
		
		ArrayList<String> imgList = new MypageDao().findGisaImgAddr(con,uno);
		
		close(con);
		
		return imgList;
	}


}
