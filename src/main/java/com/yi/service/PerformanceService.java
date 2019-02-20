package com.yi.service;

import java.util.List;

import com.yi.domain.FacilitiesVO;
import com.yi.domain.PerformanceVO;

public interface PerformanceService {

	//시설 모두 보기
	public List<FacilitiesVO> facilitiesList();
	
	//공연정보 추가하기
	public void insertPerf(PerformanceVO vo);
}
