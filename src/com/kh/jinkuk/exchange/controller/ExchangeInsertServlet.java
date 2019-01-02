package com.kh.jinkuk.exchange.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.exchange.model.service.ExchangeService;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class ExchangeInsertServlet
 */
@WebServlet("/ExchangeInsertServlet")
public class ExchangeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExchangeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int money = Integer.parseInt(request.getParameter("exmoney"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uNo = loginUser.getU_no();
		int rmoney = money - (int)(money*0.2);
		
		int result = new ExchangeService().InsertExchange(uNo, money, rmoney);
		
		if(result > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('환전 신청 완료'); location.href='"+request.getContextPath()+"/ExchangeServlet';</script>");
			out.close();
		}else {
			request.setAttribute("msg", "환전 신청 실패");
			
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
