package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.FacilitiesVO;
import com.yi.domain.PerformanceVO;

@Repository
public class PerformanceDaoImpl implements PerformanceDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.yi.mapper.PerformanceMapper";

	@Override
	public void insertPerf(PerformanceVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertPerf", vo);
	}

	@Override
	public List<PerformanceVO> perfListAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".perfListAll");  
	}

	@Override
	public void modifyPerf(PerformanceVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".modifyPerf", vo);
	}

	@Override
	public List<FacilitiesVO> facilitiesList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".facilitiesList");
	}

}
