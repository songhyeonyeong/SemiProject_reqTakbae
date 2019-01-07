package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jinkuk.mypage.model.service.MypageService;

/**
 * Servlet implementation class GisaImgServlet
 */
@WebServlet("/GisaImg")
public class GisaImgShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GisaImgShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uno = request.getParameter("uno");
		System.out.println("uno : " + uno);
		
		ArrayList<String> imgList = new MypageService().findGisaImgAddr(uno);
		
		if(imgList != null) {
			//request.setAttribute("imgList", imgList);
			String fir=imgList.get(0);
			String sec=imgList.get(1);
			
			System.out.println("fir : "+fir);
			System.out.println("sec : "+sec);
			
			response.getWriter().println(fir+"&"+sec);
			
			
		}
		//RequestDispatcher view = request.getRequestDispatcher("views/mypage/memModifyImg.jsp");
		//view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
