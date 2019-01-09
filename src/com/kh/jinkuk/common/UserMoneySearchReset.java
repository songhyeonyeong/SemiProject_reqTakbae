package com.kh.jinkuk.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserMoneySearchReset
 */
@WebServlet("/reset")
public class UserMoneySearchReset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMoneySearchReset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p = request.getParameter("p");
		String page="";
		if(p.equals("charge")) {
			page = "views/mypage/chargeMoney.jsp";
		}else if (p.equals("info")) {
			page = "views/info/info.jsp";
		}else if (p.equals("fare")) {
			page = "views/info/fare_inquiry.jsp";
		}else if(p.equals("comInfo")) {
			page = "views/company/comInfo.jsp";
		}else if(p.equals("writer")) {
			page = "views/board/allNoticeWrite.jsp";
		}else if(p.equals("modify")) {
			page = "views/mypage/memModify.jsp";
		}else if(p.equals("ImgModify")) {
			page = "views/mypage/memModifyImg.jsp";
		}else if(p.equals("leave")) {
			page = "views/mypage/memLeave.jsp";
		}
		
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
