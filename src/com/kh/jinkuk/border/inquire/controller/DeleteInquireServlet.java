package com.kh.jinkuk.border.inquire.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.inquire.model.service.InquireService;
import com.kh.jinkuk.border.inquire.model.vo.Inquire;

/**
 * Servlet implementation class DeleteInquireServlet
 */
@WebServlet("/deleteInquire")
public class DeleteInquireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInquireServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int result = 0;
		int mno=Integer.parseInt(request.getParameter("mno"));
		System.out.println("삭제할 글번호 : "+mno);
		
		//문의 글 삭제
		Inquire i = new Inquire();
		i.setM_no(mno);
		
		int iresult = new InquireService().deleteInquire(i);
		int aresult = new InquireService().deleteAdminInquire(i);
		
		if(aresult!=0) {
			result = iresult+aresult;
		}else {
			result = iresult;
		}
		
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectInquireList");
		}else {
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
