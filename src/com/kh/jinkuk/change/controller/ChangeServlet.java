package com.kh.jinkuk.change.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jinkuk.change.model.vo.Change;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class ChangeServlet
 */
@WebServlet("/ChangeServlet")
public class ChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String amount = request.getParameter("amount");
		String approval = request.getParameter("approval");
		String msg = request.getParameter("msg");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUser_id();
		
		System.out.println(msg);
		System.out.println(userId);
		System.out.println(amount);
		System.out.println(approval);
		
		Change change = new Change();
		
		response.setContentType("text/html; charset=UTF-8");
        
        /*PrintWriter out = response.getWriter();
        out.println("<script>"
        		+ "alert('ㅁㅇㄴㄹ')"
        		+ "location.href=""
        		+ "</script>");*
        out.close();*/


		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
