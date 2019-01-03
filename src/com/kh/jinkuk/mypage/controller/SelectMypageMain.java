
package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.cybermoney_breakdown.model.vo.PageInfo;
import com.kh.jinkuk.member.model.vo.Member;
import com.kh.jinkuk.mypage.model.service.MypageService;
import com.kh.jinkuk.mypage.model.vo.MyCharge;
import com.kh.jinkuk.mypage.model.vo.MyR_M_article;
import com.kh.jinkuk.mypage.model.vo.Mynotice;

/**
 * Servlet implementation class SelectMypageMain
 */
@WebServlet("/selectMypageMain.mp")
public class SelectMypageMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectMypageMain() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out =response.getWriter();
		
		
		Member loginUser =(Member) request.getSession().getAttribute("loginUser");
		if(loginUser ==null) {
			out.print("<script>");
			out.print("alert('로그인을 먼저 해주세요!');");
			out.print("history.go(-1);");
			out.print("</script>");
			out.flush();
			
		}
		
		else {
		if(loginUser.getUser_div().equals("신청자")) {
		int currentPage;	//현재 페이지를 표시할 변수
		int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한번에 표시될 페이지가 시작할 페이지
		int endPage;		//한번에 표시될 페이지가 끝나는 페이지
		Member user =(Member) request.getSession().getAttribute("loginUser");
		int uno=user.getU_no();
		//현재 페이지 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;
		
		MypageService ms = new MypageService();
		//내가 올린  게시글 수 조회
		int listCount = ms.getListCount(uno);
		//총 페이지 수 계산
		//예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int)((double)listCount / limit + 0.9);
		
		//현재 페이지에 보여줄 시작페이지 수
		//1, 11, 21, 31,...
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
	
		//목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Mynotice> list = new MypageService().selectList(currentPage, limit,uno);
		
		
		
		//충전내역 불러오기
		/*ArrayList<MyCharge> Clist = new  MypageService().ChargeList(uno);
		System.out.println(Clist);*/
		
		
		String page = "";
		if(list != null) {
			page = "views/mypage/mypage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		/*	request.setAttribute("Clist", Clist);*/
		}else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "게시판 조회 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		}else {
		
		int currentPage;	//현재 페이지를 표시할 변수
		int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한번에 표시될 페이지가 시작할 페이지
		int endPage;		//한번에 표시될 페이지가 끝나는 페이지
		Member user =(Member) request.getSession().getAttribute("loginUser");
		int uno=user.getU_no();
		//현재 페이지 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;
		
		MypageService ms = new MypageService();
		//내가 올린  게시글 수 조회
		int listCount = ms.getListCountMyMatchingDel(uno);
		//총 페이지 수 계산
		//예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int)((double)listCount / limit + 0.9);
		
		//현재 페이지에 보여줄 시작페이지 수
		//1, 11, 21, 31,...
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
	
		//목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<MyR_M_article> list = new MypageService().selectMyMatchingDelList(currentPage, limit,uno);
		
		String page = "";
		if(list != null) {
			page = "views/mypage/mypage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "게시판 조회 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

		
		}
		
		
		
		}
		
		
	
		
	
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}