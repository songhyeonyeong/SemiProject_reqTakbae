package com.kh.jinkuk.border.announcment.cotroller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.announcment.model.service.AnnouncmentService;
import com.kh.jinkuk.border.announcment.model.vo.InsertAnnouncment;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.bo")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("연결");
		String title = request.getParameter("title");
		String product = request.getParameter("product");
		int price = Integer.parseInt(request.getParameter("size"));
		String size="";
		
		if(price==4500) {
			size="소";
		}else if(price==4800){
			size="중";
		}else {
			size="대";
		}
		
		int value = Integer.parseInt(request.getParameter("value"));
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		String d = request.getParameter("d");
		String h = request.getParameter("h");
		String m = request.getParameter("m");
		String day = d+h+m;
		String area = request.getParameter("area");
		int uno = (int)request.getSession().getAttribute("loginUser");
		
		InsertAnnouncment i = new InsertAnnouncment();
		i.setGcontext(area);
		i.setGday(Date.valueOf(day));
		i.setGearea(end);
		i.setGprice(value);
		i.setGsarea(start);
		i.setGsize(size);
		i.setGsum(price);
		i.setGtitle(title);
		i.setGtype(product);
		i.setUno(uno);
		
		int result = new AnnouncmentService().insertBoard(i);
		
		
		/*HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String writer = String.valueOf(loginUser.getUno());*/
		
		/*String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getU_no());*/
		
		/*Announcment a = new Announcment();
		a.setG_TITLE(title);
		a.setG_CONTEXT(context);
		
		int result = new AnnouncmentService().insertBoard(a);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectList.bo");
		}else {
			request.setAttribute("msg", "게시판 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
