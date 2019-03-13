package com.yi.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PerformanceVO {
	private String showCode;
	private String showName;
	private String showType;
	private int totalTime;
	@DateTimeFormat(pattern="HH:mm")
	private Date startTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date showStartdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date showEnddate;
	private FacilitiesVO fno;
	private String showImagePath;
	//좌석분류
	private String seatCategory;
	private int remainSeat;	//잔여석
	private int rRemainSeat;	//R 잔여석
	private int sRemainSeat;
	private int aRemainSeat;
	private int bRemainSeat;
	
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
	public FacilitiesVO getFno() {
		return fno;
	}
	public void setFno(FacilitiesVO fno) {
		this.fno = fno;
	}
	public String getShowImagePath() {
		return showImagePath;
	}
	public void setShowImagePath(String showImagePath) {
		this.showImagePath = showImagePath;
	}
	public String getSeatCategory() {
		return seatCategory;
	}
	public void setSeatCategory(String seatCategory) {
		this.seatCategory = seatCategory;
	}
	public int getRemainSeat() {
		return remainSeat;
	}
	public void setRemainSeat(int remainSeat) {
		this.remainSeat = remainSeat;
	}
	public int getrRemainSeat() {
		return rRemainSeat;
	}
	public void setrRemainSeat(int rRemainSeat) {
		this.rRemainSeat = rRemainSeat;
	}
	public int getsRemainSeat() {
		return sRemainSeat;
	}
	public void setsRemainSeat(int sRemainSeat) {
		this.sRemainSeat = sRemainSeat;
	}
	public int getaRemainSeat() {
		return aRemainSeat;
	}
	public void setaRemainSeat(int aRemainSeat) {
		this.aRemainSeat = aRemainSeat;
	}
	public int getbRemainSeat() {
		return bRemainSeat;
	}
	public void setbRemainSeat(int bRemainSeat) {
		this.bRemainSeat = bRemainSeat;
	}
	
	@Override
	public String toString() {
		return String.format(
				"PerformanceVO [showCode=%s, showName=%s, showType=%s, totalTime=%s, startTime=%s, showStartdate=%s, showEnddate=%s, fno=%s, showImagePath=%s, seatCategory=%s, remainSeat=%s, rRemainSeat=%s, sRemainSeat=%s, aRemainSeat=%s, bRemainSeat=%s]",
				showCode, showName, showType, totalTime, startTime, showStartdate, showEnddate, fno, showImagePath,
				seatCategory, remainSeat, rRemainSeat, sRemainSeat, aRemainSeat, bRemainSeat);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((showCode == null) ? 0 : showCode.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PerformanceVO other = (PerformanceVO) obj;
		if (showCode == null) {
			if (other.showCode != null)
				return false;
		} else if (!showCode.equals(other.showCode))
			return false;
		return true;
	}
	
	
	
	
	
}
