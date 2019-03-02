package com.yi.domain;

public class ReviewAttachVO {
	private String reviewUuid;
	private String reviewUploadPath;
	private String reviewFileName;
	private boolean reviewFileType;
	private int reviewNo;
	
	public String getReviewUuid() {
		return reviewUuid;
	}
	public void setReviewUuid(String reviewUuid) {
		this.reviewUuid = reviewUuid;
	}
	public String getReviewUploadPath() {
		return reviewUploadPath;
	}
	public void setReviewUploadPath(String reviewUploadPath) {
		this.reviewUploadPath = reviewUploadPath;
	}
	public String getReviewFileName() {
		return reviewFileName;
	}
	public void setReviewFileName(String reviewFileName) {
		this.reviewFileName = reviewFileName;
	}
	public boolean isReviewFileType() {
		return reviewFileType;
	}
	public void setReviewFileType(boolean reviewFileType) {
		this.reviewFileType = reviewFileType;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	@Override
	public String toString() {
		return String.format(
				"ReviewAttachVO [reviewUuid=%s, reviewUploadPath=%s, reviewFileName=%s, reviewFileType=%s, reviewNo=%s]",
				reviewUuid, reviewUploadPath, reviewFileName, reviewFileType, reviewNo);
	}
	
	
	
}
