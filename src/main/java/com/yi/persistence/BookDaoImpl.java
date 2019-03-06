package com.yi.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.PerformanceVO;

@Repository
public class BookDaoImpl implements BookDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.yi.mapper.BookMapper";
	
	@Override
	public PerformanceVO perfListAllByShowName(String showName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".perfListAllByShowName", showName);      
	}

	@Override
	public List<PerformanceVO> selectListByShowName(String showName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectListByShowName", showName);
	}

	@Override
	public List<PerformanceVO> searchPerformance(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
  
	

}
