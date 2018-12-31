package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.mypage.model.service.MypageService;
import com.kh.jinkuk.mypage.model.vo.SelectReqGisa;

/**
 * Servlet implementation class SelectMyReqGisa
 */
@WebServlet("/selectreqGisa.mp")
public class SelectMyReqGisa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMyReqGisa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gno= Integer.parseInt(request.getParameter("gno"));
		
		ArrayList<SelectReqGisa> list =new MypageService().SelectReqGisaList(gno);
		String page="";
		/*if(list!=null) {*/
			page="views/mypage/deliDetail.jsp";
			request.setAttribute("list", list);
			request.getRequestDispatcher(page).forward(request, response);
	/*	}
		*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
