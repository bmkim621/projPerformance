package com.yi.service;

import java.util.List;

import com.yi.domain.PerformanceVO;

public interface BookService {
	//공연 이름으로 공연정보 보기
	public PerformanceVO perfListAllByShowName(String showName);
	
	//공연이름으로 공연정보 가져오기
	public List<PerformanceVO> selectListByShowName(String showName);
}
