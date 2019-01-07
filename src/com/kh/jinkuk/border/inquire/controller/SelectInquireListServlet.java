package com.kh.jinkuk.border.inquire.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.inquire.model.service.InquireService;
import com.kh.jinkuk.border.inquire.model.vo.Inquire;
import com.kh.jinkuk.border.inquire.model.vo.PageInfo;

/**
 * Servlet implementation class SelectInquireListServlet
 */
@WebServlet("/selectInquireList")
public class SelectInquireListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectInquireListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println("확인");
		limit = 10;

		InquireService is = new InquireService();
		int listCount = is.getListCount();

		System.out.println("열 개수" + listCount);

		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Inquire> list = new InquireService().selectList(currentPage, limit);

		
		ArrayList<Inquire> statuslist = new InquireService().selectRefList();//댓글 상태 쭉 가져오기
		System.out.println("댓글 상태 확인"+statuslist);
		
		
	
		for(int i=0;i<list.size();i++) {
			for(int j=0;j<statuslist.size();j++) {
				if(list.get(i).getM_no()==statuslist.get(j).getRefstatus()) {
					list.get(i).setRefstatus(1);
					
				}
			}
		}
		
		
		System.out.println("서블릿 종료 후 list" + list);

		String page = "";
		if (list != null) {
			page = "views/board/qnaList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/board/errorPage.jsp";
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

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
