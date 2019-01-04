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
		String driname = request.getParameter("driname");//기사명 아이디
		String userid=request.getParameter("writer");
		int gno = Integer.parseInt(request.getParameter("gno"));
		int uno=Integer.parseInt(request.getParameter("uno"));
		
		

		int score = Integer.parseInt(starScore);

		System.out.println("제목"+title);
		System.out.println("별점"+score);
		System.out.println("내용"+context);
		System.out.println("기사이름"+driname);//기사 아이디
		System.out.println("작성자 아이디"+userid);//작성자 아이디
		System.out.println("공고 번호"+gno);
		System.out.println("작성자 회원 번호"+uno);
	

		Review r = new Review();
		r.sethTitle(title);//입력된 제목
		r.sethGrade(score);//별점
		r.sethContext(context);//내용
		r.setDriname(driname);//기사 아이디
		r.setUname(userid);//작성자 아이디
		r.setUno(uno);//작성자 회원 번호 
		r.setGno(gno);//공고 번호 
		

		int result = new ReviewService().insertReview(r);//후기 인서트
		System.out.println("후기 인서트 완료" );
		
		
		String page = "";
		if(result > 0) {
			//response.sendRedirect(request.getContextPath()+"/totalGreade?");
			
			response.sendRedirect(request.getContextPath()+"/updatePoint?uno="+uno+"&&gno="+gno+"&&score="+score+"&&driname="+driname);
			//score , driname , gno , uno
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
