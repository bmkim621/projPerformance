package com.yi.domain;

import java.util.Date;

public class ResvSeatVO {
	private String resvZone;
	private String resvNum;
	private String showCode;
	private Date resvDate;
	
	public String getResvZone() {
		return resvZone;
	}
	public void setResvZone(String resvZone) {
		this.resvZone = resvZone;
	}
	public String getResvNum() {
		return resvNum;
	}
	public void setResvNum(String resvNum) {
		this.resvNum = resvNum;
	}
	public String getShowCode() {
		return showCode;
	}
	public void setShowCode(String showCode) {
		this.showCode = showCode;
	}
	public Date getResvDate() {
		return resvDate;
	}
	public void setResvDate(Date resvDate) {
		this.resvDate = resvDate;
	}
	
	@Override
	public String toString() {
		return String.format("ResvSeatVO [resvZone=%s, resvNum=%s, showCode=%s, resvDate=%s]", resvZone, resvNum,
				showCode, resvDate);
	}
	
	
	
}
