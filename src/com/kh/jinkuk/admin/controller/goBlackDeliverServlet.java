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
 * Servlet implementation class goBlackDeliverServlet
 */
@WebServlet("/goBlack.de")
public class goBlackDeliverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goBlackDeliverServlet() {
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
		//request객체에서 parameter꺼내기
		String[] userId = request.getParameterValues("selected[]");
		for(int i = 0 ; i < userId.length; i++) {
			System.out.println(userId[i]);
			Admin m = new Admin();
			m.setUserId(userId[i]);
			result = new AdminService().goBlackDeliver(m);
			System.out.println(result);
		}
		
		
		String page="";
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
