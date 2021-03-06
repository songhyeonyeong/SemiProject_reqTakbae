package com.kh.jinkuk.border.inquire.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.inquire.model.service.InquireService;
import com.kh.jinkuk.border.inquire.model.vo.Inquire;
import com.kh.jinkuk.border.review.model.service.ReviewService;
import com.kh.jinkuk.border.review.model.vo.Review;

/**
 * Servlet implementation class SearchInquireOneServlet
 */
@WebServlet("/searchIn.in")
public class SearchInquireOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchInquireOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// title,writer,driname
		String select = request.getParameter("select");
		System.out.println("SearchInquire 조건: " + select);// option종류
	
		ArrayList<Inquire> list = null;
		
		if (select.equals("title")) {
			String titleS = request.getParameter("searchText");
			System.out.println("SearchReview 조건: " + titleS);// 입력한 값
			list=new InquireService().searchTitle(titleS);
			

		} else if (select.equals("text")) {
			String textS = request.getParameter("searchText");
			System.out.println("SearchReview 조건: " + textS);// 입력한 값
			list=new InquireService().searchText(textS);
		
		}
		
		
		
		ArrayList<Inquire> statusList = new InquireService().selectRefList();
		
		System.out.println("댓글 상태 확인"+statusList);
		
		for(int i=0;i<list.size();i++) {
			for(int  j =0; j<statusList.size();j++) {
				if(list.get(i).getM_no()==statusList.get(j).getRefstatus()) {
					list.get(i).setRefstatus(1);	
					System.out.println(list.get(i)	);
					}
			}
		}
		
	
		String page = "";
		if(list != null) {
			
			request.setAttribute("list", list);
			request.setAttribute("select", select);
			
			page = "/views/board/qnaSearchList.jsp";
			
		}else {
			request.setAttribute("msg", "검색 실패!");
			
			page = "/views/common/errorPage.jsp";
		}
		
		
		RequestDispatcher view  = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
