package com.yi.domain;

import java.util.Date;
import java.util.List;

public class ReviewVO {
	private int reviewNo;
	private String reviewContent;
	private Date reviewPostDate;
	private int reviewViewCnt;
	private String reviewTitle;
	private String reviewWriter;
	private List<ReviewAttachVO> attachList;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewPostDate() {
		return reviewPostDate;
	}
	public void setReviewPostDate(Date reviewPostDate) {
		this.reviewPostDate = reviewPostDate;
	}
	public int getReviewViewCnt() {
		return reviewViewCnt;
	}
	public void setReviewViewCnt(int reviewViewCnt) {
		this.reviewViewCnt = reviewViewCnt;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public List<ReviewAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<ReviewAttachVO> attachList) {
		this.attachList = attachList;
	}
	
	@Override
	public String toString() {
		return String.format(
				"ReviewVO [reviewNo=%s, reviewContent=%s, reviewPostDate=%s, reviewViewCnt=%s, reviewTitle=%s, reviewWriter=%s, attachList=%s]",
				reviewNo, reviewContent, reviewPostDate, reviewViewCnt, reviewTitle, reviewWriter, attachList);
	}
	
	
	
}	
