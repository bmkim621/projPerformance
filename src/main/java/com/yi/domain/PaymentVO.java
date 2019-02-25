package com.yi.domain;

public class PaymentVO {
	private String paymentCode;
	private String paymentName;
	
	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	@Override
	public String toString() {
		return String.format("PaymentVO [paymentCode=%s, paymentName=%s]", paymentCode, paymentName);
	}
	
	
}
