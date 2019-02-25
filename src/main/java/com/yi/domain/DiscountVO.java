package com.yi.domain;

public class DiscountVO {
	private String discountCode;
	private int discountRate;
	private String discountName;
	
	public String getDiscountCode() {
		return discountCode;
	}

	public void setDiscountCode(String discountCode) {
		this.discountCode = discountCode;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public String getDiscountName() {
		return discountName;
	}

	public void setDiscountName(String discountName) {
		this.discountName = discountName;
	}

	@Override
	public String toString() {
		return String.format("DiscountVO [discountCode=%s, discountRate=%s, discountName=%s]", discountCode,
				discountRate, discountName);
	}
	
	
}
