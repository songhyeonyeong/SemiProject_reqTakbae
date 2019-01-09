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
		System.out.println(gno);
		System.out.println(uno);
		System.out.println(gongdiv+"1");
		
	
		InsertAnnouncment i = new InsertAnnouncment();
		i.setUno(uno);
		
		int result = new AnnouncmentService().deleteBoard(uno, gno);
		
		
		String page = "";
		/*if(result > 0 && gongdiv.equals("일반")) {
			page = "/reqtakbae/selectList.bo?gongdiv=일반";
			response.sendRedirect(page);
		}else if(result > 0 && gongdiv.equals("당일")) {
			page = "/reqtakbae/selectList.bo?gongdiv=당일";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 삭제 실패!");
		}*/
		if(result>0) {
		response.sendRedirect(request.getContextPath() + "/selectList.bo?gongdiv="+gongdiv);
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
