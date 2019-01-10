package com.kh.jinkuk.admin.model.vo;

import java.sql.Date;

public class Exchange {
	private int c_no;
	private int rnum;
	private Date cDate;
	private int cMoney;
	private int rMoney;
	private String bankName;
	private String bankNum;
	private String user_id;
	private String user_name;
	private String eStatus;
	
	public Exchange() {}

	public Exchange(int c_no, int rnum, Date cDate, int cMoney, int rMoney, String bankName, String bankNum,
			String user_id, String user_name, String eStatus) {
		super();
		this.c_no = c_no;
		this.rnum = rnum;
		this.cDate = cDate;
		this.cMoney = cMoney;
		this.rMoney = rMoney;
		this.bankName = bankName;
		this.bankNum = bankNum;
		this.user_id = user_id;
		this.user_name = user_name;
		this.eStatus = eStatus;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public int getcMoney() {
		return cMoney;
	}

	public void setcMoney(int cMoney) {
		this.cMoney = cMoney;
	}

	public int getrMoney() {
		return rMoney;
	}

	public void setrMoney(int rMoney) {
		this.rMoney = rMoney;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankNum() {
		return bankNum;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
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

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	@Override
	public String toString() {
		return "Exchange [c_no=" + c_no + ", rnum=" + rnum + ", cDate=" + cDate + ", cMoney=" + cMoney + ", rMoney="
				+ rMoney + ", bankName=" + bankName + ", bankNum=" + bankNum + ", user_id=" + user_id + ", user_name="
				+ user_name + ", eStatus=" + eStatus + "]";
	}


	

	
	
	
	
}
