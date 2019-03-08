package com.yi.domain;

public class ResvSeatVO {
	private String resvZone;
	private String resvNum;
	
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
	
	@Override
	public String toString() {
		return String.format("ResvSeatVO [resvZone=%s, resvNum=%s]", resvZone, resvNum);
	}
	
	
}
