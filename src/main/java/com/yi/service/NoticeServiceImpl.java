package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Criteria;
import com.yi.domain.NoticeVO;
import com.yi.domain.SearchCriteria;
import com.yi.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;

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
	public NoticeVO read(int no) {
		// TODO Auto-generated method stub
		return noticeDao.read(no);
	}

	@Override
	public void increaseViewCnt(int no) {
		// TODO Auto-generated method stub
		noticeDao.increaseViewCnt(no);
	}

	@Override
	public void register(NoticeVO vo) {
		// TODO Auto-generated method stub
		noticeDao.register(vo);
	}

}
