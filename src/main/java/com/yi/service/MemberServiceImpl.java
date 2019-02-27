package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.MemberVO;
import com.yi.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memDao;
	
	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return memDao.getTime();
	}

	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		memDao.insertMember(vo);
	}

	@Override
	public MemberVO readMember(String userid) {
		// TODO Auto-generated method stub
		return memDao.readMember(userid);
	}

	@Override
	public List<MemberVO> selectMemberAll() {
		// TODO Auto-generated method stub
		return memDao.selectMemberAll();
	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		memDao.updateMember(vo);
	}

	@Override
	public void deleteMember(String userid) {
		// TODO Auto-generated method stub
		memDao.deleteMember(userid);
	}

	@Override
	public MemberVO read(String userid, String userpw) {
		// TODO Auto-generated method stub
		return memDao.read(userid, userpw);
	}

}
