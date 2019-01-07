package com.kh.jinkuk.border.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.review.model.service.ReviewService;

/**
 * Servlet implementation class DeleteReviewOneServlet
 */
@WebServlet("/deleteReview")
public class DeleteReviewOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int hno = Integer.parseInt(request.getParameter("hno"));
		
		System.out.println("DeleteReview hno : "+hno);
		
		int result = new ReviewService().deleteReview(hno);
		
		System.out.println("완료된 DeleteReview : "+result);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectReview");
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
