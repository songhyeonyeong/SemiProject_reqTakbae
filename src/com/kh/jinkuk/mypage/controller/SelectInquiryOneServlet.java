package com.kh.jinkuk.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.admin.model.service.AdminService;
import com.kh.jinkuk.admin.model.vo.Inquiry;

/**
 * Servlet implementation class SelectInquiryOneServlet
 */
@WebServlet("/selectMyinquiredetail.mp")
public class SelectInquiryOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectInquiryOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//문의 게시글  + 댓글이 존재하는 게시글의 댓글 내용 불러오는 서블릿
		try {
		int num = Integer.parseInt(request.getParameter("num"));
		
//		System.out.println(num);
		
		
		Inquiry n = new AdminService().selectOne(num);
		Inquiry m = new AdminService().selectOneReply(num);
//		System.out.println(n);
//		System.out.println(m);
		String page = "";
		
		if(n != null && m != null) {
			page = "/views/mypage/myQnaView.jsp";
			request.setAttribute("n", n);
			request.setAttribute("m", m);
		
		}else {
			page = "/views/mypage/myQnaView.jsp";
			request.setAttribute("n", n);
			request.setAttribute("m", m);
			
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
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
