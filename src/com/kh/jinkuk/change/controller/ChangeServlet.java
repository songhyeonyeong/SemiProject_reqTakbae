package com.kh.jinkuk.change.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jinkuk.change.model.service.ChangeService;
import com.kh.jinkuk.change.model.vo.Change;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class ChangeServlet
 */
@WebServlet("/ChangeServlet")
public class ChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 연결");
		int chOk = Integer.parseInt(request.getParameter("apply"));
		String msg = request.getParameter("msg");
		String chDiv = request.getParameter("chDiv");
		int rMoney = Integer.parseInt(request.getParameter("amount"));
		int cMoney = 0;
		if(rMoney >= 10000) {
			cMoney = rMoney - (rMoney % 10000);
		}else {
			cMoney = rMoney - (rMoney % 1000);
		}
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getU_no();
		
		Change c = new Change();
		c.setCh_cmoney(cMoney);
		c.setCh_rmoney(rMoney);
		c.setCh_div(chDiv);
		c.setCh_ok(chOk);
		c.setU_no(userNo);
		
		int result = new ChangeService().InsertChange(c);
		
		if(result >0) {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>"
	        		+ "alert('결제에 이상이 있을시 관리자에게 문의해주세요.');"
	        		+ "location.href='"+request.getContextPath()+"/Cybermoney_breakdownServlet';</script>");
	        out.close();
	        
			/*response.sendRedirect(request.getContextPath()+"/Cybermoney_breakdownServlet")*/;
		}else {
			request.setAttribute("msg", "결제정보 저장 실패");
			System.out.println("결제정보 저장 실패");
			/*request.getRequestDispatcher(arg0)*/
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
