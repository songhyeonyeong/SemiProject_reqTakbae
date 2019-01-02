package com.kh.jinkuk.border.inquire.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.inquire.model.service.InquireService;
import com.kh.jinkuk.border.inquire.model.vo.Inquire;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class InsertInquireServlet
 */
@WebServlet("/insertInquire")
public class InsertInquireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInquireServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title=request.getParameter("title");
		String context=request.getParameter("context");
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUser_id());
		String uno = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getU_no());
		String date=request.getParameter("date");
		
		int u_no = Integer.valueOf(uno);
		
		System.out.println(title);
		System.out.println(context);
		System.out.println(writer);
		System.out.println(uno);
		System.out.println(date);
		
		Inquire i=new Inquire();
		i.setM_title(title);
		i.setM_context(context);
		i.setU_no(u_no);
		i.setUser_id(writer);
		
		int result = new InquireService().insertInquire(i);
		
		String page = "";
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/selectInquireList");
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
