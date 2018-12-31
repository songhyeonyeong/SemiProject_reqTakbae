package com.kh.jinkuk.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jinkuk.admin.model.service.AdminService;
import com.kh.jinkuk.admin.model.vo.Inquiry;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insertReply.in")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String content = request.getParameter("content");
			int inquiryNo = Integer.parseInt(request.getParameter("inquiryNo"));
			content = content.replace("\r\n", "<br>");
			
			Inquiry b = new Inquiry();
			b.setM_context(content);
			b.setRef_mno(inquiryNo);
			System.out.println("보드객체 : "+b + " inquiryNo : " + inquiryNo);
			
			//댓글등록
			ArrayList<Inquiry> replyList = new AdminService().insertReply(b);
			System.out.println(replyList);
			
			//내가넘기는 데이터 json받식인거를 알려주는 방식임
			//보낼때 인코딩하고, 받을땐 디코딩해야됨
			//디코딩 - decodeURIComponent(data.userName)
			response.setContentType("application/json");
			
			
			/* lib폴더에 Gson추가 */
			new Gson().toJson(replyList, response.getWriter());


		}catch(NumberFormatException e) {
			e.printStackTrace();
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
