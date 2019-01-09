package com.kh.jinkuk.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.admin.model.service.AdminService;
import com.kh.jinkuk.admin.model.vo.ChartMonth2;

/**
 * Servlet implementation class SelectChartServlet
 */
@WebServlet("/SelectChartMonthServlet")
public class SelectChartMonthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectChartMonthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = Integer.parseInt(request.getParameter("year"));
		/*ArrayList<ChartMonth> c = new AdminService().selectChartMonth(year);*/
		ChartMonth2 c =  new AdminService().selectChartMonth2(year);
		int total = new AdminService().selectCharttotal();
		int today = new AdminService().selectCharttoday();
		int yesterday = new AdminService().selectChartyesterday();
		
		
		String page = "";
		if(c != null) {
			request.setAttribute("c", c);
			request.setAttribute("year", year);
			request.setAttribute("total", total);
			request.setAttribute("today", today);
			request.setAttribute("yesterday", yesterday);
			page = "/views/admin/statisticsmonth.jsp";
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