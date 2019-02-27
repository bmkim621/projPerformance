package com.yi.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVO {
	private String memberCode;
	private String memberName;
	private String id;
	private String password;
	private String email;
	private String phone;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dob;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private String text;
	private int isMember;	//0: 회원, 1: 관리자
	private GradeVO gCode;	//등급코드
	
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getIsMember() {
		return isMember;
	}
	public void setIsMember(int isMember) {
		this.isMember = isMember;
	}
	public GradeVO getgCode() {
		return gCode;
	}
	public void setgCode(GradeVO gCode) {
		this.gCode = gCode;
	}
	
	@Override
	public String toString() {
		return String.format(
				"MemberVO [memberCode=%s, memberName=%s, id=%s, password=%s, email=%s, phone=%s, dob=%s, regdate=%s, text=%s, isMember=%s, gCode=%s]",
				memberCode, memberName, id, password, email, phone, dob, regdate, text, isMember, gCode);
	}
	
	
	
}
