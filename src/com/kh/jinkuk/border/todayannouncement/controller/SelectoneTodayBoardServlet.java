//package com.kh.jinkuk.border.todayannouncement.controller;
//
//import java.io.IOException;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.kh.jinkuk.border.announcment.model.service.AnnouncmentService;
//import com.kh.jinkuk.border.announcment.model.vo.Announcment;
//import com.kh.jinkuk.border.todayannouncement.model.service.todayannouncementService;
//
///**
// * Servlet implementation class SelectoneTodayBoardServlet
// */
//@WebServlet("/selectoneTodayList.bo")
//public class SelectoneTodayBoardServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	/**
//	 * @see HttpServlet#HttpServlet()
//	 */
//	public SelectoneTodayBoardServlet() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		int num = Integer.parseInt(request.getParameter("num"));
//		Announcment a = new todayannouncementService().selectOneToday(num);
//		String page = "";
//
//		if (a != null) {
//			page = "views/board/todayNoticeView.jsp";
//			request.setAttribute("a", a);
//		} else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "게시판 상세조회 실패!");
//		}
//
//		RequestDispatcher view = request.getRequestDispatcher(page);
//		view.forward(request, response);
//	}
//
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
