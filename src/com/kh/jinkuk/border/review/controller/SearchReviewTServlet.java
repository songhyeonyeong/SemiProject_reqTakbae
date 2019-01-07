package com.kh.jinkuk.border.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.review.model.service.ReviewService;
import com.kh.jinkuk.border.review.model.vo.PageInfo;
import com.kh.jinkuk.border.review.model.vo.Review;

/**
 * Servlet implementation class SearchReviewTServlet
 */
@WebServlet("/searchRe.re")
public class SearchReviewTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchReviewTServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// title,writer,driname
		String select = request.getParameter("select");
		System.out.println("SearchReview 조건: " + select);// option종류
	
		ArrayList<Review> list = null;
		
		if (select.equals("title")) {
			String titleS = request.getParameter("searchText");
			System.out.println("SearchReview 조건: " + titleS);// 입력한 값
			list = new ReviewService().searchT(titleS);

		} else if (select.equals("writer")) {
			String writerS = request.getParameter("searchText");
			System.out.println("SearchReview 조건: " + writerS);// 입력한 값
			list = new ReviewService().searchW(writerS);

		} else if (select.equals("driname")) {
			String driS = request.getParameter("searchText");
			System.out.println("SearchReview 조건: " + driS);// 입력한 값
			list = new ReviewService().searchD(driS);

		}
		
		System.out.println("검색 확인 : "+list);
		
		String page = "";
		if(list != null) {
			
			request.setAttribute("list", list);
			request.setAttribute("select", select);
			
			page = "/views/board/reviewSearchList.jsp";
			
		}else {
			request.setAttribute("msg", "검색 실패!");
			
			page = "/views/common/errorPage.jsp";
		}
		
		
		RequestDispatcher view  = request.getRequestDispatcher(page);
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
