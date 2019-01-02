package com.kh.jinkuk.mypage.model.vo;

import java.sql.Date;

public class MyDeliverNotice implements java.io.Serializable{
	
	private int G_NO;
	private String G_DIV;
	private String G_CONTEXT;
	private Date G_DAY;
	private String USER_ID;
	private String D_STATUS;
	private int u_no;
	public MyDeliverNotice() {
		super();
	}
	public MyDeliverNotice(int g_NO, String g_DIV, String g_CONTEXT, Date g_DAY, String uSER_ID, String d_STATUS,
			int u_no) {
		super();
		G_NO = g_NO;
		G_DIV = g_DIV;
		G_CONTEXT = g_CONTEXT;
		G_DAY = g_DAY;
		USER_ID = uSER_ID;
		D_STATUS = d_STATUS;
		this.u_no = u_no;
	}
	public int getG_NO() {
		return G_NO;
	}
	public void setG_NO(int g_NO) {
		G_NO = g_NO;
	}
	public String getG_DIV() {
		return G_DIV;
	}
	public void setG_DIV(String g_DIV) {
		G_DIV = g_DIV;
	}
	public String getG_CONTEXT() {
		return G_CONTEXT;
	}
	public void setG_CONTEXT(String g_CONTEXT) {
		G_CONTEXT = g_CONTEXT;
	}
	public Date getG_DAY() {
		return G_DAY;
	}
	public void setG_DAY(Date g_DAY) {
		G_DAY = g_DAY;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getD_STATUS() {
		return D_STATUS;
	}
	public void setD_STATUS(String d_STATUS) {
		D_STATUS = d_STATUS;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	@Override
	public String toString() {
		return "MyDeliverNotice [G_NO=" + G_NO + ", G_DIV=" + G_DIV + ", G_CONTEXT=" + G_CONTEXT + ", G_DAY=" + G_DAY
				+ ", USER_ID=" + USER_ID + ", D_STATUS=" + D_STATUS + ", u_no=" + u_no + "]";
	}

}
