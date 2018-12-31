package com.kh.jinkuk.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.member.model.service.MemberService;

/**
 * Servlet implementation class PwFindServlet
 */
@WebServlet("/findPw.me")
public class PwFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String userDiv = request.getParameter("userDiv");
		String findDiv = request.getParameter("findDiv");
		String id = request.getParameter("id");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println("비밀번호찾기 findDiv : " + findDiv);
		System.out.println("비밀번호찾기 userPwd : " + userPwd);
		
		int pwUpdate = new MemberService().findPw(name, email, userDiv,id,userPwd);
		
		if(pwUpdate>0) {			
			request.setAttribute("userPwd", userPwd);
			request.setAttribute("findDiv", findDiv);
			

			request.getRequestDispatcher("/sendId").forward(request, response);
			
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
