package com.yi.persistence;

import java.util.List;

import com.yi.domain.BookVO;
import com.yi.domain.MemberVO;

public interface MemberDAO {
	public String getTime();
	
	public void insertMember(MemberVO vo);
	
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
		
}
