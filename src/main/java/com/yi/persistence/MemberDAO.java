package com.yi.persistence;

import java.util.List;

import com.yi.domain.BookVO;
import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.NoticeVO;
import com.yi.domain.SearchCriteria;

public interface MemberDAO {
	public String getTime();
	
	public void insertMember(MemberVO vo);
	
	public MemberVO readMember(String userid);
	
	public List<MemberVO> selectMemberAll();
	
	//아이디 이용해서 회원정보변경
	public void updateMember(MemberVO vo);
	
	public void deleteMember(String memberCode);
	
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
	
	/* 페이지 관련 */
	//페이지
	public List<MemberVO> listCriteria(Criteria cri);

	// 게시물 총 갯수
	public int totalCount();

	// 검색
	public List<MemberVO> listSearch(SearchCriteria cri);

	// 검색한 게시물의 총 갯수
	public int searchTotalCount(SearchCriteria cri);
	
	//회원 등급 수정
	public void updateMemberGrade(MemberVO vo);
		
}
