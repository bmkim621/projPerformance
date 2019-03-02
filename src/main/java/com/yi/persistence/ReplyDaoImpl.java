package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Criteria;
import com.yi.domain.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.ReplyMapper";

	@Override
	public List<ReplyVO> list(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".list", reviewNo);
	}

	@Override
	public void create(ReplyVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int replyNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", replyNo);
	}

	@Override
	public List<ReplyVO> listPage(Criteria cri, int reviewNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("reviewNo", reviewNo);
		map.put("cri", cri);
		
		return sqlSession.selectList(namespace + ".listPage", map);
	}

	@Override
	public int totalCount(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".totalCount", reviewNo);
	}

	@Override
	public ReplyVO selectByReviewNo(int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectByReviewNo", replyNo);
	}

}
