package com.kh.jinkuk.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.admin.model.service.AdminService;
import com.kh.jinkuk.admin.model.vo.Admin;

/**
 * Servlet implementation class DeleteBlackListServlet
 */
@WebServlet("/delete.bl")
public class DeleteBlackListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBlackListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int result = 0;
		String[] userId = request.getParameterValues("memCheck");
		for(int i = 0; i< userId.length; i++) {
			System.out.println("cancle UserId : " + userId[i]);
			
			Admin m = new Admin();
			m.setUserId(userId[i]);
			
			result = new AdminService().deleteBlack(m);
			
		}
		
		if(result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("/selectAll.bl");
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
