package com.kh.jinkuk.member.model.vo;

import java.util.Date;

public class Images implements java.io.Serializable{
	private int i_no;
	private String i_div;
	private String status;
	private String i_o_name;
	private String i_c_name;
	private String i_path;
	private Date i_upload;
	private int u_no;
	private int g_no;
	
	public Images() {}

	public Images(int i_no, String i_div, String status, String i_o_name, String i_c_name, String i_path,
			Date i_upload, int u_no, int g_no) {
		super();
		this.i_no = i_no;
		this.i_div = i_div;
		this.status = status;
		this.i_o_name = i_o_name;
		this.i_c_name = i_c_name;
		this.i_path = i_path;
		this.i_upload = i_upload;
		this.u_no = u_no;
		this.g_no = g_no;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public String getI_div() {
		return i_div;
	}

	public void setI_div(String i_div) {
		this.i_div = i_div;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getI_o_name() {
		return i_o_name;
	}

	public void setI_o_name(String i_o_name) {
		this.i_o_name = i_o_name;
	}

	public String getI_c_name() {
		return i_c_name;
	}

	public void setI_c_name(String i_c_name) {
		this.i_c_name = i_c_name;
	}

	public String getI_path() {
		return i_path;
	}

	public void setI_path(String i_path) {
		this.i_path = i_path;
	}

	public Date getI_upload() {
		return i_upload;
	}

	public void setI_upload(Date i_upload) {
		this.i_upload = i_upload;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	@Override
	public String toString() {
		return "Images [i_no=" + i_no + ", i_div=" + i_div + ", status=" + status + ", i_o_name=" + i_o_name
				+ ", i_c_name=" + i_c_name + ", i_path=" + i_path + ", i_upload=" + i_upload + ", u_no=" + u_no
				+ ", g_no=" + g_no + "]";
	}

	


	
}
