package com.yi.service;

import java.util.List;
import java.util.Map;

import com.yi.domain.FacilitiesVO;
import com.yi.domain.PerformanceVO;

public interface PerformanceService {

	//시설 모두 보기
	public List<FacilitiesVO> facilitiesList();
	
	//공연정보 추가하기
	public void insertPerf(PerformanceVO vo);
	
	//모든 공연정보 보기
	public List<PerformanceVO> perfListAll();
	
	//공연 이름으로 공연정보 보기
	public PerformanceVO perfListAllByShowName(String showName);
	
	//
	List<PerformanceVO> selectPerformanceByCondition(Map<String, Object> map);
}
