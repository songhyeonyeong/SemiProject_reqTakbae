package com.kh.jinkuk.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.member.model.service.MemberService;
import com.kh.jinkuk.member.model.vo.Member;

@WebServlet("/Login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out =response.getWriter();

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		System.out.println(userId);
		System.out.println(userPwd);
		Member reqMember = new Member();
		reqMember.setUser_id(userId);
		reqMember.setUser_pwd(userPwd);

		Member loginUser = new MemberService().loginCheck(reqMember);
		/*if (loginUser != null) {
			request.getSession().setAttribute("loginUser", loginUser);

			if (loginUser.getUser_id().equals("admin")) {
				response.sendRedirect("/reqtakbae/admin.no");
			} else {
				response.sendRedirect("index.jsp");
			}
		} else {
			out.print("<script>");
			out.print("alert('로그인실패!');");
			out.print("history.go(-1);");
			out.print("</script>");
			out.flush();


		}*/
		
		if(loginUser == null) {
			out.print("<script>");
			out.print("alert('로그인실패!');");
			out.print("history.go(-1);");
			out.print("</script>");
			out.flush();
		}else if(loginUser !=null) {
			if(loginUser.getStatus().equals("Y")) {
				request.getSession().setAttribute("loginUser", loginUser);
				
				if(loginUser.getUser_id().equals("admin")) {
					response.sendRedirect("/reqtakbae/admin.no");
				}else {
					response.sendRedirect("index.jsp");
				}
				
			}else if(loginUser.getStatus().equals("W")) {
				response.getWriter().println("<script>alert('관리자 승인중');");
				response.getWriter().println("window.location='index.jsp'</script>");
			
			}else if(loginUser.getStatus().equals("C")) { 
				response.getWriter().println("<script>alert('가입 거절됨');");
				response.getWriter().println("window.location='/reqtakbae/deleteCMember?uno="+loginUser.getU_no()+"'");
				response.getWriter().println("</script>");
			
			}else if(loginUser.getStatus().equals("N")) {
				response.getWriter().println("<script>alert('로그인 실패');history.go(-1);</script>");
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
