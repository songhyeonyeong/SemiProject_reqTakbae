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
import com.kh.jinkuk.border.review.model.vo.Review;
import com.kh.jinkuk.border.review.model.vo.PageInfo;


/**
 * Servlet implementation class SelectReviewListServlet
 */
@WebServlet("/selectReview")
public class SelectReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		String driname=request.getParameter("driname");
		System.out.println("기사명 넘어옴 확인"+driname);
		
		currentPage=1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println("확인");
		limit =10;
		
		ReviewService rs = new ReviewService();
		//전체 게시글 수 조회
		int listCount = rs.getListCount();
		
		System.out.println("열 개수"+listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Review> list = new ReviewService().selectList(currentPage, limit,driname);
		
		
		
		System.out.println("서블릿 종료 후 list"+list);
		
		
		String page = "";
	
		if(list!=null) {
			page = "views/board/reviewList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		
		}else {
			page="views/board/errorPage.jsp";
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
