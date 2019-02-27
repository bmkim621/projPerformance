package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.MemberVO;

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
	public void deleteMember(String userid) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteMember", userid);
	}

	@Override
	public MemberVO read(String userid, String userpw) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		
		return sqlSession.selectOne(namespace + ".read", map);
	}

}
