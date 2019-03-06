package com.yi.persistence;

import java.util.List;
import java.util.Map;

import com.yi.domain.PerformanceVO;

public interface BookDAO {
	//공연 이름으로 공연정보 보기
	public PerformanceVO perfListAllByShowName(String showName);
	
	//공연이름으로 공연정보 가져오기
	public List<PerformanceVO> selectListByShowName(String showName);
	
	//검색
	public List<PerformanceVO> searchPerformance(Map<String, Object> map);
}
