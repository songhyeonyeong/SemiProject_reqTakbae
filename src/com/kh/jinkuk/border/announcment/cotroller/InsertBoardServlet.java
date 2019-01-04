package com.kh.jinkuk.border.announcment.cotroller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jinkuk.border.announcment.model.service.AnnouncmentService;
import com.kh.jinkuk.border.announcment.model.vo.InsertAnnouncment;
import com.kh.jinkuk.common.MyFileRenamePolicy;
import com.kh.jinkuk.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

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
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//전송 파일 용량 제한 :  10MB로 제한
			int maxSize =  1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			
			String filePath = root + "thumbnail_uploadFiles/";
			
			//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
			//1.같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
			//2.한글로된 파일명, 특수기호, 띄어쓰기는 서버에 따라 문제가 생길 수 도 있다.
			
			//DefaultFileRenamePolicy는 cos.jar 제공하는 클래스
			//같은 파일명이 존재하는지를 검사하고 있을 경우에는 뒤에 숫자를 붙여준다.
			//ex : aaa.zip, aaa1.zip, aaa2.zip
			
			/*MultipartRequest multiRequest
			 = new MultipartRequest(request, filePath, maxSize, 
					 "UTF-8", new DefaultFileRenamePolicy());*/
			MultipartRequest multiRequest
			 = new MultipartRequest(request, filePath, maxSize,
					 "UTF-8", new MyFileRenamePolicy());
			String title = multiRequest.getParameter("title");
			System.out.println("title:"+title);
			String product = multiRequest.getParameter("product");
			System.out.println("product:"+product);
			String size=multiRequest.getParameter("size");
			System.out.println("size:"+size);
			int value = Integer.parseInt(multiRequest.getParameter("value"));
			System.out.println("value"+value);
			String start = multiRequest.getParameter("start");
			System.out.println("start"+value);
			String end = multiRequest.getParameter("end");
			System.out.println("end"+end);
			String yearmd = multiRequest.getParameter("d");
			int year =Integer.parseInt(yearmd.split("-")[0]);
			int month=Integer.parseInt(yearmd.split("-")[1]);
			int day=Integer.parseInt(yearmd.split("-")[2]); 
			int h = Integer.parseInt(multiRequest.getParameter("h"));
			int m = Integer.parseInt(multiRequest.getParameter("m"));
			GregorianCalendar g =new GregorianCalendar(year, month-1, day, h, m);
			long date =g.getTimeInMillis();
			String area = multiRequest.getParameter("area");
			System.out.println("area"+area);
			int total=Integer.parseInt(multiRequest.getParameter("total"));
			int point=Integer.parseInt(multiRequest.getParameter("point")); 
			Member loginUser =(Member)request.getSession().getAttribute("loginUser");
			int uno=loginUser.getU_no();
			
			InsertAnnouncment i = new InsertAnnouncment();
			i.setGcontext(area);
			i.setGday(new Date(date));
			i.setGearea(end);
			i.setGprice(value);
			i.setGsarea(start);
			i.setGsize(size);
			i.setGsum(total);
			i.setGtitle(title);
			i.setGtype(product);
			i.setUno(uno);
			i.setPoint(point);
			System.out.println(i);
//			int result = new AnnouncmentService().insertBoard(i);
			/*if(result>0) {
			response.sendRedirect("/reqtakbae/selectList.bo");
			
			}*/
			
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
