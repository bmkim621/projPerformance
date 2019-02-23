package com.yi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.FacilitiesVO;
import com.yi.domain.PerformanceVO;
import com.yi.domain.SearchCriteria;
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

	//모든 공연 리스트 보기
	@Override
	public List<PerformanceVO> perfListAll() {
		// TODO Auto-generated method stub
		return perfDao.perfListAll();
	}

	@Override
	public PerformanceVO perfListAllByShowName(String showName) {
		// TODO Auto-generated method stub
		return perfDao.perfListAllByShowName(showName);
	}

	@Override
	public List<PerformanceVO> selectPerformanceByCondition(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return perfDao.selectPerformanceByCondition(map);
	}

	
	
	
	
}
