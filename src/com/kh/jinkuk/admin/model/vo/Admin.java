package com.kh.jinkuk.admin.model.vo;

import java.sql.Date;

public class Admin {
	private int uno;
	private String b_name;
	private int b_num;
	private String userId;
	private String userPwd;
	private String phone;
	private String email;
	private String blackList;
	private String user_div;
	private int c_money;
	private int c_point;
	private String login_div;
	private String userName;
	private Date u_date;
	private String status;
	private String k_trans;
	
	
	public Admin() {}


	public Admin(int uno, String b_name, int b_num, String userId, String userPwd, String phone, String email,
			String blackList, String user_div, int c_money, int c_point, String login_div, String userName, Date u_date,
			String status, String k_trans) {
		super();
		this.uno = uno;
		this.b_name = b_name;
		this.b_num = b_num;
		this.userId = userId;
		this.userPwd = userPwd;
		this.phone = phone;
		this.email = email;
		this.blackList = blackList;
		this.user_div = user_div;
		this.c_money = c_money;
		this.c_point = c_point;
		this.login_div = login_div;
		this.userName = userName;
		this.u_date = u_date;
		this.status = status;
		this.k_trans = k_trans;
	}


	public int getUno() {
		return uno;
	}


	public void setUno(int uno) {
		this.uno = uno;
	}


	public String getB_name() {
		return b_name;
	}


	public void setB_name(String b_name) {
		this.b_name = b_name;
	}


	public int getB_num() {
		return b_num;
	}


	public void setB_num(int b_num) {
		this.b_num = b_num;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getBlackList() {
		return blackList;
	}


	public void setBlackList(String blackList) {
		this.blackList = blackList;
	}


	public String getUser_div() {
		return user_div;
	}


	public void setUser_div(String user_div) {
		this.user_div = user_div;
	}


	public int getC_money() {
		return c_money;
	}


	public void setC_money(int c_money) {
		this.c_money = c_money;
	}


	public int getC_point() {
		return c_point;
	}


	public void setC_point(int c_point) {
		this.c_point = c_point;
	}


	public String getLogin_div() {
		return login_div;
	}


	public void setLogin_div(String login_div) {
		this.login_div = login_div;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Date getU_date() {
		return u_date;
	}


	public void setU_date(Date u_date) {
		this.u_date = u_date;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getK_trans() {
		return k_trans;
	}


	public void setK_trans(String k_trans) {
		this.k_trans = k_trans;
	}


	@Override
	public String toString() {
		return "Admin [uno=" + uno + ", b_name=" + b_name + ", b_num=" + b_num + ", userId=" + userId + ", userPwd="
				+ userPwd + ", phone=" + phone + ", email=" + email + ", blackList=" + blackList + ", user_div="
				+ user_div + ", c_money=" + c_money + ", c_point=" + c_point + ", login_div=" + login_div
				+ ", userName=" + userName + ", u_date=" + u_date + ", status=" + status + ", k_trans=" + k_trans + "]";
	}
	
	

}
