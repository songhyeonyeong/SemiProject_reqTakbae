package com.kh.jinkuk.border.announcment.model.vo;

import java.util.Date;

public class Announcment implements java.io.Serializable{
	
	
	private int rnum;
	private int count;
	private int G_NO;
	private String G_TITLE;
	private String G_CONTEXT;
	private Date G_S_DATE;
	private Date G_E_DATE;
	private String G_S_AREA;
	private String G_E_AREA;
	private String G_TYPE;
	private int G_SUM;
	private int G_PRICE;
	private String G_SIZE;
	private Date G_DAY;
	private String STATUS;
	private int U_NO;
	private String G_P_DIV;
	private String USER_ID;
	private String G_DIV;
	private Date cm_date;
	private int cm_use;
	private String cm_note;
	private int c_money;
	private int c_point;
	
	
	public Announcment() {}


	public Announcment(int rnum, int count, int g_NO, String g_TITLE, String g_CONTEXT, Date g_S_DATE, Date g_E_DATE,
			String g_S_AREA, String g_E_AREA, String g_TYPE, int g_SUM, int g_PRICE, String g_SIZE, Date g_DAY,
			String sTATUS, int u_NO, String g_P_DIV, String uSER_ID, String g_DIV, Date cm_date, int cm_use,
			String cm_note, int c_money, int c_point) {
		super();
		this.rnum = rnum;
		this.count = count;
		G_NO = g_NO;
		G_TITLE = g_TITLE;
		G_CONTEXT = g_CONTEXT;
		G_S_DATE = g_S_DATE;
		G_E_DATE = g_E_DATE;
		G_S_AREA = g_S_AREA;
		G_E_AREA = g_E_AREA;
		G_TYPE = g_TYPE;
		G_SUM = g_SUM;
		G_PRICE = g_PRICE;
		G_SIZE = g_SIZE;
		G_DAY = g_DAY;
		STATUS = sTATUS;
		U_NO = u_NO;
		G_P_DIV = g_P_DIV;
		USER_ID = uSER_ID;
		G_DIV = g_DIV;
		this.cm_date = cm_date;
		this.cm_use = cm_use;
		this.cm_note = cm_note;
		this.c_money = c_money;
		this.c_point = c_point;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getG_NO() {
		return G_NO;
	}


	public void setG_NO(int g_NO) {
		G_NO = g_NO;
	}


	public String getG_TITLE() {
		return G_TITLE;
	}


	public void setG_TITLE(String g_TITLE) {
		G_TITLE = g_TITLE;
	}


	public String getG_CONTEXT() {
		return G_CONTEXT;
	}


	public void setG_CONTEXT(String g_CONTEXT) {
		G_CONTEXT = g_CONTEXT;
	}


	public Date getG_S_DATE() {
		return G_S_DATE;
	}


	public void setG_S_DATE(Date g_S_DATE) {
		G_S_DATE = g_S_DATE;
	}


	public Date getG_E_DATE() {
		return G_E_DATE;
	}


	public void setG_E_DATE(Date g_E_DATE) {
		G_E_DATE = g_E_DATE;
	}


	public String getG_S_AREA() {
		return G_S_AREA;
	}


	public void setG_S_AREA(String g_S_AREA) {
		G_S_AREA = g_S_AREA;
	}


	public String getG_E_AREA() {
		return G_E_AREA;
	}


	public void setG_E_AREA(String g_E_AREA) {
		G_E_AREA = g_E_AREA;
	}


	public String getG_TYPE() {
		return G_TYPE;
	}


	public void setG_TYPE(String g_TYPE) {
		G_TYPE = g_TYPE;
	}


	public int getG_SUM() {
		return G_SUM;
	}


	public void setG_SUM(int g_SUM) {
		G_SUM = g_SUM;
	}


	public int getG_PRICE() {
		return G_PRICE;
	}


	public void setG_PRICE(int g_PRICE) {
		G_PRICE = g_PRICE;
	}


	public String getG_SIZE() {
		return G_SIZE;
	}


	public void setG_SIZE(String g_SIZE) {
		G_SIZE = g_SIZE;
	}


	public Date getG_DAY() {
		return G_DAY;
	}


	public void setG_DAY(Date g_DAY) {
		G_DAY = g_DAY;
	}


	public String getSTATUS() {
		return STATUS;
	}


	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}


	public int getU_NO() {
		return U_NO;
	}


	public void setU_NO(int u_NO) {
		U_NO = u_NO;
	}


	public String getG_P_DIV() {
		return G_P_DIV;
	}


	public void setG_P_DIV(String g_P_DIV) {
		G_P_DIV = g_P_DIV;
	}


	public String getUSER_ID() {
		return USER_ID;
	}


	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}


	public String getG_DIV() {
		return G_DIV;
	}


	public void setG_DIV(String g_DIV) {
		G_DIV = g_DIV;
	}


	public Date getCm_date() {
		return cm_date;
	}


	public void setCm_date(Date cm_date) {
		this.cm_date = cm_date;
	}


	public int getCm_use() {
		return cm_use;
	}


	public void setCm_use(int cm_use) {
		this.cm_use = cm_use;
	}


	public String getCm_note() {
		return cm_note;
	}


	public void setCm_note(String cm_note) {
		this.cm_note = cm_note;
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


	@Override
	public String toString() {
		return "Announcment [rnum=" + rnum + ", count=" + count + ", G_NO=" + G_NO + ", G_TITLE=" + G_TITLE
				+ ", G_CONTEXT=" + G_CONTEXT + ", G_S_DATE=" + G_S_DATE + ", G_E_DATE=" + G_E_DATE + ", G_S_AREA="
				+ G_S_AREA + ", G_E_AREA=" + G_E_AREA + ", G_TYPE=" + G_TYPE + ", G_SUM=" + G_SUM + ", G_PRICE="
				+ G_PRICE + ", G_SIZE=" + G_SIZE + ", G_DAY=" + G_DAY + ", STATUS=" + STATUS + ", U_NO=" + U_NO
				+ ", G_P_DIV=" + G_P_DIV + ", USER_ID=" + USER_ID + ", G_DIV=" + G_DIV + ", cm_date=" + cm_date
				+ ", cm_use=" + cm_use + ", cm_note=" + cm_note + ", c_money=" + c_money + ", c_point=" + c_point + "]";
	}
	
	
	
}