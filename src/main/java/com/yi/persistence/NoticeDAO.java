package com.yi.persistence;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.NoticeVO;
import com.yi.domain.SearchCriteria;

public interface NoticeDAO {

	//리스트 보기
	public List<NoticeVO> noticeListAll();
		
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
	
	//쓰기
	public void register(NoticeVO vo);
	
	//공지사항 작성 때 필요한 값들 가져오기
	public List<MemberVO> getWriter(String id);
	
	//첨부파일
	public void addAttach(String fullname);
	
	//공지사항 번호에 해당하는 첨부파일 가지고오기
	public List<String> getAttach(int no);
	
	//첨부파일 삭제하기
	public void delAttach(int no);
	
	//이름에 해당하는 파일 삭제하기
	public void deleteAttachByFullName(int no, String fullname);
	
	public void addAttachByNo(String fullname, int no);
	
	//공지사항 수정하기 => 수정 필요한 부분, 제목 내용
	public void update(NoticeVO vo);
	
	//공지사항 삭제하기
	public void delete(int no);
}
