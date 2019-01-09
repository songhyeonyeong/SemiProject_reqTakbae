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
 * Servlet implementation class InsertKakaoMemberServlet
 */
@WebServlet("/insertKakoMember.me")
public class InsertKakaoMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertKakaoMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userDiv = request.getParameter("userDiv");
		String SNSId = request.getParameter("SNSId");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String bankCode = request.getParameter("bankcode");
		String accnum = request.getParameter("accnum");
		String mainWay = request.getParameter("mainWay");
		String bankName="";
		String loginDiv = request.getParameter("loginDiv");
		
		if(bankCode.equals("004")) {
			bankName="국민은행";
		}else if(bankCode.equals("003")) {
			bankName="기업은행";
		}else if(bankCode.equals("011")) {
			bankName="농협";
		}else if(bankCode.equals("088")) {
			bankName="신한은행";
		}else if(bankCode.equals("020")) {
			bankName="우리은행";
		}
		
		System.out.println();
		System.out.println("kakaoId : "+SNSId);
		System.out.println("userPwd : "+userPwd);
		System.out.println("userDiv : "+userDiv);
		System.out.println("userName : "+userName);
		System.out.println("phone : "+phone);
		System.out.println("bankCode : "+bankCode);
		System.out.println("bankName : "+bankName);
		System.out.println("accnum : "+accnum);
		System.out.println("mainWay : "+mainWay);
		System.out.println("loginDiv : "+loginDiv);
		System.out.println();
		
		Member mem = new Member();
		mem.setUser_div(userDiv);
		mem.setUser_id(userId);
		mem.setUser_pwd(userPwd);
		mem.setUser_name(userName);
		mem.setEmail(SNSId);//SNS아이디로 이메일
		mem.setPhone(phone);
		mem.setBank_name(bankName);
		mem.setBank_num(accnum);
		mem.setLogin_div(loginDiv);
		
		if(userDiv.equals("기사")) {
			mem.setK_trans(mainWay);
		}
		
		int result = new MemberService().insertKakaoMember(mem);
		
		if(result>0) {
			if(mem.getUser_div().equals("신청자")) {
				response.sendRedirect("/reqtakbae/views/member/joinComplete.jsp");				
			}else if(mem.getUser_div().equals("기사")) {
				response.getWriter().print("회원정보인서트성공");
			}
		}else {
			System.out.println("카카오 회원가입 실패");
			response.getWriter().print("회원정보인서트실패");
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
