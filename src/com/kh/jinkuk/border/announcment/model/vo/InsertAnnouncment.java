package com.kh.jinkuk.border.announcment.model.vo;

import java.sql.Date;

public class InsertAnnouncment {
	private String gtitle;
	private String gcontext;
	private String gdiv;
	private String gsarea;
	private String gearea;
	private String gtype;
	private int gsum;
	private int gprice;
	private String gsize;
	private Date gday;
	private int uno;
	private int point;
	public InsertAnnouncment() {
		super();
	}
	public InsertAnnouncment(String gtitle, String gcontext, String gdiv, String gsarea, String gearea, String gtype,
			int gsum, int gprice, String gsize, Date gday, int uno, int point) {
		super();
		this.gtitle = gtitle;
		this.gcontext = gcontext;
		this.gdiv = gdiv;
		this.gsarea = gsarea;
		this.gearea = gearea;
		this.gtype = gtype;
		this.gsum = gsum;
		this.gprice = gprice;
		this.gsize = gsize;
		this.gday = gday;
		this.uno = uno;
		this.point = point;
	}
	public String getGtitle() {
		return gtitle;
	}
	public void setGtitle(String gtitle) {
		this.gtitle = gtitle;
	}
	public String getGcontext() {
		return gcontext;
	}
	public void setGcontext(String gcontext) {
		this.gcontext = gcontext;
	}
	public String getGdiv() {
		return gdiv;
	}
	public void setGdiv(String gdiv) {
		this.gdiv = gdiv;
	}
	public String getGsarea() {
		return gsarea;
	}
	public void setGsarea(String gsarea) {
		this.gsarea = gsarea;
	}
	public String getGearea() {
		return gearea;
	}
	public void setGearea(String gearea) {
		this.gearea = gearea;
	}
	public String getGtype() {
		return gtype;
	}
	public void setGtype(String gtype) {
		this.gtype = gtype;
	}
	public int getGsum() {
		return gsum;
	}
	public void setGsum(int gsum) {
		this.gsum = gsum;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public String getGsize() {
		return gsize;
	}
	public void setGsize(String gsize) {
		this.gsize = gsize;
	}
	public Date getGday() {
		return gday;
	}
	public void setGday(Date gday) {
		this.gday = gday;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "InsertAnnouncment [gtitle=" + gtitle + ", gcontext=" + gcontext + ", gdiv=" + gdiv + ", gsarea="
				+ gsarea + ", gearea=" + gearea + ", gtype=" + gtype + ", gsum=" + gsum + ", gprice=" + gprice
				+ ", gsize=" + gsize + ", gday=" + gday + ", uno=" + uno + ", point=" + point + "]";
	}
	
	
	
}
