package com.yi.domain;

import java.util.Date;

public class PerformanceVO {
	private String showCode;
	private String showName;
	private String showType;
	private int totalTime;
	private Date startTime;
	private Date showStartdate;
	private Date showEnddate;
	private FacilitiesVO facilitiesNo;
	
	public PerformanceVO() {
		// TODO Auto-generated constructor stub
	}

	public PerformanceVO(String showCode, String showName, String showType, int totalTime, Date startTime,
			Date showStartdate, Date showEnddate, FacilitiesVO facilitiesNo) {
		this.showCode = showCode;
		this.showName = showName;
		this.showType = showType;
		this.totalTime = totalTime;
		this.startTime = startTime;
		this.showStartdate = showStartdate;
		this.showEnddate = showEnddate;
		this.facilitiesNo = facilitiesNo;
	}

	public String getShowCode() {
		return showCode;
	}

	public void setShowCode(String showCode) {
		this.showCode = showCode;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getShowType() {
		return showType;
	}

	public void setShowType(String showType) {
		this.showType = showType;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getShowStartdate() {
		return showStartdate;
	}

	public void setShowStartdate(Date showStartdate) {
		this.showStartdate = showStartdate;
	}

	public Date getShowEnddate() {
		return showEnddate;
	}

	public void setShowEnddate(Date showEnddate) {
		this.showEnddate = showEnddate;
	}

	public FacilitiesVO getFacilitiesNo() {
		return facilitiesNo;
	}

	public void setFacilitiesNo(FacilitiesVO facilitiesNo) {
		this.facilitiesNo = facilitiesNo;
	}

	@Override
	public String toString() {
		return String.format(
				"PerformanceVO [showCode=%s, showName=%s, showType=%s, totalTime=%s, startTime=%s, showStartdate=%s, showEnddate=%s, facilitiesNo=%s]",
				showCode, showName, showType, totalTime, startTime, showStartdate, showEnddate, facilitiesNo);
	}
	
	
}
