package com.kh.jinkuk.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.member.model.service.MemberService;

/**
 * Servlet implementation class Visit
 */
@WebServlet("/Visit")
public class Visit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Visit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		boolean check = new MemberService().visitcheck(id);
		boolean check2 = new MemberService().visitcheck2();
		
		System.out.println(check);
		if(!check && !id.equals("admin")) {
			int visit = new MemberService().visitup(id);
		}
		
		if(!check2 && !id.equals("admin")) {
			int sdatein = new MemberService().sdatein();
		}
		
		if(!check && check2 && !id.equals("admin")) {
			int sdateup = new MemberService().sdateup();
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