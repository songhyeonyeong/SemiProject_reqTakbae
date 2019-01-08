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
 * Servlet implementation class UpdateBoardLServlet
 */
@WebServlet("/updateBO")
public class UpdateBoardLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardLServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("gno"));//수정 하기 게시글 번호
		String gongdiv=request.getParameter("gongdiv");
		
		System.out.println("UpdateBoardS  확인 :" +num );
		System.out.println("UpdateBoardS  확인 :" +gongdiv );
		
		Announcment a = new AnnouncmentService().selectOne(num);
		a.setG_DIV(gongdiv);
		System.out.println(a);
		
		String page ="";
		
		if(a!=null) {
			page="views/board/allNoticeModify.jsp";
			request.setAttribute("a", a);
		}else {
			page="views/common/errorPage.jsp";
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
