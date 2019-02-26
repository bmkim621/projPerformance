package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Criteria;
import com.yi.domain.ManagerVO;
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
	public ManagerVO selectManagerByCode(String managerCode) {
		// TODO Auto-generated method stub
		return noticeDao.selectManagerByCode(managerCode);
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

}
