package com.yi.domain;

public class SeatVO {
	private String locCode;
	private String zone;
	private FacilitiesVO facilitiesNo;
	private int startLoc;
	private int endLoc;
	
	public SeatVO() {
		// TODO Auto-generated constructor stub
	}

	public SeatVO(String locCode, String zone, FacilitiesVO facilitiesNo, int startLoc, int endLoc) {
		this.locCode = locCode;
		this.zone = zone;
		this.facilitiesNo = facilitiesNo;
		this.startLoc = startLoc;
		this.endLoc = endLoc;
	}

	public String getLocCode() {
		return locCode;
	}

	public void setLocCode(String locCode) {
		this.locCode = locCode;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public FacilitiesVO getFacilitiesNo() {
		return facilitiesNo;
	}

	public void setFacilitiesNo(FacilitiesVO facilitiesNo) {
		this.facilitiesNo = facilitiesNo;
	}

	public int getStartLoc() {
		return startLoc;
	}

	public void setStartLoc(int startLoc) {
		this.startLoc = startLoc;
	}

	public int getEndLoc() {
		return endLoc;
	}

	public void setEndLoc(int endLoc) {
		this.endLoc = endLoc;
	}

	@Override
	public String toString() {
		return String.format("SeatVO [locCode=%s, zone=%s, facilitiesNo=%s, startLoc=%s, endLoc=%s]", locCode, zone,
				facilitiesNo, startLoc, endLoc);
	}
	
	
}
