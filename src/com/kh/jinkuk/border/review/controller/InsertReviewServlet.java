package com.kh.jinkuk.border.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.review.model.service.ReviewService;
import com.kh.jinkuk.border.review.model.vo.Review;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/insertReview")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertReviewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 제목 별점 내용 기사명 작성자아이디
		String title = request.getParameter("title");
		String starScore = request.getParameter("starScore");
		String context = request.getParameter("reviewContext");
		String driname = request.getParameter("driname");
		
		String u_id = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getU_no());
		//로그인한 회원의 u_no받아오기

		int score = Integer.parseInt(starScore);

		System.out.println(title);
		System.out.println(score);
		System.out.println(context);
		System.out.println(driname);
		System.out.println(u_id);
	

		Review r = new Review();
		r.sethTitle(title);
		r.sethGrade(score);
		r.sethContext(context);
		r.setDriname(driname);
		r.setUname(u_id);

		int result = new ReviewService().insertReview(r);
		System.out.println("insertReview 최종 result"+result);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectReview");
		}else {
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
