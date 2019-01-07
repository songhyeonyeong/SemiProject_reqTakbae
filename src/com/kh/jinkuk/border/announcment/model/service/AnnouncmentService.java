package com.kh.jinkuk.border.announcment.model.service;

import static com.kh.jinkuk.common.JDBCTemplate.close;
import static com.kh.jinkuk.common.JDBCTemplate.commit;
import static com.kh.jinkuk.common.JDBCTemplate.getConnection;
import static com.kh.jinkuk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jinkuk.border.announcment.model.dao.AnnouncmentDao;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.border.announcment.model.vo.InsertAnnouncment;
import com.kh.jinkuk.member.model.vo.Images;

public class AnnouncmentService {

	// 페이징처리 적용한 전체 게시물 조회용 메소드
	public ArrayList<Announcment> selectList(int currentPage, int limit, String gongdiv) {
		Connection con = getConnection();

		ArrayList<Announcment> list = new AnnouncmentDao().selectList(con, currentPage, limit, gongdiv);

		close(con);

		return list;
	}

	public int getListCount(String gongdiv) {

		Connection con = getConnection();
		int listCount = new AnnouncmentDao().getListCount(con, gongdiv);
		close(con);
		return listCount;
	}

	// 전체 상세페이지
	public Announcment selectOne(int num) {

		Connection con = getConnection();

		Announcment result = new AnnouncmentDao().selectOne(con, num);

		close(con);
		return result;
	}

	/*
	 * //당일 상세페이지 public Announcment selectOneToday(int num) {
	 * 
	 * Connection con = getConnection();
	 * 
	 * Announcment a = null;
	 * 
	 * Announcment result = new AnnouncmentDao().selectOneToday(con, num);
	 * 
	 * new AnnouncmentDao().updateCount(con, num);
	 * 
	 * if(result !=null ) { commit(con); }else { rollback(con); }
	 * 
	 * close(con);
	 * 
	 * return result; }
	 */

	// 게시판 작성페이지
	public int insertBoard(InsertAnnouncment i, Images image, String gongdiv) {
		Connection con = getConnection();
		int result1 = 0, result2 = 0, result3 = 0, result4 = 0, result5 = 0, result6 = 0;
		int result = 0;
		result1 = new AnnouncmentDao().insertBoard(con, i, gongdiv);
		result2 = new AnnouncmentDao().insertANNOUNCEPAY(con, i);
		if (i.getPoint() > 0) {
			result3 = new AnnouncmentDao().insertPointbd(con, i);
		} else if (i.getPoint() == 0) {
			result3 = 1;
		}
		result4 = new AnnouncmentDao().insertcmoneybd(con, i);
		result5 = new AnnouncmentDao().updatemembermoney(con, i);
		result6 = new AnnouncmentDao().insertimage(con, image);
		
		 System.out.println("공고테이블 삽입 결과 :" + result1);
		 System.out.println("공고상세 테이블 삽입 결과 :" + result2);
		 System.out.println("포인트내역 삽입 결과 :" + result3);
		 System.out.println("싸이버머니내역테이블 삽입 결과 :" + result4);
		 System.out.println("회원정보 업데이트 결과 :" + result5);
		 System.out.println("이미지 삽입 결과:"+result6);

		if (result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0 && result6 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
			result = 0;
		}
		return result;
	}

	public Images selectImage(int num) {
		Connection con = getConnection();

		Images result = new AnnouncmentDao().selectImage(con, num);

		close(con);

		return result;
	}

	public int insertReqATC(int uno, int gno) {

		Connection con = getConnection();

		int result = 0, result1 = 0, result2 = 0;

		result2 = new AnnouncmentDao().findReq(con, uno, gno);

		if (result2 > 0) {
			result = 0;
		} else {
			result1 = new AnnouncmentDao().insertReqATC(con, uno, gno);
			if (result1 > 0) {
				result = 1;
				commit(con);
			}
			rollback(con);
		}

		close(con);

		return result;
	}

	public int deleteBoard(int gno) {
		Connection con = getConnection();
		
		int result = new AnnouncmentDao().deleteBoard(con, gno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;

}
