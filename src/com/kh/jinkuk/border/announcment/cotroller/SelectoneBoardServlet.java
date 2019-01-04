package com.kh.jinkuk.border.announcment.cotroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.announcment.model.service.AnnouncmentService;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;

/**
 * Servlet implementation class SelectoneBoardServlet
 */
@WebServlet("/selectOne.bo")
public class SelectoneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectoneBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		Announcment a = new AnnouncmentService().selectOne(num);
		
		System.out.println(a);
		String page = "";
		
		
		if(a != null) {
			page = "views/board/allNoticeView.jsp";
			request.setAttribute("a", a);
			request.setAttribute("num", num);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세조회 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);}catch(NumberFormatException e) {
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
