package com.yi.domain;

public class LoginDTO {
	private String userid;
	private String username;
	//관리자인지 아닌지 boolean 변수 하나 만들면 편함.
	private int isMember;	//0: 회원, 1: 관리자
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getIsMember() {
		return isMember;
	}
	public void setIsMember(int isMember) {
		this.isMember = isMember;
	}
	
	
	@Override
	public String toString() {
		return String.format("LoginDTO [userid=%s, username=%s, isMember=%s]", userid, username, isMember);
	}
	
	
	
}
