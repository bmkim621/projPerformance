package com.yi.domain;

import java.util.Date;
import java.util.List;

public class NoticeVO {
	private int noticeNo;
	private String content;
	private String title;
	private Date regdate;
	private String writer;
	private int isNotice;	//0: 알림 표시X, 1: 알림 표시O
	private int viewCnt;
	private String memberCode;
	private List<NoticeAttachVO> attachList;	//첨부파일
	
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getIsNotice() {
		return isNotice;
	}
	public void setIsNotice(int isNotice) {
		this.isNotice = isNotice;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public List<NoticeAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<NoticeAttachVO> attachList) {
		this.attachList = attachList;
	}
	
	@Override
	public String toString() {
		return String.format(
				"NoticeVO [noticeNo=%s, content=%s, title=%s, regdate=%s, writer=%s, isNotice=%s, viewCnt=%s, memberCode=%s, attachList=%s]",
				noticeNo, content, title, regdate, writer, isNotice, viewCnt, memberCode, attachList);
	}
	
	
	
}
