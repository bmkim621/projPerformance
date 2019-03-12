package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.BookVO;
import com.yi.domain.DiscountVO;
import com.yi.domain.MemberVO;
import com.yi.domain.PerformanceVO;
import com.yi.domain.ResvSeatVO;
import com.yi.domain.SeatVO;

@Repository
public class BookDaoImpl implements BookDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.yi.mapper.BookMapper";
	
	@Override
	public PerformanceVO perfListAllByShowName(String showName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".perfListAllByShowName", showName);      
	}

	@Override
	public List<PerformanceVO> selectListByShowName(String showName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectListByShowName", showName);
	}

	@Override
	public List<PerformanceVO> searchPerformance(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".searchPerformance", map);
	}

	@Override
	public MemberVO readMember(String userid) {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne(namespace + ".readMember", userid);
	}

	@Override
	public List<SeatVO> getSeatInfo(String locCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getSeatInfo", locCode);  
	}

	@Override
	public ResvSeatVO getResvSeat(String resvZone, int resvNum) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("resvZone", resvZone);
		map.put("resvNum", resvNum);
		
		return sqlSession.selectOne(namespace + ".getResvSeat", map);
	}

	@Override
	public List<BookVO> getFinishResvSeat(String showCode) {
		// TODO Auto-generated method stub
	/*	Map<String, Object> map = new HashMap<>();
		map.put("showCode", showCode);
		map.put("bookZone", bookZone);
		map.put("bookNum", bookNum);*/
		
		return sqlSession.selectList(namespace + ".getFinishResvSeat", showCode);
	}

	@Override
	public void insertTempSeat(String selectShowCode, String selectSeatZone, String selectSeatNum) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("selectShowCode", selectShowCode);
		map.put("selectSeatZone", selectSeatZone);
		map.put("selectSeatNum", selectSeatNum);
		
		sqlSession.insert(namespace + ".insertTempSeat", map);  
	}

	@Override
	public int getTempResvSeat(String selectShowCode, String selectSeatZone, String selectSeatNum) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("selectShowCode", selectShowCode);
		map.put("selectSeatZone", selectSeatZone);
		map.put("selectSeatNum", selectSeatNum);
		
		return sqlSession.selectOne(namespace + ".getTempResvSeat", map);
	}

	@Override
	public void delTempResvSeat(String selectShowCode, String selectSeatZone, String selectSeatNum) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("selectShowCode", selectShowCode);
		map.put("selectSeatZone", selectSeatZone);
		map.put("selectSeatNum", selectSeatNum);
		
		sqlSession.delete(namespace + ".delTempResvSeat", map);   
	}

	@Override
	public void delAllTempResvSeat() {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delAllTempResvSeat");
	}

	@Override
	public PerformanceVO selectListByShowCode(String showCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectListByShowCode", showCode);
	}

	@Override
	public List<DiscountVO> selectDiscountAll() {
		// TODO Auto-generated method stub  
		return sqlSession.selectList(namespace + ".selectDiscountAll");
	}


  
	

}
