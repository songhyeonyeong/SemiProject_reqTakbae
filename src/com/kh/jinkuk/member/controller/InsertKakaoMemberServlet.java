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
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		String bankCode = request.getParameter("bankcode");
		String accnum = request.getParameter("accnum");
		String bankName="";
		
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
		
		System.out.println("email : "+email);
		System.out.println("userPwd : "+userPwd);
		System.out.println("userDiv : "+userDiv);
		System.out.println("userName : "+userName);
		System.out.println("phone : "+phone);
		System.out.println("bankCode : "+bankCode);
		System.out.println("bankName : "+bankName);
		System.out.println("accnum : "+accnum);
		
		Member mem = new Member();
		mem.setUser_div(userDiv);
		mem.setUser_pwd(userPwd);
		mem.setUser_name(userName);
		mem.setPhone(phone);
		mem.setBank_name(bankName);
		mem.setBank_num(accnum);
		
		//int result = new MemberService().insertKakaoMember(mem);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
