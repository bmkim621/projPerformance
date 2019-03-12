package com.yi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.BookVO;
import com.yi.domain.DiscountVO;
import com.yi.domain.MemberVO;
import com.yi.domain.PerformanceVO;
import com.yi.domain.ResvSeatVO;
import com.yi.domain.SeatVO;
import com.yi.persistence.BookDAO;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO dao;

	@Override
	public PerformanceVO perfListAllByShowName(String showName) {
		// TODO Auto-generated method stub    
		return dao.perfListAllByShowName(showName);
	}

	@Override
	public List<PerformanceVO> selectListByShowName(String showName) {
		// TODO Auto-generated method stub
		return dao.selectListByShowName(showName);
	}

	@Override
	public List<PerformanceVO> searchPerformance(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.searchPerformance(map);
	}

	@Override
	public MemberVO readMember(String userid) {
		// TODO Auto-generated method stub
		return dao.readMember(userid);
	}

	@Override
	public List<SeatVO> getSeatInfo(String locCode) {
		// TODO Auto-generated method stub
		return dao.getSeatInfo(locCode);    
	}

	@Override
	public ResvSeatVO getResvSeat(String resvZone, int resvNum) {
		// TODO Auto-generated method stub
		return dao.getResvSeat(resvZone, resvNum);
	}

	@Override
	public List<BookVO> getFinishResvSeat(String showCode) {
		// TODO Auto-generated method stub
		return dao.getFinishResvSeat(showCode);
	}

	@Override  
	public void insertTempSeat(String selectShowCode, String selectSeatZone, String selectSeatNum) {
		// TODO Auto-generated method stub
		dao.insertTempSeat(selectShowCode, selectSeatZone, selectSeatNum);
	}

	@Override
	public int getTempResvSeat(String selectShowCode, String selectSeatZone, String selectSeatNum) {
		// TODO Auto-generated method stub
		return dao.getTempResvSeat(selectShowCode, selectSeatZone, selectSeatNum);  
	}

	@Override
	public void delTempResvSeat(String selectShowCode, String selectSeatZone, String selectSeatNum) {
		// TODO Auto-generated method stub
		dao.delTempResvSeat(selectShowCode, selectSeatZone, selectSeatNum);
	}

	@Override
	public void delAllTempResvSeat() {
		// TODO Auto-generated method stub
		dao.delAllTempResvSeat();
	}

	@Override
	public PerformanceVO selectListByShowCode(String showCode) {
		// TODO Auto-generated method stub
		return dao.selectListByShowCode(showCode);
	}

	@Override  
	public List<DiscountVO> selectDiscountAll() {
		// TODO Auto-generated method stub
		return dao.selectDiscountAll();
	}


}
