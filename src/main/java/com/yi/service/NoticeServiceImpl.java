package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.NoticeAttachVO;
import com.yi.domain.NoticeVO;
import com.yi.domain.SearchCriteria;
import com.yi.persistence.NoticeAttachDAO;
import com.yi.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;
	@Autowired
	private NoticeAttachDAO attachDao;

	@Override
	public List<NoticeVO> noticeListAll() {
		// TODO Auto-generated method stub
		return noticeDao.noticeListAll();
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) {
		// TODO Auto-generated method stub
		return noticeDao.listCriteria(cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return noticeDao.totalCount();
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return noticeDao.listSearch(cri);
	}

	@Override
	public int searchTotalCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return noticeDao.searchTotalCount(cri);
	}

	@Override
	public List<NoticeVO> listWithIsNotice() {
		// TODO Auto-generated method stub
		return noticeDao.listWithIsNotice();
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED)	//읽기만 가능.
	public NoticeVO read(int no) {
		// TODO Auto-generated method stub
		NoticeVO vo = noticeDao.read(no);
		
		return noticeDao.read(no);
	}

	@Override
	public void increaseViewCnt(int no) {
		// TODO Auto-generated method stub
		noticeDao.increaseViewCnt(no);
	}

	
	@Override
	@Transactional //서로 다른 테이블 (notice 테이블과 notice_attach 테이블에 같은 커넥션을 사용하기 위해 사용)
	public void register(NoticeVO vo) {
		// TODO Auto-generated method stub
		noticeDao.register(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		List<NoticeAttachVO> list = vo.getAttachList();
		for(NoticeAttachVO attachVO : list) {
			//위에 notice 테이블 추가하니까 자꾸 notice_no가 0이 나왔다. 그래서 notice 테이블의 마지막 번호를 받는 selectLastNo 함수를 이용해서 
			//추가된 번호를 받아오는 변수 lastno를 선언하고, notice_attach 테이블에 set하니 성공적으로 번호가 추가됨!
			int lastno = noticeDao.selectLastNo();
			attachVO.setNoticeNo(lastno);
			attachDao.insert(attachVO);
		}
	}

	@Override
	public List<MemberVO> getWriter(String id) {
		// TODO Auto-generated method stub
		return noticeDao.getWriter(id);
	}

	@Override
	@Transactional
	public boolean modify(NoticeVO vo) {
		// TODO Auto-generated method stub
		System.out.println("=============== modify NoticeVO = " + vo);
		
		//기존 첨부파일 삭제
		attachDao.deleteAll(vo.getNoticeNo());
			//수정 결과 판단 => 업데이트 되면 true 반환
			boolean modifyResult = noticeDao.update(vo);
			
//			System.out.println("===========> modifyResult " + modifyResult);
//			System.out.println("===========> size " + vo.getAttachList());        
			  
			if(modifyResult && vo.getAttachList() != null && vo.getAttachList().size() > 0) {
				vo.getAttachList().forEach(attach -> {
					attach.setNoticeNo(vo.getNoticeNo());
					attachDao.insert(attach);
				});
			}
			return modifyResult;
	}

	@Override
	@Transactional
	public boolean remove(int no) {
		// TODO Auto-generated method stub
		attachDao.deleteAll(no);
		noticeDao.delete(no);
		
		return true;
	}
	
	@Override
	public int selectLastNo() {
		// TODO Auto-generated method stub
		return noticeDao.selectLastNo();
	}

	@Override
	public List<NoticeAttachVO> getAttachList(int noticeNo) {
		// TODO Auto-generated method stub
		System.out.println("=============== get attach list by noticeNo = " + noticeNo);
		return attachDao.findByNoticeNo(noticeNo);
	}

}
