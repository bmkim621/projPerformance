package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.ReviewAttachVO;

@Repository
public class ReviewAttachDaoImpl implements ReviewAttachDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.ReviewAttachMapper";

	@Override
	public void insert(ReviewAttachVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(String uuid) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", uuid);
	}

	@Override
	public List<ReviewAttachVO> findByReviewNo(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".findByReviewNo", reviewNo);
	}

	@Override
	public void deleteAll(int reviewNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteAll", reviewNo);
	}

	@Override
	public List<ReviewAttachVO> getOldFiles() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getOldFiles");
	}

}
