package com.yi.domain;

public class SearchDate {
	private int sYear;
	private int sMonth;
	
	public int getsYear() {
		return sYear;
	}
	public void setsYear(int sYear) {
		this.sYear = sYear;
	}
	public int getsMonth() {
		return sMonth;
	}
	public void setsMonth(int sMonth) {
		this.sMonth = sMonth;
	}
	
	@Override
	public String toString() {
		return String.format("SearchDate [sYear=%s, sMonth=%s]", sYear, sMonth);
	}
	

	
}
