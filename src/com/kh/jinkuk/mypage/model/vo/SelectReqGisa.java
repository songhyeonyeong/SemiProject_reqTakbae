package com.kh.jinkuk.mypage.model.vo;

public class SelectReqGisa implements java.io.Serializable{
	
	private String user_id;
	private String user_name;
	private int grade;
	private String phone;
	private int basongnujuk;
	private String h_context;
	private int h_grade;
	private int u_no;
	private String imgname;
	
	public SelectReqGisa() {
		super();
	}

	public SelectReqGisa(String user_id, String user_name, int grade, String phone, int basongnujuk, String h_context,
			int h_grade, int u_no, String imgname) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.grade = grade;
		this.phone = phone;
		this.basongnujuk = basongnujuk;
		this.h_context = h_context;
		this.h_grade = h_grade;
		this.u_no = u_no;
		this.imgname = imgname;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getBasongnujuk() {
		return basongnujuk;
	}

	public void setBasongnujuk(int basongnujuk) {
		this.basongnujuk = basongnujuk;
	}

	public String getH_context() {
		return h_context;
	}

	public void setH_context(String h_context) {
		this.h_context = h_context;
	}

	public int getH_grade() {
		return h_grade;
	}

	public void setH_grade(int h_grade) {
		this.h_grade = h_grade;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	@Override
	public String toString() {
		return "SelectReqGisa [user_id=" + user_id + ", user_name=" + user_name + ", grade=" + grade + ", phone="
				+ phone + ", basongnujuk=" + basongnujuk + ", h_context=" + h_context + ", h_grade=" + h_grade
				+ ", u_no=" + u_no + ", imgname=" + imgname + "]";
	}

	
}
