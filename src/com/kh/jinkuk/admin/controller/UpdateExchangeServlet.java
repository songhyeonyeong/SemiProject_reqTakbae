package com.kh.jinkuk.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.admin.model.service.AdminService;
import com.kh.jinkuk.exchange.model.vo.Exchange;

/**
 * Servlet implementation class UpdateExchangeServlet
 */
@WebServlet("/updateEx")
public class UpdateExchangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateExchangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//request객체에서 parameter꺼내기
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);

		Exchange ex = new Exchange();
		ex.setrNum(num);

		int result = new AdminService().updateEx(ex);
		System.out.println(result);
		
		String page="";
		if(result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("/selectAll.ex");
			view.forward(request, response);
	
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
