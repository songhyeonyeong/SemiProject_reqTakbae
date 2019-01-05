package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.member.model.vo.Member;
import com.kh.jinkuk.mypage.model.service.MypageService;

/**
 * Servlet implementation class LeaveMember
 */
@WebServlet("/leaveMember")
public class LeaveMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uno = request.getParameter("uno");
		
		int result = new MypageService().leaveMember(uno);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.println("<script>");
			out.println("alert('회원탈퇴가 완료되었습니다');");
			

		}else {
			out.println("alert('회원탈퇴가 실패했습니다');");
		}
		
		out.println("location.href='/reqtakbae/logout.me'");
		out.println("</script>");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
