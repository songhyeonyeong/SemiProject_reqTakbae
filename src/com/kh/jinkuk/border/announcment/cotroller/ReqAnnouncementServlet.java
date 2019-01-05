package com.kh.jinkuk.border.announcment.cotroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.border.announcment.model.service.AnnouncmentService;
import com.kh.jinkuk.member.model.vo.Member;

/**
 * Servlet implementation class ReqAnnouncementServlet
 */
@WebServlet("/ReqAnnouncement.bo")
public class ReqAnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqAnnouncementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =response.getWriter();
		Member loginUser=(Member)request.getSession().getAttribute("loginUser");
		int uno=loginUser.getU_no();
		int gno=Integer.parseInt(request.getParameter("gno"));
		String gongdiv =request.getParameter("gongdiv");
		//
		int result =new AnnouncmentService().insertReqATC(uno,gno);
		if(result>0) {
			String encoded = URLEncoder.encode(gongdiv,"UTF-8");
			response.sendRedirect("/reqtakbae/selectList.bo?gongdiv="+encoded);
		}else {
			out.print("<script>");
			out.print("alert('이미 등록한 공고입니다!');");
			out.print("history.go(-1);");
			out.print("</script>");
			out.flush();
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
