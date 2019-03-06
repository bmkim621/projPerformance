package com.yi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.PerformanceVO;
import com.yi.persistence.BookDAO;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO dao;

	@Override
	public PerformanceVO perfListAllByShowName(String showName) {
		// TODO Auto-generated method stub    
		return dao.perfListAllByShowName(showName);
	}

	@Override
	public List<PerformanceVO> selectListByShowName(String showName) {
		// TODO Auto-generated method stub
		return dao.selectListByShowName(showName);
	}

	@Override
	public List<PerformanceVO> searchPerformance(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.searchPerformance(map);
	}


}
