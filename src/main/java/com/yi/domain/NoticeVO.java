package com.yi.domain;

import java.util.Date;
import java.util.List;

public class NoticeVO {
	private int noticeNo;
	private String content;
	private String title;
	private Date regdate;
	private int isNotice;	//0: 알림 표시X, 1: 알림 표시O
	private String managerCode;
	private int viewCnt;
	private String noticeCategory;
	private String writer;
	private List<String> files;		//첨부파일
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getIsNotice() {
		return isNotice;
	}
	public void setIsNotice(int isNotice) {
		this.isNotice = isNotice;
	}
	public String getManagerCode() {
		return managerCode;
	}
	public void setManagerCode(String managerCode) {
		this.managerCode = managerCode;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getNoticeCategory() {
		return noticeCategory;
	}
	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public List<String> getFiles() {
		return files;
	}
	public void setFiles(List<String> files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", content=" + content + ", title=" + title + ", regdate=" + regdate
				+ ", isNotice=" + isNotice + ", managerCode=" + managerCode + ", viewCnt=" + viewCnt
				+ ", noticeCategory=" + noticeCategory + ", writer=" + writer + ", files=" + files + "]";
	}
	
	
	
}
