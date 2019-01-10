package com.kh.jinkuk.admin.model.vo;

import java.sql.Date;

public class Change {
	private int ch_no;
	private int rnum;
	private Date ch_date;
	private String ch_div;
	private int ch_rmoney;
	private int ch_cmoney;
	private String status;
	private int ch_ok;
	private int u_no;
	private int ch_p_no;
	private String user_id;
	private String user_name;
	private String bank_num;
	private String bank_name;
	
	public Change() {}

	public Change(int ch_no, int rnum, Date ch_date, String ch_div, int ch_rmoney, int ch_cmoney, String status,
			int ch_ok, int u_no, int ch_p_no, String user_id, String user_name, String bank_num, String bank_name) {
		super();
		this.ch_no = ch_no;
		this.rnum = rnum;
		this.ch_date = ch_date;
		this.ch_div = ch_div;
		this.ch_rmoney = ch_rmoney;
		this.ch_cmoney = ch_cmoney;
		this.status = status;
		this.ch_ok = ch_ok;
		this.u_no = u_no;
		this.ch_p_no = ch_p_no;
		this.user_id = user_id;
		this.user_name = user_name;
		this.bank_num = bank_num;
		this.bank_name = bank_name;
	}

	public int getCh_no() {
		return ch_no;
	}

	public void setCh_no(int ch_no) {
		this.ch_no = ch_no;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBank_num() {
		return bank_num;
	}

	public void setBank_num(String bank_num) {
		this.bank_num = bank_num;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	@Override
	public String toString() {
		return "Change [ch_no=" + ch_no + ", rnum=" + rnum + ", ch_date=" + ch_date + ", ch_div=" + ch_div
				+ ", ch_rmoney=" + ch_rmoney + ", ch_cmoney=" + ch_cmoney + ", status=" + status + ", ch_ok=" + ch_ok
				+ ", u_no=" + u_no + ", ch_p_no=" + ch_p_no + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", bank_num=" + bank_num + ", bank_name=" + bank_name + "]";
	}

	
	
	
}


