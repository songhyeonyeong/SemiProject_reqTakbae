package com.kh.jinkuk.exchange.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jinkuk.exchange.model.service.ExchangeService;
import com.kh.jinkuk.exchange.model.vo.ExchangeAjax;

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
		int uNo = Integer.parseInt(request.getParameter("uno"));
		
		/*int money = new ExchangeService().SearchMoney(uNo);
		response.getWriter().print(money);*/
		
		ExchangeAjax ex = new ExchangeService().SearchMoneye(uNo);
		HashMap<String, ExchangeAjax> userMap = new HashMap<String, ExchangeAjax>();
		userMap.put("ex", ex);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(userMap, response.getWriter());
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
