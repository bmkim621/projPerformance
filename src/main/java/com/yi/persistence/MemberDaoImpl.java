package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.BookVO;
import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.SearchCriteria;

@Repository
public class MemberDaoImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	
	private static final String namespace = "com.yi.mapper.MemberMapper";
	
	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getTime");
	}

	//회원가입
	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertMember", vo);
	}

	@Override
	public MemberVO readMember(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".readMember", userid);
	}

	@Override
	public List<MemberVO> selectMemberAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectMemberAll");
	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateMember", vo);
	}

	@Override
	public void deleteMember(String memberCode) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteMember", memberCode);
	}

	@Override
	public MemberVO read(String userid, String userpw) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		
		return sqlSession.selectOne(namespace + ".read", map);
	}

	@Override
	public int idDuplicateChk(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".idDuplicateChk", userid);	//0: 사용가능  
	}

	@Override
	public List<BookVO> selectMyBookList(String memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectMyBookList", memberCode);
	}

	@Override
	public int getCountA(String memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getCountA", memberCode);
	}

	@Override
	public int getCountB(String memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getCountB", memberCode);
	}

	@Override
	public int getCountC(String memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getCountC", memberCode);
	}

	@Override
	public int getCountD(String memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getCountD", memberCode);
	}

	@Override
	public int getCountE(String memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getCountE", memberCode);
	}

	@Override
	public List<BookVO> selectBookListByYear(String year, String memberCode) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("memberCode", memberCode);
		
		return sqlSession.selectList(namespace + ".selectBookListByYear", map);
	}

	@Override
	public List<MemberVO> listCriteria(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".totalCount");
	}

	@Override
	public List<MemberVO> listSearch(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int searchTotalCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".searchTotalCount", cri);
	}

	@Override
	public void updateMemberGrade(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateMemberGrade", vo);
	}

	@Override
	public boolean checkPassword(String id, String password) {
		// TODO Auto-generated method stub
		boolean res = false;
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		
		int cnt = sqlSession.selectOne(namespace + ".checkPassword", map);
		if(cnt == 1) {
			res = true;
		}
		return res;
	}

}
