package com.yi.domain;

import java.util.Date;

public class BookVO {
	private String bookNumber;
	private MemberVO mCode;	//회원코드
	private PerformanceVO sCode;	//공연코드
	private PaymentVO pCode;		//결제방식코드
	private DiscountVO dCode;		//할인분류코드
	private Date bookDate;	//예매일
	private Date bookTime;	//예매시간
	private int bookState;	//예매상태 0: 예매완료, 1: 예매중
	private int bookFloor;	//예매하려고하는 층
	private int bookCol;	//예매하려고하는 행
	private int bookRow;	//예매하려고하는 열
	
	public String getBookNumber() {
		return bookNumber;
	}
	public void setBookNumber(String bookNumber) {
		this.bookNumber = bookNumber;
	}
	public MemberVO getmCode() {
		return mCode;
	}
	public void setmCode(MemberVO mCode) {
		this.mCode = mCode;
	}
	public PerformanceVO getsCode() {
		return sCode;
	}
	public void setsCode(PerformanceVO sCode) {
		this.sCode = sCode;
	}
	public PaymentVO getpCode() {
		return pCode;
	}
	public void setpCode(PaymentVO pCode) {
		this.pCode = pCode;
	}
	public DiscountVO getdCode() {
		return dCode;
	}
	public void setdCode(DiscountVO dCode) {
		this.dCode = dCode;
	}
	public Date getBookDate() {
		return bookDate;
	}
	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}
	public Date getBookTime() {
		return bookTime;
	}
	public void setBookTime(Date bookTime) {
		this.bookTime = bookTime;
	}
	public int getBookState() {
		return bookState;
	}
	public void setBookState(int bookState) {
		this.bookState = bookState;
	}
	public int getBookFloor() {
		return bookFloor;
	}
	public void setBookFloor(int bookFloor) {
		this.bookFloor = bookFloor;
	}
	public int getBookCol() {
		return bookCol;
	}
	public void setBookCol(int bookCol) {
		this.bookCol = bookCol;
	}
	public int getBookRow() {
		return bookRow;
	}
	public void setBookRow(int bookRow) {
		this.bookRow = bookRow;
	}
	
	@Override
	public String toString() {
		return String.format(
				"BookVO [bookNumber=%s, mCode=%s, sCode=%s, pCode=%s, dCode=%s, bookDate=%s, bookTime=%s, bookState=%s, bookFloor=%s, bookCol=%s, bookRow=%s]",
				bookNumber, mCode, sCode, pCode, dCode, bookDate, bookTime, bookState, bookFloor, bookCol, bookRow);
	}
	
	
}
