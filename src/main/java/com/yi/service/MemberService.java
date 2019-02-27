package com.yi.service;

import java.util.List;

import com.yi.domain.MemberVO;

public interface MemberService {
	public String getTime();
	
	public void insertMember(MemberVO vo);
	
	public MemberVO readMember(String userid);
	
	public List<MemberVO> selectMemberAll();
	
	//아이디 이용해서 회원정보변경
	public void updateMember(MemberVO vo);
	
	public void deleteMember(String userid);
	
	//아이디, 비밀번호 일치하는 회원 찾기
	public MemberVO read(String userid, String userpw);
}
