package com.kh.jinkuk.border.inquire.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.inquire.model.service.InquireService;
import com.kh.jinkuk.border.inquire.model.vo.Inquire;

/**
 * Servlet implementation class UpdateInquireServlet
 */
@WebServlet("/updateInquire")
public class UpdateInquireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInquireServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("mno"));//수정 하기 게시글 번호
		
		Inquire i =new InquireService().selectOne(num);
		
		String page = "";
		
		if(i!= null) {
			page = "views/board/qnaUpdate.jsp";
			request.setAttribute("i", i);
		}else {
			page="views/common/errorPage.jsp";
			
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
