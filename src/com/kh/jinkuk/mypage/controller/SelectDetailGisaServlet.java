package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jinkuk.member.model.vo.Images;
import com.kh.jinkuk.mypage.model.service.MypageService;
import com.kh.jinkuk.mypage.model.vo.SelectReqGisa;

/**
 * Servlet implementation class SelectDetailGisaServlet
 */
@WebServlet("/selectdetailgisa.mp")
public class SelectDetailGisaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDetailGisaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num =Integer.parseInt(request.getParameter("num"));
		SelectReqGisa srg= new MypageService().SelectDetailGisa(num);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(srg, response.getWriter());
		
	/*	if(srg!=null) {
			request.setAttribute("detailGisa",srg);
			request.getRequestDispatcher("/views/mypage/deliDetailPop.jsp").forward(request, response);
			
			
		}*/
		
		
		
		
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
