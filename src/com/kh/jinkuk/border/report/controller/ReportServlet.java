package com.kh.jinkuk.border.report.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import com.kh.jinkuk.border.report.model.service.ReportService;
import com.kh.jinkuk.border.report.model.vo.Report;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gno = Integer.parseInt(request.getParameter("gno"));
		int uno = Integer.parseInt(request.getParameter("uno"));
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String report = request.getParameter("report");
		String area = request.getParameter("area");
		
		Report r = new Report();
		r.setGno(gno);
		r.setUno(uno);
		r.setTitle(title);
		r.setName(name);
		r.setReport(report);
		r.setArea(area);
		int result = new ReportService().insertReport(r);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script> alert('신고 작성 완료')</script>");
			out.println("<script> window.close();</script>");
		/*	out.close();*/
		}else {
			out.println("<script> alert('신고 작성 실패');</script>");
			
		}
		
		/* location.href='"+request.getContextPath()+"/selectList.bo';*/
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
