package com.yi.persistence;

import java.util.List;

import com.yi.domain.FacilitiesVO;
import com.yi.domain.PerformanceVO;

public interface PerformanceDAO {

	//공연정보 추가하기
	public void insertPerf(PerformanceVO vo);
	
	//모든 공연정보 보기
	public List<PerformanceVO> perfListAll();
	
	//공연정보 수정하기
	public void modifyPerf(PerformanceVO vo);
	
	// ===== 시설 정보 보기 : facilities 테이블 =====
	public List<FacilitiesVO> facilitiesList();
	
}
