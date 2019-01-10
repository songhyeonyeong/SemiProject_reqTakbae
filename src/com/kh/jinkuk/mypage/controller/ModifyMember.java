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
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
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
		
		PrintWriter out = response.getWriter();
		//response.sendRedirect("/reqtakbae/views/mypage/memModify.jsp");
		//request.getRequestDispatcher("/views/mypage/memModify.jsp").forward(request, response);
		if(result>0) {
			/*response.getWriter().print("YES");*/
			out.println("<script>");
			out.println("alert('회원정보 수정 성공');");
			
			request.getSession().setAttribute("loginUser", new Member(m.getU_no(), bankName, accnum, m.getUser_id(), m.getUser_pwd(), 
					phone, email, m.getBacklist(), m.getUser_div(), m.getC_money(), m.getC_point(), m.getLogin_div(), m.getUser_name(), m.getU_date(), m.getStatus(), m.getK_trans()));

		}else {
			out.println("<script>");
			out.println("alert('회원정보 수정 실패');");
		}
		
		out.println("location.href='/reqtakbae/views/mypage/memModify.jsp'");
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
