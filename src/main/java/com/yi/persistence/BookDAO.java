package com.yi.persistence;

import java.util.List;

import com.yi.domain.PerformanceVO;

public interface BookDAO {
	//공연이름으로 공연정보 가져오기
	public List<PerformanceVO> selectListByShowName(String showName);
}
