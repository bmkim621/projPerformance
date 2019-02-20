package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.FacilitiesVO;
import com.yi.domain.PerformanceVO;
import com.yi.persistence.PerformanceDAO;

@Service
public class PerformanceServiceImpl implements PerformanceService {
	@Autowired
	private PerformanceDAO perfDao;

	//시설 정보 모두 보기
	@Override
	public List<FacilitiesVO> facilitiesList() {
		// TODO Auto-generated method stub
		return perfDao.facilitiesList();
	}

	@Override
	public void insertPerf(PerformanceVO vo) {
		// TODO Auto-generated method stub
		perfDao.insertPerf(vo);
	}
	
	
	
}
