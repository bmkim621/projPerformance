package com.yi.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import com.yi.domain.BookVO;
import com.yi.domain.MemberVO;

public interface MemberService {
	public String getTime();
	
	public void insertMember(MemberVO vo) throws MessagingException, UnsupportedEncodingException;
	
	public MemberVO readMember(String userid);
	
	public List<MemberVO> selectMemberAll();
	
	//아이디 이용해서 회원정보변경
	public void updateMember(MemberVO vo);
	
	public void deleteMember(String userid);
	
	//아이디, 비밀번호 일치하는 회원 찾기
	public MemberVO read(String userid, String userpw);
	
	//아이디 중복확인
	public int idDuplicateChk(String userid);
	
	//나의 예매내역
	public List<BookVO> selectMyBookList(String memberCode);
	
	//============ 예매 공연 종류 ===============
	public int getCountA(String memberCode);
	public int getCountB(String memberCode);
	public int getCountC(String memberCode);
	public int getCountD(String memberCode);
	public int getCountE(String memberCode);
	
	//연도별 검색
	public List<BookVO> selectBookListByYear(String year, String memberCode);
	
}
