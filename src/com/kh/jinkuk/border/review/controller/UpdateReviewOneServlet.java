package com.kh.jinkuk.border.review.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.review.model.service.ReviewService;
import com.kh.jinkuk.border.review.model.vo.Review;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class UpdateReviewOneServlet
 */
@WebServlet("/updateOneR")
public class UpdateReviewOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	int num=Integer.parseInt(request.getParameter("hno"));
	String title = request.getParameter("title");//제목
	String starScore = request.getParameter("starScore");//별점
	String context = request.getParameter("reviewContext");//내용
	String driname = request.getParameter("driname");//기사명 아이디
	String userid=request.getParameter("writer");//작성자 아이디
	int uno=Integer.parseInt(request.getParameter("uno"));//작성자 회원번호
	String date=request.getParameter("date");//날짜
	String driId=request.getParameter("driId");
	
	int score = Integer.parseInt(starScore);

	System.out.println("후기 글 번호"+num);
	System.out.println("제목"+title);
	System.out.println("별점"+score);
	System.out.println("내용"+context);
	System.out.println("기사이름"+driname);//기사 이름
	System.out.println("기사 아이디 "+driId);
	System.out.println("작성자 아이디"+userid);//작성자 아이디
	System.out.println("작성자 회원 번호"+uno);
	
		
	java.sql.Date day = null;
	
	if(date != "") {
		String[] drr = date.split("-");
		int[] irr = new int[drr.length];
		for(int i = 0; i < irr.length; i++) {
			irr[i] = Integer.parseInt(drr[i]);
		}
		
		day = new java.sql.Date(new GregorianCalendar(irr[0], irr[1] - 1, irr[2]).getTimeInMillis());
	}else {
		day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
	}
		
	Review r=new Review();
	r.setHno(num);
	r.sethTitle(title);
	r.sethContext(context);
	r.sethDate(day);
	r.sethGrade(score);
	r.setDriname(driname);
	r.setUname(userid);
	r.setUno(uno);
	
	
	
	int result = new ReviewService().updateReview(r);
	
	
	
	String page="";
	if(result>0) {//????
		response.sendRedirect(request.getContextPath() + "/updateReviewG?num="+num+"&&userid="+userid+"&&driId="+driId);
		
		//response.sendRedirect("/reqtakbae/selectOneRe?num="+num);
	}
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
