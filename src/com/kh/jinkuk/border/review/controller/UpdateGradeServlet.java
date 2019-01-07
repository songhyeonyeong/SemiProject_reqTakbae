package com.kh.jinkuk.border.review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		int gno = Integer.parseInt(request.getParameter("gno"));
		String driname = request.getParameter("driname");//후기 기사아이디
		
	
		
		System.out.println("---UpdateGradeServlet---");
		System.out.println(gno);
		System.out.println(driname);
		
		Review r = new Review();
		r.setDriname(driname);
		
		
		//평점 업데이트 
		
		
		int result= new ReviewService().totalGrade(r);//점수값 받아오기
		int countResult=new ReviewService().totalCount(r);//갯수
		
		System.out.println("-----UpdateGradeServlet-----");
		System.out.println("통계 점수값"+result);
		System.out.println("통계 카운트 값"+countResult);
		
		int grade=result/countResult;
		
		int updateResult = new ReviewService().updateGrade(r,grade);
		
		System.out.println("updateResult"+updateResult);
		
		
		
	
	response.sendRedirect(request.getContextPath() + "/selectReview?gno="+gno+"&&driname="+driname);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
