package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Criteria;
import com.yi.domain.ReviewAttachVO;
import com.yi.domain.ReviewVO;
import com.yi.domain.SearchCriteria;
import com.yi.persistence.ReviewAttachDAO;
import com.yi.persistence.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private ReviewAttachDAO attachDao;
	
	@Override
	public List<ReviewVO> reviewListAll() {
		// TODO Auto-generated method stub
		return reviewDao.reviewListAll();
	}

	@Override
	@Transactional
	public void register(ReviewVO vo) {
		// TODO Auto-generated method stub
		reviewDao.register(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		List<ReviewAttachVO> list = vo.getAttachList();
		for(ReviewAttachVO attachVO : list) {
			int lastNo = reviewDao.selectLastNo();
			attachVO.setReviewNo(lastNo);
			
			attachDao.insert(attachVO);
		}
	}

	@Override
	@Transactional
	public boolean update(ReviewVO vo) {
		// TODO Auto-generated method stub
		System.out.println("=============== modify ReviewVO = " + vo);
		
		//기존 첨부파일 삭제
		attachDao.deleteAll(vo.getReviewNo());
		//수정 결과를 판단하는 변수
		boolean modifyResult = reviewDao.update(vo);	//DAO에서 수정되면 true 반환
		if(modifyResult && vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach -> {
				attach.setReviewNo(vo.getReviewNo());
				attachDao.insert(attach);
			});
		}
		return modifyResult;
	}

	@Override
	@Transactional
	public boolean delete(int no) {
		// TODO Auto-generated method stub
		attachDao.deleteAll(no);
		reviewDao.delete(no);
		
		return true;
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED)
	public ReviewVO read(int no) {
		// TODO Auto-generated method stub
		return reviewDao.read(no);
	}

	@Override
	public int selectLastNo() {
		// TODO Auto-generated method stub
		return reviewDao.selectLastNo();
	}

	@Override
	public List<ReviewAttachVO> getAttachList(int reviewNo) {
		// TODO Auto-generated method stub
		return attachDao.findByReviewNo(reviewNo);
	}

	@Override
	public void increaseReviewViewCnt(int no) {
		// TODO Auto-generated method stub
		reviewDao.increaseReviewViewCnt(no);
	}

	@Override
	public List<ReviewVO> listCriteria(Criteria cri) {
		// TODO Auto-generated method stub
		return reviewDao.listCriteria(cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return reviewDao.totalCount();
	}

	@Override
	public List<ReviewVO> listSearch(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return reviewDao.listSearch(cri);
	}

	@Override
	public int searchTotalCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return reviewDao.searchTotalCount(cri);
	}

}
