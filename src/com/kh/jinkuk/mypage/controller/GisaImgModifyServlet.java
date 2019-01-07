package com.kh.jinkuk.mypage.controller;

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
import com.kh.jinkuk.member.model.vo.Images;
import com.kh.jinkuk.mypage.model.service.MypageService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class GisaImgModifyServlet
 */
@WebServlet("/GisaModifyImg")
public class GisaImgModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GisaImgModifyServlet() {
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
			
			MultipartRequest multiRequest
			 = new MultipartRequest(request, root, maxSize,
					 "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration files = multiRequest.getFileNames();//input type=file
			
			while(files.hasMoreElements()) {
				String name = (String) files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
				
			}
			
			
			int uno = Integer.parseInt(multiRequest.getParameter("uno"));
			
			ArrayList<Images> fileList = new ArrayList<Images>();
			
			
			for(int i = originFiles.size()-1; i>=0; i--) {
				Images image = new Images();
				image.setI_o_name(originFiles.get(i));
				image.setI_c_name(saveFiles.get(i));
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
				System.out.println("getU_no() : " + image.getU_no());

				
				fileList.add(image);
			}	
			
				int result = new MypageService().updateImg(fileList);
				
				//수정전 사진 - 삭제용
				String preImg1 = multiRequest.getParameter("preImg1");
				String preImg2 = multiRequest.getParameter("preImg2");
				preImg1 = preImg1.replaceAll(System.getProperty("line.separator"), "");
				
				System.out.println();
				System.out.println("p1 : "+preImg1);
				System.out.println("p2 : "+preImg2);
				System.out.println();
				
				ArrayList<String> deleteArr = new ArrayList<String>();
				deleteArr.add(preImg1);
				deleteArr.add(preImg2);

				String page="";
				System.out.println("deleteArr길이 : " + deleteArr.size());
				
				//성공시 수정 전 사진 삭제
				if(result > 0) {
					for(int i = 0; i < deleteArr.size(); i++) {
						File failedFile = new File(root + deleteArr.get(i));
						
						failedFile.delete();
					}
					
					page="/reqtakbae/views/mypage/memModifyImg.jsp";
					response.sendRedirect(page);
					return;
				}else {
					//실패시 올리려 한 사진 삭제
					for(int i = 0; i < saveFiles.size(); i++) {
						//파일시스템에 저장된 이름으로 파일 객체 생성
						File failedFile = new File(root + saveFiles.get(i));
						
						failedFile.delete();
					}
					
					request.getRequestDispatcher(page).forward(request, response);
					
				}
			
				//
			
			
			
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
