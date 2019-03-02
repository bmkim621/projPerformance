package com.yi.persistence;

import java.util.List;

import com.yi.domain.ReviewAttachVO;

public interface ReviewAttachDAO {
	//첨부파일 추가
	public void insert(ReviewAttachVO vo);
	
	//첨부파일 삭제
	public void delete(String uuid);
	
	//후기번호로 첨부파일 찾기
	public List<ReviewAttachVO> findByReviewNo(int reviewNo);
	
	public void deleteAll(int reviewNo);
	
	//첨부파일 목록 가지고 오기
	public List<ReviewAttachVO> getOldFiles();
}
