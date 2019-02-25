package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.ManagerVO;
import com.yi.domain.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.yi.mapper.NoticeMapper";

	@Override
	public List<NoticeVO> noticeListAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".noticeListAll"); 
	}

	@Override
	public ManagerVO selectManagerByCode(String managerCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectManagerByCode", managerCode);
	}

}
