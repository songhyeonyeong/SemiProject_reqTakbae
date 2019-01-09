package com.kh.jinkuk.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.member.model.service.MemberService;
import com.kh.jinkuk.member.model.vo.Member;

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
		
		
		String SNSId = request.getParameter("SNSId");
		String userDiv = request.getParameter("userDiv");
		String loginDiv = request.getParameter("loginDiv");
		
		//네이버 클릭시 값이 안넘어옴 => 기사만 가능하게 함
		if(userDiv==null) {
			userDiv="기사";
		}
		if(loginDiv==null) {
			loginDiv="네이버";
		}
		
		System.out.println("snsCheck 서블릿 Id : " + SNSId);
		System.out.println("snsCheck 서블릿 userDiv : " + userDiv);
		System.out.println("snsCheck 서블릿 loginDiv : " + loginDiv);
		System.out.println();
		
		//kakaoId가 Member에 있는지 : 있으면 회원가입, 없으면 로그인
		Member member = new MemberService().snsJoinCheck(SNSId,userDiv);
		
		
		//가입x && 신청자 => 신청자 가입폼
		String page="";
		if(member==null) {
			request.setAttribute("SNSId", SNSId);
			request.setAttribute("loginDiv", loginDiv);
			
			if(userDiv.equals("신청자")) {
				page="/views/member/joinSNS.jsp";
			}else if(userDiv.equals("기사")) {
				page="/views/member/joinSNSGisa.jsp";
			}
			
			request.getRequestDispatcher(page).forward(request, response);
		
		}else if(member!=null) {
			if(member.getStatus().equals("Y")) {
				request.getSession().setAttribute("loginUser", member);
				page="index.jsp";
				
				request.getRequestDispatcher(page).forward(request, response);
		
			}else if(member.getStatus().equals("W")) {
				//page="index.jsp";
				response.getWriter().println("<script>alert('관리자 승인중');");
				//response.sendRedirect(page);
				response.getWriter().println("window.location='index.jsp'</script>");
				
			}
		}
		//request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/*@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}
	*/
	

}
