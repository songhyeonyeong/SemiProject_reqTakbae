package com.kh.jinkuk.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.admin.model.service.AdminService;
import com.kh.jinkuk.admin.model.vo.Review;

/**
 * Servlet implementation class DeleteReviewServlet
 */
@WebServlet("/delete.re")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		try {
		int num = Integer.parseInt(request.getParameter("name"));
		System.out.println("delete num : " + num);
		
		Review m = new Review();
		m.setHno(num);
		
		int result = new AdminService().deleteReview(m);
		
		if(result > 0) {
			response.sendRedirect("/reqtakbae/selectAll.re"); //재요청
			
		}
		}catch(NumberFormatException e) {
			e.printStackTrace();
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
