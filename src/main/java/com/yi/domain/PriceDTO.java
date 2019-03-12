package com.yi.domain;

public class PriceDTO {
	private int ticketPrice;
	private int ticketFee;
	private int ticketDiscount;
	private int deliveryFee;
	private int totalPrice;
	
	public int getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public int getTicketFee() {
		return ticketFee;
	}
	public void setTicketFee(int ticketFee) {
		this.ticketFee = ticketFee;
	}
	public int getTicketDiscount() {
		return ticketDiscount;
	}
	public void setTicketDiscount(int ticketDiscount) {
		this.ticketDiscount = ticketDiscount;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	@Override
	public String toString() {
		return String.format(
				"PriceDTO [ticketPrice=%s, ticketFee=%s, ticketDiscount=%s, deliveryFee=%s, totalPrice=%s]",
				ticketPrice, ticketFee, ticketDiscount, deliveryFee, totalPrice);
	}
	
	
}
