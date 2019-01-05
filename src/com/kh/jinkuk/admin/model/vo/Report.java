package com.kh.jinkuk.admin.model.vo;

import java.sql.Date;

public class Report {
	private int s_no;
	private String s_title;
	private String s_s_reason;
	private String s_reason;
	private Date s_date;
	private String u_no1;	//신고당한
	private String u_no2;	//신고한
	private int g_no;
	
	public Report() {}

	public Report(int s_no, String s_title, String s_s_reason, String s_reason, Date s_date, String u_no1, String u_no2,
			int g_no) {
		super();
		this.s_no = s_no;
		this.s_title = s_title;
		this.s_s_reason = s_s_reason;
		this.s_reason = s_reason;
		this.s_date = s_date;
		this.u_no1 = u_no1;
		this.u_no2 = u_no2;
		this.g_no = g_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public String getS_s_reason() {
		return s_s_reason;
	}

	public void setS_s_reason(String s_s_reason) {
		this.s_s_reason = s_s_reason;
	}

	public String getS_reason() {
		return s_reason;
	}

	public void setS_reason(String s_reason) {
		this.s_reason = s_reason;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public String getU_no1() {
		return u_no1;
	}

	public void setU_no1(String u_no1) {
		this.u_no1 = u_no1;
	}

	public String getU_no2() {
		return u_no2;
	}

	public void setU_no2(String u_no2) {
		this.u_no2 = u_no2;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	@Override
	public String toString() {
		return "Report [s_no=" + s_no + ", s_title=" + s_title + ", s_s_reason=" + s_s_reason + ", s_reason=" + s_reason
				+ ", s_date=" + s_date + ", u_no1=" + u_no1 + ", u_no2=" + u_no2 + ", g_no=" + g_no + "]";
	}
	
	

}
