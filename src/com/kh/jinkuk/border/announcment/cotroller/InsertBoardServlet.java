package com.kh.jinkuk.border.announcment.cotroller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
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
import com.kh.jinkuk.member.model.vo.Images;
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
			String root = request.getSession().getServletContext().getRealPath("/upload/");
			/*String filePath = root + "GisaJoinImg/";*/
			System.out.println("root : "+root);
			
			MultipartRequest multiRequest
			 = new MultipartRequest(request, root, maxSize,
					 "UTF-8", new MyFileRenamePolicy());
			String gongdiv=multiRequest.getParameter("gongdiv");
			System.out.println(gongdiv);
			String saveFiles="";
			String originFiles="";
			String name="upload01";
			saveFiles=multiRequest.getFilesystemName(name);
			originFiles=multiRequest.getOriginalFileName(name);
//			System.out.println("fileSystem name : " +saveFiles);
//			System.out.println("originFile name : " +originFiles);
		
			
			Images image =new Images();
			image.setI_path(root);
			image.setI_o_name(originFiles);
			image.setI_c_name(saveFiles);
			image.setI_div("공고사진");
			
			String title = multiRequest.getParameter("title");
//			System.out.println("title:"+title);
			String product = multiRequest.getParameter("product");
//			System.out.println("product:"+product);
			String size=multiRequest.getParameter("size");
//			System.out.println("size:"+size);
			int value = Integer.parseInt(multiRequest.getParameter("value"));
//			System.out.println("value"+value);
			String start = multiRequest.getParameter("startAdrr");
			System.out.println("start"+start);
			String end = multiRequest.getParameter("endAdrr");
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
			int result = new AnnouncmentService().insertBoard(i,image,gongdiv);
			
			/*int areaCount = new AnnouncmentService().areaCount(start);*/
			
			if(result>0) {
			String encoded = URLEncoder.encode(gongdiv,"UTF-8");
			response.sendRedirect("/reqtakbae/selectList.bo?gongdiv="+encoded);
			
			}
			
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
