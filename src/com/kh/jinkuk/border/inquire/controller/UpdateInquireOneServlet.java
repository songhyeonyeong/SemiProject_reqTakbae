package com.kh.jinkuk.border.inquire.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.inquire.model.service.InquireService;
import com.kh.jinkuk.border.inquire.model.vo.Inquire;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class UpdateInquireOneServlet
 */
@WebServlet("/updateInquireOne")
public class UpdateInquireOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInquireOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String context = request.getParameter("context");
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUser_id());
		String uno = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getU_no());
		String date=request.getParameter("date");
		int num = Integer.parseInt(request.getParameter("mno"));
		
		System.out.println(title);
		System.out.println(context);
		System.out.println(writer);
		System.out.println(uno);
		System.out.println(date);
		System.out.println(num);
		
	java.sql.Date day = null;
		
		if(date != "") {
			String[] drr = date.split("-");
			int[] irr = new int[drr.length];
			for(int i = 0; i < irr.length; i++) {
				irr[i] = Integer.parseInt(drr[i]);
			}
			
			day = new java.sql.Date(new GregorianCalendar(irr[0], irr[1] - 1, irr[2]).getTimeInMillis());
		}else {
			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		Inquire i = new Inquire();
		i.setM_title(title);
		i.setM_context(context);
		i.setM_date(day);
		i.setM_no(num);
		
		int result = new InquireService().updateInquire(i);
		
		String page="";
		if(result>0) {
			response.sendRedirect("/reqtakbae/selectOneIn?num="+num);
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
