package com.kh.jinkuk.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jinkuk.common.MyFileRenamePolicy;
import com.kh.jinkuk.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertMemberGisaServlet
 */
@WebServlet("/insertGisa.me")
public class InsertMemberGisaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberGisaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("isMultipartContent 수행");
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);
			
			String filePath = root + "GisaImg/";
			
			MultipartRequest multiRequest
			 = new MultipartRequest(request, filePath, maxSize,
					 "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				System.out.println("name  : " + name);
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
				
			}
			
			String userDiv = multiRequest.getParameter("userDiv");
			String userId = multiRequest.getParameter("userId");
		 	String userPwd = multiRequest.getParameter("userPwd");
			String userName = multiRequest.getParameter("userName");
			String phone = multiRequest.getParameter("phone");
			
			String email1 = multiRequest.getParameter("email1");
			String email2 = multiRequest.getParameter("email2");
			String email = email1 + "@" + email2;
			String mainWay = multiRequest.getParameter("mainWay");
			String bankCode = multiRequest.getParameter("bankCode");
			String accountNum = multiRequest.getParameter("accountNum");
			
			System.out.println(userPwd);

			
			Member member = new Member();
			member.setUser_div(userDiv);
			
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
