package com.yi.persistence;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.ManagerVO;
import com.yi.domain.NoticeVO;
import com.yi.domain.SearchCriteria;

public interface NoticeDAO {

	//리스트 보기
	public List<NoticeVO> noticeListAll();
	
	//직원 코드로 검색
	public ManagerVO selectManagerByCode(String managerCode);
	
	//페이지
	public List<NoticeVO> listCriteria(Criteria cri);
	
	//게시물 총 갯수
	public int totalCount();
	
	//검색
	public List<NoticeVO> listSearch(SearchCriteria cri);
	
	//검색한 게시물의 총 갯수
	public int searchTotalCount(SearchCriteria cri);
	
	//is_notice = 1
	public List<NoticeVO> listWithIsNotice();
	
	//공지사항 읽기
	public NoticeVO read(int no);
	
	//조회수
	public void increaseViewCnt(int no);
}
