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
import com.kh.jinkuk.admin.model.vo.Announcment;

/**
 * Servlet implementation class FilterSearchDeliverServlet
 */
@WebServlet("/searchDeli.fi")
public class FilterSearchDeliverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterSearchDeliverServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String destination = request.getParameter("destination");
		String size = request.getParameter("size");
		String status = request.getParameter("status");
		
		System.out.println("도착지 : " + destination + " 크기 : " + size + " 상태 : " + status);
		

		Announcment a = new Announcment();
		a.setG_E_AREA(destination);
		a.setG_SIZE(size);
		a.setA_status(status);

		
		ArrayList<Announcment> list = new AdminService().selectFilterDel(a);
		System.out.println(list);
		
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			
			page = "/views/admin/todayNoticeList_search.jsp";
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
