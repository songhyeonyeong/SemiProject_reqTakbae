package com.kh.jinkuk.border.report.model.vo;

public class Report {
	private int gno; 
	private int uno;
	private String title;
	private String name;
	private String report;
	private String area;
	
	public Report() {}

	public Report(int gno, int uno, String title, String name, String report, String area) {
		super();
		this.gno = gno;
		this.uno = uno;
		this.title = title;
		this.name = name;
		this.report = report;
		this.area = area;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Override
	public String toString() {
		return "Report [gno=" + gno + ", uno=" + uno + ", title=" + title + ", name=" + name + ", report=" + report
				+ ", area=" + area + "]";
	}

	
	
	
}
