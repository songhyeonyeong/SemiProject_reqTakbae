package com.kh.jinkuk.admin.model.vo;

public class LoadImg {
	
	private String imgname;
	
	public LoadImg() {}

	public LoadImg(String imgname) {
		super();
		this.imgname = imgname;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	@Override
	public String toString() {
		return "LoadImg [imgname=" + imgname + "]";
	}
	
	

}
