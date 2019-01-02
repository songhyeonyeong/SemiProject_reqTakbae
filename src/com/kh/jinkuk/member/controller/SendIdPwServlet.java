package com.kh.jinkuk.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendIdServlet
 */
@WebServlet("/sendId")
public class SendIdPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendIdPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String email = request.getParameter("email");
		String id = (String) request.getAttribute("id");
		String findDiv = (String) request.getAttribute("findDiv");
		String randomCode = (String) request.getAttribute("randomCode");
		
		Properties p = new Properties();// 정보를 담을 객체
		p.put("mail.smtp.user", "takbububu@gmail.com");
		p.put("mail.smtp.host", "smtp.gmail.com"); 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable","true"); 
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
		    Authenticator auth = new SMTPAuthenticator();
		    Session ses = Session.getDefaultInstance(p, auth);
		    
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    
		    InternetAddress from = new InternetAddress("takbububu@gmail.com");
             
            // 이메일 발신자
            msg.setFrom(from);
            
            // 이메일 수신자
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            if(findDiv.equals("id")) {
            	msg.setSubject("[택배를 부탁해] 아이디 찾기", "UTF-8");
            }else if(findDiv.equals("pw")) {
            	msg.setSubject("[택배를 부탁해] 비밀번호 찾기", "UTF-8");
            }
            
            // 이메일 내용
            if(findDiv.equals("id")) {
            	 request.setAttribute("id", id);
                 msg.setText("아이디 : "+ id, "UTF-8");
            }else if(findDiv.equals("pw")) {
            	request.setAttribute("randomCode", randomCode);
                msg.setText("임시 비밀번호 : "+ randomCode, "UTF-8");
            }
           
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기   
            Transport.send(msg);
            
            response.getWriter().print("YES");
            
		} catch(Exception e){
		response.getWriter().print("NO");
		  e.printStackTrace();
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
