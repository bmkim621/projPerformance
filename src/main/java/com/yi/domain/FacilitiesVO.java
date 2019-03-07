package com.yi.domain;

public class FacilitiesVO {
	private int facilitiesNo;
	private int totalFloor;
	private int zoneCnt;
	private int totalSeatCnt;
	private String facilitiesName;
	private int rSeatCnt;
	private int sSeatCnt;
	private int aSeatCnt;
	private int bSeatCnt;
	
	public int getFacilitiesNo() {
		return facilitiesNo;
	}
	public void setFacilitiesNo(int facilitiesNo) {
		this.facilitiesNo = facilitiesNo;
	}
	public int getTotalFloor() {
		return totalFloor;
	}
	public void setTotalFloor(int totalFloor) {
		this.totalFloor = totalFloor;
	}
	public int getZoneCnt() {
		return zoneCnt;
	}
	public void setZoneCnt(int zoneCnt) {
		this.zoneCnt = zoneCnt;
	}
	public int getTotalSeatCnt() {
		return totalSeatCnt;
	}
	public void setTotalSeatCnt(int totalSeatCnt) {
		this.totalSeatCnt = totalSeatCnt;
	}
	public String getFacilitiesName() {
		return facilitiesName;
	}
	public void setFacilitiesName(String facilitiesName) {
		this.facilitiesName = facilitiesName;
	}
	public int getrSeatCnt() {
		return rSeatCnt;
	}
	public void setrSeatCnt(int rSeatCnt) {
		this.rSeatCnt = rSeatCnt;
	}
	public int getsSeatCnt() {
		return sSeatCnt;
	}
	public void setsSeatCnt(int sSeatCnt) {
		this.sSeatCnt = sSeatCnt;
	}
	public int getaSeatCnt() {
		return aSeatCnt;
	}
	public void setaSeatCnt(int aSeatCnt) {
		this.aSeatCnt = aSeatCnt;
	}
	public int getbSeatCnt() {
		return bSeatCnt;
	}
	public void setbSeatCnt(int bSeatCnt) {
		this.bSeatCnt = bSeatCnt;
	}
	
	@Override
	public String toString() {
		return String.format(
				"FacilitiesVO [facilitiesNo=%s, totalFloor=%s, zoneCnt=%s, totalSeatCnt=%s, facilitiesName=%s, rSeatCnt=%s, sSeatCnt=%s, aSeatCnt=%s, bSeatCnt=%s]",
				facilitiesNo, totalFloor, zoneCnt, totalSeatCnt, facilitiesName, rSeatCnt, sSeatCnt, aSeatCnt,
				bSeatCnt);
	}
	
	
	
}
