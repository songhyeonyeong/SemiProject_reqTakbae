package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.member.model.vo.Member;
import com.kh.jinkuk.mypage.model.service.MypageService;

@WebServlet("/getUser_selocation.mp")
public class getUser_selocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public getUser_selocation() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gno =Integer.parseInt(request.getParameter("gno"));
		String id =request.getParameter("id");
		System.out.println(id);
		String []stEd =new String[2];
		stEd  =new MypageService().selectSE(gno);
		Member m =new MypageService().selectMemberById(id);
		String page="";
		if(stEd!=null) {
			page="views/mypage/basongloactionUser.jsp";
			request.setAttribute("start", stEd[0]);
			request.setAttribute("end", stEd[1]);
			request.setAttribute("gno", gno);
			request.setAttribute("user",m);
			request.getRequestDispatcher(page).forward(request, response);
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
