package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.NoticeVO;
import com.yi.domain.SearchCriteria;

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
	public List<NoticeVO> listCriteria(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".totalCount");
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int searchTotalCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".searchTotalCount", cri);
	}

	@Override
	public List<NoticeVO> listWithIsNotice() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listWithIsNotice");
	}

	@Override
	public NoticeVO read(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".read", no);
	}

	@Override
	public void increaseViewCnt(int no) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".increaseViewCnt", no);
	}

	@Override
	public void register(NoticeVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".register", vo);
	}

	@Override
	public List<MemberVO> getWriter(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getWriter", id);
	}

	
	// ================ 첨부파일 ====================
	@Override
	public void addAttach(String fullname) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".addAttach", fullname);
	}

	@Override
	public List<String> getAttach(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getAttach", no);
	}

	@Override
	public void delAttach(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delAttach", no);
	}

	@Override
	public void deleteAttachByFullName(int no, String fullname) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("fullname", fullname);
		
		sqlSession.delete(namespace + ".deleteAttachByFullName", map);
	}

	@Override
	public void addAttachByNo(String fullname, int no) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("fullname", fullname);
		map.put("no", no);
		
		sqlSession.insert(namespace + ".addAttachByNo", map);
	}

	@Override
	public void update(NoticeVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", no);
	}

}
