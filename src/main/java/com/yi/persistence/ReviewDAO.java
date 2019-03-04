package com.yi.persistence;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.ReviewAttachVO;
import com.yi.domain.ReviewVO;
import com.yi.domain.SearchCriteria;

public interface ReviewDAO {
	//리뷰 리스트 보기
	public List<ReviewVO> reviewListAll();
	
	//쓰기
	public void register(ReviewVO vo);
	
	//수정
	public boolean update(ReviewVO vo);
	
	//삭제
	public void delete(int no);
	
	//읽기
	public ReviewVO read(int no);
	
	//마지막 번호
	public int selectLastNo();
	
	//첨부파일 불러오기
	public List<ReviewAttachVO> getAttachList(int reviewNo);
	
	//조회수
	public void increaseReviewViewCnt(int no);
	
	//페이지
	public List<ReviewVO> listCriteria(Criteria cri);
	
	//게시물 총 갯수
	public int totalCount();
	
	//검색
	public List<ReviewVO> listSearch(SearchCriteria cri);
	
	//검색한 게시물의 총 갯수
	public int searchTotalCount(SearchCriteria cri);
	
	//댓글 작성 시 글제목 옆에 댓글 수도 같이 증가되도록
	public void updateReplyCnt(int no, int amount);
	
	//후기 작성 때 필요한 값들 가져오기
	public List<MemberVO> getWriter(String id);
	
	//회원코드로 아이디 가지고 오기
	public MemberVO getMemberId(String memberCode);
}
