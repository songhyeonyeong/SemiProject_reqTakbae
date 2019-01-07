package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.mypage.model.service.MypageService;

/**
 * Servlet implementation class getSElocation
 */
@WebServlet("/getselocation.mp")
public class getSElocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getSElocation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gno =Integer.parseInt(request.getParameter("gno"));
		String []stEd =new String[2];
		stEd  =new MypageService().selectSE(gno);
		System.out.println(stEd[0]);
		System.out.println(stEd[1]);
		String page="";
		if(stEd!=null) {
			page="views/mypage/basonglocation.jsp";
			request.setAttribute("start", stEd[0]);
			request.setAttribute("end", stEd[1]);
			request.getRequestDispatcher(page).forward(request, response);
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
