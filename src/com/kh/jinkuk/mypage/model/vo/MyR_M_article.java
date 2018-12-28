package com.kh.jinkuk.mypage.model.vo;

import java.sql.Date;

public class MyR_M_article {
	private String g_div;
	private int g_no;
	private String g_context;
	private Date g_day;
	private String user_id;
	private String g_p_div;
	private String b_status;
	public MyR_M_article() {
		super();
	}
	public MyR_M_article(String g_div, int g_no, String g_context, Date g_day, String user_id, String g_p_div,
			String b_status) {
		super();
		this.g_div = g_div;
		this.g_no = g_no;
		this.g_context = g_context;
		this.g_day = g_day;
		this.user_id = user_id;
		this.g_p_div = g_p_div;
		this.b_status = b_status;
	}
	public String getG_div() {
		return g_div;
	}
	public void setG_div(String g_div) {
		this.g_div = g_div;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getG_context() {
		return g_context;
	}
	public void setG_context(String g_context) {
		this.g_context = g_context;
	}
	public Date getG_day() {
		return g_day;
	}
	public void setG_day(Date g_day) {
		this.g_day = g_day;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getG_p_div() {
		return g_p_div;
	}
	public void setG_p_div(String g_p_div) {
		this.g_p_div = g_p_div;
	}
	public String getB_status() {
		return b_status;
	}
	public void setB_status(String b_status) {
		this.b_status = b_status;
	}
	@Override
	public String toString() {
		return "MyR_M_article [g_div=" + g_div + ", g_no=" + g_no + ", g_context=" + g_context + ", g_day=" + g_day
				+ ", user_id=" + user_id + ", g_p_div=" + g_p_div + ", b_status=" + b_status + "]";
	}
	
	
	
	
}
