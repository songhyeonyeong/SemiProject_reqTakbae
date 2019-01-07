package com.kh.jinkuk.mypage.model.vo;

import java.sql.Date;

public class Mynotice implements java.io.Serializable{
	private String G_TITLE;
	private int G_NO;
	private String G_DIV;
	private String G_CONTEXT;
	private Date G_DAY;
	private String USER_ID;
	public Mynotice() {
		super();
	}
	@Override
	public String toString() {
		return "Mynotice [G_TITLE=" + G_TITLE + ", G_NO=" + G_NO + ", G_DIV=" + G_DIV + ", G_CONTEXT=" + G_CONTEXT
				+ ", G_DAY=" + G_DAY + ", USER_ID=" + USER_ID + "]";
	}
	public String getG_TITLE() {
		return G_TITLE;
	}
	public void setG_TITLE(String g_TITLE) {
		G_TITLE = g_TITLE;
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
	public Mynotice(String g_TITLE, int g_NO, String g_DIV, String g_CONTEXT, Date g_DAY, String uSER_ID) {
		super();
		G_TITLE = g_TITLE;
		G_NO = g_NO;
		G_DIV = g_DIV;
		G_CONTEXT = g_CONTEXT;
		G_DAY = g_DAY;
		USER_ID = uSER_ID;
	}

}
