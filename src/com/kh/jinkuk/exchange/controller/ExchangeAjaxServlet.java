package com.kh.jinkuk.exchange.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.exchange.model.service.ExchangeService;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class ExchangeAjaxServlet
 */
@WebServlet("/ExchangeAjaxServlet")
public class ExchangeAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExchangeAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
////		int uNo = loginUser.getU_no();
//		
//		int money = new ExchangeService().SearchMoney(uNo);
//		
//		response.getWriter().print(money);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
