package com.yi.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PerformanceVO {
	private String showCode;
	private String showName;
	private String showType;
	private int totalTime;
	@DateTimeFormat(pattern="hh:mm:ss")
	private Date startTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date showStartdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date showEnddate;
	private FacilitiesVO facilitiesNo;
	private String showImagePath;
	
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
	public String getShowImagePath() {
		return showImagePath;
	}
	public void setShowImagePath(String showImagePath) {
		this.showImagePath = showImagePath;
	}
	
	@Override
	public String toString() {
		return String.format(
				"PerformanceVO [showCode=%s, showName=%s, showType=%s, totalTime=%s, startTime=%s, showStartdate=%s, showEnddate=%s, facilitiesNo=%s, showImagePath=%s]",
				showCode, showName, showType, totalTime, startTime, showStartdate, showEnddate, facilitiesNo,
				showImagePath);
	}

}
