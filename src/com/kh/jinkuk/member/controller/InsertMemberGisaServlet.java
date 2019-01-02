package com.kh.jinkuk.member.controller;

import java.io.File;
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
import com.kh.jinkuk.member.model.dao.MemberDao;
import com.kh.jinkuk.member.model.service.MemberService;
import com.kh.jinkuk.member.model.vo.Images;
import com.kh.jinkuk.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertMemberGisaServlet
 */
@WebServlet("/GisaJoinImg")
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
			int maxSize = 1024*1024*100;
			
			String root = request.getSession().getServletContext().getRealPath("/upload/");
			/*String filePath = root + "GisaJoinImg/";*/
			System.out.println("root : "+root);
			
			MultipartRequest multiRequest
			 = new MultipartRequest(request, root, maxSize,
					 "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration files = multiRequest.getFileNames();//input type=file
			
			while(files.hasMoreElements()) {
				String name = (String) files.nextElement();
				
				System.out.println();
				System.out.println("name  : " + name);
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
				
			}
			
			String userId = multiRequest.getParameter("id");
			System.out.println("userId : " + userId);
			

			ArrayList<Images> fileList = new ArrayList<Images>();
			
			
			for(int i = originFiles.size()-1; i>=0; i--) {
				Images image = new Images();
				image.setI_path(root);
				image.setI_o_name(originFiles.get(i));
				image.setI_c_name(saveFiles.get(i));
				
				int uno = new MemberService().findUno(userId);
				image.setU_no(uno);
				
				if(i==1) {
					image.setI_div("기사얼굴");
				}else {
					image.setI_div("신분증");
				}
				
				
				System.out.println();
				System.out.println("getI_div() : " + image.getI_div());
				System.out.println("getI_o_name() : " + image.getI_o_name());
				System.out.println("getI_c_name() : " + image.getI_c_name());
				System.out.println("getI_path() : " + image.getI_path());
				System.out.println("getU_no() : " + image.getU_no());

				
				fileList.add(image);
			}	
				int result = new MemberService().insertImg(fileList);
				String page="";
				if(result > 0) {
					page="/reqtakbae/index.jsp";
					response.sendRedirect(page);
					return;
				}else {
					//실패시 저장된 사진 삭제
					page="views/common/errorPage.jsp";
					for(int j = 0; j < saveFiles.size(); j++) {
						//파일시스템에 저장된 이름으로 파일 객체 생성
						File failedFile = new File(root + saveFiles.get(j));
						
						//true false를 리턴함
						failedFile.delete();
					}
					request.setAttribute("msg", "사진게시판 등록 실패!");
					request.getRequestDispatcher(page).forward(request, response);
					
				}
			
				//
			
			
			
			}}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
