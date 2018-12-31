package com.kh.jinkuk.admin.controller;

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
@WebServlet("/selectOne.in")
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
		String num = request.getParameter("num");
		
		System.out.println(num);
		
		
		Inquiry n = new AdminService().selectOne(num);
		Inquiry m = new AdminService().selectOneReply(num);
		System.out.println(n);
		System.out.println(m);
		String page = "";
		
		if(n != null && m != null) {
			page = "/views/admin/qnaView.jsp";
			request.setAttribute("n", n);
			request.setAttribute("m", m);
		
		}else if(n != null && m == null){
			page = "/views/admin/qnaView.jsp";
			request.setAttribute("n", n);
			request.setAttribute("m", m);
			
		}else {

			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문의게시글 상세보기 실패!");

		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
