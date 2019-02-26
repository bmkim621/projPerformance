package com.yi.domain;

public class SearchDate {
	private int sYear;
	private int sMonth;
	private String category;
	
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return String.format("SearchDate [sYear=%s, sMonth=%s, category=%s]", sYear, sMonth, category);
	}
	
	

	
}
