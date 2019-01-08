package com.kh.jinkuk.border.announcment.cotroller;

import java.io.IOException;
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
		int point=Integer.parseInt(request.getParameter("point"));
		int gsum=Integer.parseInt(request.getParameter("gsum"));
		System.out.println(point);
		System.out.println(gsum);
		Announcment a = new Announcment();
		a.setU_NO(gno);
		InsertAnnouncment i = new InsertAnnouncment();
		i.setUno(uno);
		i.setPoint(point);
		i.setGsum(gsum);
		int result = new AnnouncmentService().deleteBoard(i, a);
		
		if(result > 0) {
			response.sendRedirect("/reqtakbae/selectList.bo?gongdiv=일반");
		}else {
			request.setAttribute("msg", "게시글 삭제 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
			
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
