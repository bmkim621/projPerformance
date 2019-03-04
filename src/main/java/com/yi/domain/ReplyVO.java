package com.yi.domain;

import java.util.Date;

public class ReplyVO {
	public int replyNo;
	public int reviewNo;
	public String replyer;
	public String replyContent;
	public Date regdate;
	public Date updatedate;
	public String replyerId;
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getReplyerId() {
		return replyerId;
	}
	public void setReplyerId(String replyerId) {
		this.replyerId = replyerId;
	}
	
	@Override
	public String toString() {
		return String.format(
				"ReplyVO [replyNo=%s, reviewNo=%s, replyer=%s, replyContent=%s, regdate=%s, updatedate=%s, replyerId=%s]",
				replyNo, reviewNo, replyer, replyContent, regdate, updatedate, replyerId);
	}
	
	
	

}
