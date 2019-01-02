package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.mypage.model.service.MypageService;

/**
 * Servlet implementation class UpdateREQAandInsertMATA
 */
@WebServlet("/updateinsertGisa.mp")
public class UpdateREQAandInsertMATA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateREQAandInsertMATA() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uno =Integer.parseInt(request.getParameter("uno"));
		int gno =Integer.parseInt(request.getParameter("gno"));
		
		int result = new MypageService().upReqInserMAT(uno,gno);
		
		if(result >0) {
			response.sendRedirect("/reqtakbae/selectMyNoticeList.mp");
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
