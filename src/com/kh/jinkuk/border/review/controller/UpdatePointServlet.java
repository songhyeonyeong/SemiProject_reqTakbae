package com.kh.jinkuk.border.review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.review.model.service.ReviewService;
import com.kh.jinkuk.border.review.model.vo.Review;

/**
 * Servlet implementation class UpdatePointServlet
 */
@WebServlet("/updatePoint")
public class UpdatePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePointServlet() {
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
		
		System.out.println("---UpdatePointServlet---");
		System.out.println(uno);
		System.out.println(gno);
		System.out.println(driname);
		
		
		
		Review r = new Review();
		r.setUno(uno);
		r.setGno(gno);
		
		int resultPoint = new ReviewService().updatePoint(r);//후기 작성시 해당 맴버의 포인트 업데이트 
		
		System.out.println("포인트 업데이트 "+resultPoint);
		
		
		
		String page = "";
		
		if(resultPoint > 0) {
			
			PrintWriter out = response.getWriter();
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			out.println("<script language='javascript'>");
			
			out.println("alert('포인트 100P가 지급되었습니다.'); location.href='/reqtakbae/totalGrade?gno="+gno+"&&driname="+driname+"' ;"); 
			
			out.println("</script>");
			
			out.flush();
			out.close();
			
			
			//response.sendRedirect(request.getContextPath() + "/selectReview?gno="+gno);
		}else {
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
