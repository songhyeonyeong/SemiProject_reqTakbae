package com.kh.jinkuk.change.model.vo;

import java.sql.Date;

public class Change {
	private int ch_no;
	private Date ch_date;
	private String ch_div;
	private int ch_rmoney;
	private int ch_cmoney;
	private String status;
	private int ch_ok;
	private int u_no;
	private int ch_p_no;
	
	public Change() {}
	
	public Change(int ch_no, Date ch_date, String ch_div, int ch_rmoney, int ch_cmoney, String status, int ch_ok,
			int u_no, int ch_p_no) {
		super();
		this.ch_no = ch_no;
		this.ch_date = ch_date;
		this.ch_div = ch_div;
		this.ch_rmoney = ch_rmoney;
		this.ch_cmoney = ch_cmoney;
		this.status = status;
		this.ch_ok = ch_ok;
		this.u_no = u_no;
		this.ch_p_no = ch_p_no;
	}

	public int getCh_no() {
		return ch_no;
	}

	public void setCh_no(int ch_no) {
		this.ch_no = ch_no;
	}

	public Date getCh_date() {
		return ch_date;
	}

	public void setCh_date(Date ch_date) {
		this.ch_date = ch_date;
	}

	public String getCh_div() {
		return ch_div;
	}

	public void setCh_div(String ch_div) {
		this.ch_div = ch_div;
	}

	public int getCh_rmoney() {
		return ch_rmoney;
	}

	public void setCh_rmoney(int ch_rmoney) {
		this.ch_rmoney = ch_rmoney;
	}

	public int getCh_cmoney() {
		return ch_cmoney;
	}

	public void setCh_cmoney(int ch_cmoney) {
		this.ch_cmoney = ch_cmoney;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCh_ok() {
		return ch_ok;
	}

	public void setCh_ok(int ch_ok) {
		this.ch_ok = ch_ok;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getCh_p_no() {
		return ch_p_no;
	}

	public void setCh_p_no(int ch_p_no) {
		this.ch_p_no = ch_p_no;
	}

	@Override
	public String toString() {
		return "Change [ch_no=" + ch_no + ", ch_date=" + ch_date + ", ch_div=" + ch_div + ", ch_rmoney=" + ch_rmoney
				+ ", ch_cmoney=" + ch_cmoney + ", status=" + status + ", ch_ok=" + ch_ok + ", u_no=" + u_no
				+ ", ch_p_no=" + ch_p_no + "]";
	}
	
	
	
}
