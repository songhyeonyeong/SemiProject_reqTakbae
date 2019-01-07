package com.kh.jinkuk.exchange.model.vo;

public class ExchangeAjax {
	private int money;
	private int point;
	
	public ExchangeAjax() {}

	public ExchangeAjax(int money, int point) {
		super();
		this.money = money;
		this.point = point;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "ExchangeAjax [money=" + money + ", point=" + point + "]";
	}
	
	
}
