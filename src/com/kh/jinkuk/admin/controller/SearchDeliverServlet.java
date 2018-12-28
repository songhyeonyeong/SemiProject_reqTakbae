package com.kh.jinkuk.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.admin.model.service.AdminService;
import com.kh.jinkuk.admin.model.vo.Admin;

/**
 * Servlet implementation class SearchDeliverServlet
 */
@WebServlet("/search.de")
public class SearchDeliverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDeliverServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String optVal = request.getParameter("select");
		System.out.println("print : " + optVal);
		
		ArrayList<Admin> list = null;
		
		if(optVal.equals("userId")) {
			String userId = request.getParameter("searchTxt");
			System.out.println(userId);
			list = new AdminService().DeliversearchId(userId);
			System.out.println(list);
		}else{
			String userName = request.getParameter("searchTxt");
			System.out.println(userName);
			list = new AdminService().DeliversearchName(userName);
			System.out.println(list);
		}
		
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("optVal", optVal);
			
			page = "/views/admin/memberList2_search.jsp";
		}else {
			request.setAttribute("msg", "검색 실패!");
			
			page = "/views/common/errorPage.jsp";
		}
		
		RequestDispatcher view  = request.getRequestDispatcher(page);
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
