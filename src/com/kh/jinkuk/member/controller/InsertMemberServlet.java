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
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String userDiv = request.getParameter("userDiv");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + "@" + email2;
		
		String bankCode = request.getParameter("bankcode");
		String bankName = "";
		
		String mainWay = request.getParameter("mainWay");
		String accnum = request.getParameter("accnum");
		
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
		
		System.out.println("bankCode : "+bankCode);
		
		System.out.println("userDiv : "+userDiv);
		System.out.println("userId : "+userId);
		System.out.println("userPwd : "+userPwd);
		System.out.println("userName : "+userName);
		System.out.println("phone : "+phone);
		System.out.println("email : "+email);
		System.out.println("bankName : "+bankName);
		System.out.println("mainWay : "+mainWay);
		System.out.println("accnum : "+accnum);
		
		
		Member reqMember = new Member();
		reqMember.setUser_id(userId);
		reqMember.setUser_pwd(userPwd);
		reqMember.setUser_name(userName);
		reqMember.setPhone(phone);
		reqMember.setEmail(email);
		reqMember.setBank_name(bankName);
		reqMember.setBank_num(accnum);
		reqMember.setUser_div(userDiv);
		reqMember.setLogin_div("자회원");
		
		if(userDiv.equals("기사")) {
			reqMember.setK_trans(mainWay);
		}
		int result = new MemberService().insertMember(reqMember);
		
		if(result>0) {
			if(userDiv.equals("신청자")) {
				response.sendRedirect("index.jsp");//회원가입 환영페이지 만들긴
				return;
			}else {
				request.setAttribute("userId", userId);
				request.getRequestDispatcher("/views/member/join4.jsp").forward(request, response);
			}
		}else {
			//request.setAttribute("msg", "회원가입에 실패했습니다");
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
