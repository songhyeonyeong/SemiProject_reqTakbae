package com.kh.jinkuk.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jinkuk.member.model.vo.Member;
import com.kh.jinkuk.mypage.model.dao.MypageDao;
import com.kh.jinkuk.mypage.model.service.MypageService;

/**
 * Servlet implementation class selectmemberByIdServelt
 */
@WebServlet("/selectmemberbyid.mp")
public class selectmemberByIdServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectmemberByIdServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Member m =new MypageService().selectMemberById(id);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(m, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
