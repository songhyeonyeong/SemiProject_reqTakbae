package com.kh.jinkuk.border.announcment.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.announcment.model.service.AnnouncmentService;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.border.announcment.model.vo.InsertAnnouncment;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class DeleteBoardServlet
 */
@WebServlet("/deleteBoard.bo")
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser =(Member)request.getSession().getAttribute("loginUser");
		int uno=loginUser.getU_no();
		int gno=Integer.parseInt(request.getParameter("gno"));
		String gongdiv =request.getParameter("gongdiv");
		InsertAnnouncment i = new InsertAnnouncment();
		i.setUno(uno);

		ArrayList<Announcment> list = new AnnouncmentService().deleteBoard(uno, gno, gongdiv);
		
		
		String page = "";
		if(list != null && gongdiv.equals("일반")) {
			page = "views/board/allNoticeList.jsp";
			request.setAttribute("list", list);
		}else if(list != null && gongdiv.equals("당일")) {
			page = "views/board/todayNoticeList.jsp";
			request.setAttribute("list", list);

		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 삭제 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
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
