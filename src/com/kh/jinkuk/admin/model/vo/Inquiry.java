package com.kh.jinkuk.admin.model.vo;

import java.sql.Date;

public class Inquiry {
	private int m_no;
	private int rnum;
	private String m_title;
	private String m_context;
	private int ref_mno;
	private int reply_level;
	private String status;
	private Date m_date;
	private String u_no; 
	
	public Inquiry() {}

	public Inquiry(int m_no, int rnum, String m_title, String m_context, int ref_mno, int reply_level, String status,
			Date m_date, String u_no) {
		super();
		this.m_no = m_no;
		this.rnum = rnum;
		this.m_title = m_title;
		this.m_context = m_context;
		this.ref_mno = ref_mno;
		this.reply_level = reply_level;
		this.status = status;
		this.m_date = m_date;
		this.u_no = u_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_context() {
		return m_context;
	}

	public void setM_context(String m_context) {
		this.m_context = m_context;
	}

	public int getRef_mno() {
		return ref_mno;
	}

	public void setRef_mno(int ref_mno) {
		this.ref_mno = ref_mno;
	}

	public int getReply_level() {
		return reply_level;
	}

	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	@Override
	public String toString() {
		return "Inquiry [m_no=" + m_no + ", rnum=" + rnum + ", m_title=" + m_title + ", m_context=" + m_context
				+ ", ref_mno=" + ref_mno + ", reply_level=" + reply_level + ", status=" + status + ", m_date=" + m_date
				+ ", u_no=" + u_no + "]";
	}

	
	
}
