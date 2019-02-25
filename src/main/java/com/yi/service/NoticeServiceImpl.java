package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.ManagerVO;
import com.yi.domain.NoticeVO;
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

}
