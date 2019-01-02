package com.kh.jinkuk.admin.model.vo;

import java.sql.Date;

public class Point {
	private int p_no;
	private String p_div;
	private Date p_date;
	private int p_usePoint;
	private String p_note;
	private String status;
	private String userId;
	private int user_point;
	
	public Point() {}

	public Point(int p_no, String p_div, Date p_date, int p_usePoint, String p_note, String status, String userId,
			int user_point) {
		super();
		this.p_no = p_no;
		this.p_div = p_div;
		this.p_date = p_date;
		this.p_usePoint = p_usePoint;
		this.p_note = p_note;
		this.status = status;
		this.userId = userId;
		this.user_point = user_point;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_div() {
		return p_div;
	}

	public void setP_div(String p_div) {
		this.p_div = p_div;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public int getP_usePoint() {
		return p_usePoint;
	}

	public void setP_usePoint(int p_usePoint) {
		this.p_usePoint = p_usePoint;
	}

	public String getP_note() {
		return p_note;
	}

	public void setP_note(String p_note) {
		this.p_note = p_note;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	@Override
	public String toString() {
		return "Point [p_no=" + p_no + ", p_div=" + p_div + ", p_date=" + p_date + ", p_usePoint=" + p_usePoint
				+ ", p_note=" + p_note + ", status=" + status + ", userId=" + userId + ", user_point=" + user_point
				+ "]";
	}
	
	

	
}
