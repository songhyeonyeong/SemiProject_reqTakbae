package com.kh.jinkuk.border.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.review.model.service.ReviewService;
import com.kh.jinkuk.border.review.model.vo.Review;

/**
 * Servlet implementation class UpdateGradeServlet
 */
@WebServlet("/totalGrade")
public class UpdateGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uno=Integer.parseInt(request.getParameter("uno"));
		int gno = Integer.parseInt(request.getParameter("gno"));
		String driname = request.getParameter("driname");
		int score = Integer.parseInt(request.getParameter("score"));
		
		System.out.println("---UpdateGradeServlet---");
		System.out.println(uno);
		System.out.println(gno);
		System.out.println(driname);
		System.out.println(score); //방금 인서트한 후기 정보들
		
		Review r = new Review();
		r.setDriname(driname);
		
		
		//평점 업데이트 
		
		ArrayList<Review> list = new ReviewService().selectGradeList(r);
		
	
		
	
	
	
	
	
	
	
	
	response.sendRedirect(request.getContextPath() + "/selectReview?gno="+gno);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
