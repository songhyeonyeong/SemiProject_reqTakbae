package com.kh.jinkuk.admin.model.vo;

public class Chart {
	private String area;
	private int count;
	
	public Chart() {}

	public Chart(String area, int count) {
		super();
		this.area = area;
		this.count = count;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Chart [area=" + area + ", count=" + count + "]";
	}
	
	
	
}
