package com.kh.jinkuk.admin.model.vo;

import java.sql.Date;

public class Review implements java.io.Serializable{
	private int hno; 				//후기번호
	private String hTitle;			//글 제목
	private String hContext;	//글 내용
	private int hGrade;			// 평점
	private Date hDate;			//글 작성 날짜 
	private String status;		//상태
	private int uno;					//회원번호
	private String uname;			//회원이름
	private int gno;					//공고 번호
	private String driname;			//매칭된 기사 이름
	
	
	
	
	public Review() {}




	public Review(int hno, String hTitle, String hContext, int hGrade, Date hDate, String status, int uno, String uname,
			int gno, String driname) {
		super();
		this.hno = hno;
		this.hTitle = hTitle;
		this.hContext = hContext;
		this.hGrade = hGrade;
		this.hDate = hDate;
		this.status = status;
		this.uno = uno;
		this.uname = uname;
		this.gno = gno;
		this.driname = driname;
	}




	public int getHno() {
		return hno;
	}




	public void setHno(int hno) {
		this.hno = hno;
	}




	public String gethTitle() {
		return hTitle;
	}




	public void sethTitle(String hTitle) {
		this.hTitle = hTitle;
	}




	public String gethContext() {
		return hContext;
	}




	public void sethContext(String hContext) {
		this.hContext = hContext;
	}




	public int gethGrade() {
		return hGrade;
	}




	public void sethGrade(int hGrade) {
		this.hGrade = hGrade;
	}




	public Date gethDate() {
		return hDate;
	}




	public void sethDate(Date hDate) {
		this.hDate = hDate;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	public int getUno() {
		return uno;
	}




	public void setUno(int uno) {
		this.uno = uno;
	}




	public String getUname() {
		return uname;
	}




	public void setUname(String uname) {
		this.uname = uname;
	}




	public int getGno() {
		return gno;
	}




	public void setGno(int gno) {
		this.gno = gno;
	}




	public String getDriname() {
		return driname;
	}




	public void setDriname(String driname) {
		this.driname = driname;
	}




	@Override
	public String toString() {
		return "Review [hno=" + hno + ", hTitle=" + hTitle + ", hContext=" + hContext + ", hGrade=" + hGrade
				+ ", hDate=" + hDate + ", status=" + status + ", uno=" + uno + ", uname=" + uname + ", gno=" + gno
				+ ", driname=" + driname + "]";
	}



	


	


}