package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.ReviewAttachVO;
import com.yi.domain.ReviewVO;
import com.yi.domain.SearchCriteria;

@Repository
public class ReviewDaoImpl implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.ReviewMapper";

	@Override
	public List<ReviewVO> reviewListAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".reviewListAll");
	}

	@Override
	public void register(ReviewVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".register", vo);
	}

	@Override
	public boolean update(ReviewVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".update", vo);
		return true;
	}

	@Override
	public void delete(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", no);
	}

	@Override
	public ReviewVO read(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".read", no);
	}

	@Override
	public int selectLastNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectLastNo");
	}

	@Override
	public List<ReviewAttachVO> getAttachList(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getAttachList", reviewNo);
	}

	@Override
	public void increaseReviewViewCnt(int no) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".increaseReviewViewCnt", no);
	}

	@Override
	public List<ReviewVO> listCriteria(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".totalCount");
	}

	@Override
	public List<ReviewVO> listSearch(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int searchTotalCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".searchTotalCount", cri);
	}

	@Override
	public void updateReplyCnt(int reviewNo, int amount) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("reviewNo", reviewNo);
		map.put("amount", amount);
		
		sqlSession.update(namespace + ".updateReplyCnt", map);
	}

	@Override
	public List<MemberVO> getWriter(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getWriter", id);
	}

	@Override
	public MemberVO getMemberId(String memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getMemberId", memberCode);
	}



}
