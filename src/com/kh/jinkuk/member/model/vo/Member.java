package com.kh.jinkuk.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
//	회원번호
//	은행
//	계좌번호
//	회원ID
//	비밀번호
//	phone
//	email
//	블랙리스트
//	구분
//	사이버머니
//	포인트
//	계정 구분
//	이름
//	가입일
//  상태
//	주 배송수단
	private int u_no;
	private String bank_name;
	private String bank_num;
	private String user_id;
	private String user_pwd;
	private String phone;
	private String email;
	private String backlist;
	private String user_div;
	private int c_money;
	private int c_point;
	private String login_div;
	private String user_name;
	private Date u_date;
	private String status;
	private String k_trans;
	
	public Member() {
	}

	public Member(int u_no, String bank_name, String bank_num, String user_id, String user_pwd, String phone,
			String email, String backlist, String user_div, int c_money, int c_point, String login_div,
			String user_name, Date u_date, String status, String k_trans) {
		super();
		this.u_no = u_no;
		this.bank_name = bank_name;
		this.bank_num = bank_num;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.phone = phone;
		this.email = email;
		this.backlist = backlist;
		this.user_div = user_div;
		this.c_money = c_money;
		this.c_point = c_point;
		this.login_div = login_div;
		this.user_name = user_name;
		this.u_date = u_date;
		this.status = status;
		this.k_trans = k_trans;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getBank_num() {
		return bank_num;
	}

	public void setBank_num(String bank_num) {
		this.bank_num = bank_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
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

	public String getBacklist() {
		return backlist;
	}

	public void setBacklist(String backlist) {
		this.backlist = backlist;
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

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
		return "Member [u_no=" + u_no + ", bank_name=" + bank_name + ", bank_num=" + bank_num + ", user_id=" + user_id
				+ ", user_pwd=" + user_pwd + ", phone=" + phone + ", email=" + email + ", backlist=" + backlist
				+ ", user_div=" + user_div + ", c_money=" + c_money + ", c_point=" + c_point + ", login_div="
				+ login_div + ", user_name=" + user_name + ", u_date=" + u_date + ", status=" + status + ", k_trans="
				+ k_trans + "]";
	}
	
}
