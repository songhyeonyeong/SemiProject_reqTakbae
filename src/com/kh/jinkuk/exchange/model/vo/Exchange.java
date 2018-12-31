package com.kh.jinkuk.exchange.model.vo;

import java.sql.Date;

public class Exchange {
	private int rNum;
	private Date cDate;
	private int cMoney;
	private int rMoney;
	private String bankName;
	private String bankNum;
	private String eStatus;
	
	public Exchange() {}

	public Exchange(int rNum, Date cDate, int cMoney, int rMoney, String bankName, String bankNum, String eStatus) {
		super();
		this.rNum = rNum;
		this.cDate = cDate;
		this.cMoney = cMoney;
		this.rMoney = rMoney;
		this.bankName = bankName;
		this.bankNum = bankNum;
		this.eStatus = eStatus;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
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

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	@Override
	public String toString() {
		return "Exchange [rNum=" + rNum + ", cDate=" + cDate + ", cMoney=" + cMoney + ", rMoney=" + rMoney
				+ ", bankName=" + bankName + ", bankNum=" + bankNum + ", eStatus=" + eStatus + "]";
	}
	
	
	
	
	
	
}
