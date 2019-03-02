package com.yi.persistence;

import java.util.List;

import com.yi.domain.NoticeAttachVO;

public interface NoticeAttachDAO {
	//첨부파일 추가
	public void insert(NoticeAttachVO vo);
	
	//첨부파일 삭제
	public void delete(String uuid);
	
	//공지사항 번호로 첨부파일 찾기
	public List<NoticeAttachVO> findByNoticeNo(int noticeNo);
	
	public void deleteAll(int noticeNo);
	
	//첨부파일 목록 가지고 오기
	public List<NoticeAttachVO> getOldFiles();
}
