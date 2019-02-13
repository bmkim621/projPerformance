package com.yi.domain;

public class FacilitiesVO {
	private int facilitiesNo;
	private int totalFloor;
	private int zoneCnt;
	private int totalSeatCnt;
	
	public FacilitiesVO() {
		// TODO Auto-generated constructor stub
	}
	
	public FacilitiesVO(int facilitiesNo, int totalFloor, int zoneCnt, int totalSeatCnt) {
		this.facilitiesNo = facilitiesNo;
		this.totalFloor = totalFloor;
		this.zoneCnt = zoneCnt;
		this.totalSeatCnt = totalSeatCnt;
	}

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

	@Override
	public String toString() {
		return String.format("FacilitiesVO [facilitiesNo=%s, totalFloor=%s, zoneCnt=%s, totalSeatCnt=%s]", facilitiesNo,
				totalFloor, zoneCnt, totalSeatCnt);
	}
	
}
