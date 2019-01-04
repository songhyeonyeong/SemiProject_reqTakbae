package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.mypage.model.service.MypageService;

/**
 * Servlet implementation class ModifyMember
 */
@WebServlet("/modifyMember.me")
public class ModifyMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uno = request.getParameter("uno");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String bankName = request.getParameter("bankName");
		String accnum = request.getParameter("accnum");
		
		System.out.println("uno : " + uno);
		System.out.println("userPwd : " + userPwd);
		System.out.println("phone : " + phone);
		System.out.println("email : " + email);
		System.out.println("bankName : " + bankName);
		System.out.println("accnum : " + accnum);
		
		int result = new MypageService().updateMember(uno,userPwd,phone,email,bankName,accnum);
		
		if(result>0) {
			response.getWriter().print("YES");
		}else {
			response.getWriter().print("NO");
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
