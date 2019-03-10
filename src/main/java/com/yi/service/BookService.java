package com.yi.service;

import java.util.List;
import java.util.Map;

import com.yi.domain.BookVO;
import com.yi.domain.MemberVO;
import com.yi.domain.PerformanceVO;
import com.yi.domain.ResvSeatVO;
import com.yi.domain.SeatVO;

public interface BookService {
	//공연 이름으로 공연정보 보기
	public PerformanceVO perfListAllByShowName(String showName);
	
	//공연이름으로 공연정보 가져오기
	public List<PerformanceVO> selectListByShowName(String showName);
	
	//검색
	public List<PerformanceVO> searchPerformance(Map<String, Object> map);
	
	//아이디 검색해서 회원 정보 가지고 오기
	public MemberVO readMember(String userid);
	
	//공연코드, 좌석분류코드로 좌석관련 정보 받아오기..
	public List<SeatVO> getSeatInfo(String locCode);
	
	//예약좌석
	public ResvSeatVO getResvSeat(String resvZone, int resvNum);
	
	//예약완료된 좌석
	public List<BookVO> getFinishResvSeat(String showCode);
}
