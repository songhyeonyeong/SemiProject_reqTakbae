package com.kh.jinkuk.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.admin.model.service.AdminService;
import com.kh.jinkuk.admin.model.vo.ChartDay;

/**
 * Servlet implementation class SelectChartToday
 */
@WebServlet("/SelectChartToday")
public class SelectChartToday extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectChartToday() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		
		int total = new AdminService().selectCharttotal();
		int today = new AdminService().selectCharttoday();
		int yesterday = new AdminService().selectChartyesterday();
		
		ChartDay ch = new AdminService().selectChartday(year, month);
		String page = "";
		if(total != 0) {
			request.setAttribute("year", year);
			request.setAttribute("total", total);
			request.setAttribute("today", today);
			request.setAttribute("yesterday", yesterday);
			request.setAttribute("month", month);
			request.setAttribute("ch", ch);
			page = "/views/admin/statisticsday.jsp";
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
