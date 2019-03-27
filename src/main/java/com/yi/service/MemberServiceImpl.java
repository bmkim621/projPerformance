package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.BookVO;
import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.SearchCriteria;
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
		memDao.insertMember(vo);	//tbl_member 테이블에 회원 추가

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
	public void deleteMember(String memberCode) {
		// TODO Auto-generated method stub
		memDao.deleteMember(memberCode);
	}

	@Override
	public MemberVO read(String userid, String userpw) {
		// TODO Auto-generated method stub
		return memDao.read(userid, userpw);
	}

	@Override  
	public int idDuplicateChk(String userid) {
		// TODO Auto-generated method stub
		return memDao.idDuplicateChk(userid);
	}

	@Override
	public List<BookVO> selectMyBookList(String memberCode) {
		// TODO Auto-generated method stub
		return memDao.selectMyBookList(memberCode);
	}

	@Override
	public int getCountA(String memberCode) {
		// TODO Auto-generated method stub
		return memDao.getCountA(memberCode);
	}

	@Override
	public int getCountB(String memberCode) {
		// TODO Auto-generated method stub
		return memDao.getCountB(memberCode);
	}

	@Override
	public int getCountC(String memberCode) {
		// TODO Auto-generated method stub
		return memDao.getCountC(memberCode);
	}

	@Override
	public int getCountD(String memberCode) {
		// TODO Auto-generated method stub
		return memDao.getCountD(memberCode);
	}

	@Override
	public int getCountE(String memberCode) {
		// TODO Auto-generated method stub
		return memDao.getCountE(memberCode);
	}

	@Override
	public List<BookVO> selectBookListByYear(String year, String memberCode) {
		// TODO Auto-generated method stub
		return memDao.selectBookListByYear(year, memberCode);
	}

	@Override
	public List<MemberVO> listCriteria(Criteria cri) {
		// TODO Auto-generated method stub
		return memDao.listCriteria(cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return memDao.totalCount();
	}

	@Override
	public List<MemberVO> listSearch(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return memDao.listSearch(cri);
	}

	@Override
	public int searchTotalCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return memDao.searchTotalCount(cri);
	}

	@Override
	public void updateMemberGrade(MemberVO vo) {
		// TODO Auto-generated method stub
		memDao.updateMemberGrade(vo);
	}

	@Override
	public boolean checkPassword(String id, String password) {
		// TODO Auto-generated method stub
		return memDao.checkPassword(id, password);
	}

}
