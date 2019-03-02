package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.NoticeAttachVO;

@Repository
public class NoticeAttachDaoImpl implements NoticeAttachDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.yi.mapper.NoticeAttachMapper";

	@Override
	public void insert(NoticeAttachVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(String uuid) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", uuid);
	}

	@Override
	public List<NoticeAttachVO> findByNoticeNo(int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".findByNoticeNo", noticeNo); 
	}

	@Override
	public void deleteAll(int noticeNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteAll", noticeNo);
	}

	@Override
	public List<NoticeAttachVO> getOldFiles() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getOldFiles"); 
	}

}
