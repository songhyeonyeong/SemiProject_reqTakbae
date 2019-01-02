package com.kh.jinkuk.cybermoney_breakdown.model.vo;

import java.sql.Date;

public class Cybermoney_breakdown {
	private int r_num;
	private String cm_div;
	private Date cm_date;
	private int cm_use;
	private String cm_note;
	private int c_money;
	private int c_point;
	
	public Cybermoney_breakdown() {}

	public Cybermoney_breakdown(int r_num, String cm_div, Date cm_date, int cm_use, String cm_note, int c_money,
			int c_point) {
		super();
		this.r_num = r_num;
		this.cm_div = cm_div;
		this.cm_date = cm_date;
		this.cm_use = cm_use;
		this.cm_note = cm_note;
		this.c_money = c_money;
		this.c_point = c_point;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getCm_div() {
		return cm_div;
	}

	public void setCm_div(String cm_div) {
		this.cm_div = cm_div;
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
		return "Cybermoney_breakdown [r_num=" + r_num + ", cm_div=" + cm_div + ", cm_date=" + cm_date + ", cm_use="
				+ cm_use + ", cm_note=" + cm_note + ", c_money=" + c_money + ", c_point=" + c_point + "]";
	}
	
	
	
	
}
