package com.kh.jinkuk.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
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
		
		
		String kakaoId = request.getParameter("kakaoId");
		String userDiv = request.getParameter("userDiv");
		
		System.out.println("snsCheck 서블릿 kakaoId : " + kakaoId);
		System.out.println("snsCheck 서블릿 userDiv : " + userDiv);
		System.out.println();
		
		//kakaoId가 Member에 있는지 : 있으면 회원가입, 없으면 로그인
		Member member = new MemberService().snsJoinCheck(kakaoId,userDiv);
		
		
		//가입x && 신청자 => 신청자 가입폼
		String page="";
		if(member==null) {
			request.setAttribute("kakaoId", kakaoId);
			
			if(userDiv.equals("신청자")) {
				page="/views/member/joinKakao.jsp";
			}else {
				page="/views/member/joinKakaoGisa.jsp";
			}
		}else if(member!=null) {
			request.getSession().setAttribute("loginUser", member);
			page="index.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}
	
	

}
