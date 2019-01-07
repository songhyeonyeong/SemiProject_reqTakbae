package com.kh.jinkuk.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.member.model.service.MemberService;

/**
 * Servlet implementation class SNSCheck
 */
@WebServlet("/snsCheck")
public class SNSCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SNSCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kakaoId = request.getParameter("kakaoId");
		String userDiv = request.getParameter("userDiv");
		
		System.out.println("snsCheck 서블릿 kakaoId : " + kakaoId);
		System.out.println("snsCheck 서블릿 userDiv : " + userDiv);
		
		//kakaoId가 Member에 있는지 : 있으면 회원가입, 없으면 로그인
		int result = new MemberService().snsJoinCheck(kakaoId,userDiv);
		
		System.out.println("result : "+result);
		//String page="/reqtakbae/views/member/joinKakao.jsp";
		String page="/reqtakbae/views/member/joinKakao.jsp?kakaoId="+kakaoId;
		System.out.println("page : "+page);
		PrintWriter out = response.getWriter();
		if(result==0) {
//			page="<script>";
//			page+="opener.window.location.href='/reqtakbae/views/member/joinKakao.jsp?kakaoId='"+kakaoId;
//			/*page+="opener.window.location.href='/reqtakbae/views/member/joinKakao.jsp';";*/
//			page+="self.close();";
//			page+="</script>";
//			out.print(page);
			out.println("<script>");
			out.println("window.close();");
			//out.println(page);
			out.print("opener.window.location.href="+page);
			out.println("</script>");
			//response.sendRedirect("/reqtakbae/views/member/joinKakao.jsp?kakaoId="+kakaoId);
			//request.setAttribute("kakaoId", kakaoId);
			//request.getRequestDispatcher("/views/member/joinKakao.jsp").forward(request, response);
		}else {
			
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
