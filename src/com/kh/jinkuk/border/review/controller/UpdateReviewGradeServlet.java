package com.kh.jinkuk.border.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.review.model.service.ReviewService;
import com.kh.jinkuk.border.review.model.vo.Review;


/**
 * Servlet implementation class UpdateReviewGradeServlet
 */
@WebServlet("/updateReviewG")
public class UpdateReviewGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int num=Integer.parseInt(request.getParameter("num"));
		String driId = request.getParameter("driId");//기사명 아이디
		
		System.out.println(num);
		System.out.println(driId);
		
		Review r = new Review();
		r.setDriname(driId);
		
		int result= new ReviewService().totalGrade(r);//점수값 받아오기
		int countResult=new ReviewService().totalCount(r);//갯수
		
		System.out.println("-----Update Review GradeServlet-----");
		System.out.println("통계 점수값"+result);
		System.out.println("통계 카운트 값"+countResult);
	
		int grade=result/countResult;
		
		int updateResult = new ReviewService().updateGrade(r,grade);
		
		response.sendRedirect("/reqtakbae/selectOneRe?num="+num);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
