package com.kh.jinkuk.border.inquire.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import com.kh.jinkuk.border.inquire.model.service.InquireService;
import com.kh.jinkuk.border.inquire.model.vo.Inquire;

/**
 * Servlet implementation class SelectOneInquireServlet
 */
@WebServlet("/selectOneIn")
public class SelectOneInquireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneInquireServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
	
		System.out.println("selectOneIn num 번호 :"+num);
		
		
		Inquire i = new InquireService().selectOne(num);

		Inquire ai=new InquireService().selectAdminOne(num);
		
		//관리자가 댓글을 달지 않았을 경우 
		if(ai!=null) {
		request.setAttribute("ai", ai);
		}
		
			String page = "";
		
			page="views/board/qnaView.jsp";
			request.setAttribute("i", i);
		
			System.out.println("문의 상세보기  i"+i);
			
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
