package com.yi.projPerformance;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.FacilitiesVO;
import com.yi.domain.PerformanceVO;
import com.yi.persistence.PerformanceDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PerformanceDaoTest {
	@Autowired
	private PerformanceDAO dao;
	
	//공연정보 추가하기
	//@Test
	public void insertPerf() {
		PerformanceVO vo = new PerformanceVO();
		vo.setShowName("가족오페라 <헨젤과 그레텔>");
		vo.setShowType("A");
		vo.setShowStartdate(new Date());
		vo.setShowEnddate(new Date());
		FacilitiesVO fvo = new FacilitiesVO();
		fvo.setFacilitiesNo(1);
		vo.setFacilitiesNo(fvo);
		dao.insertPerf(vo);
	}
	
	//공연정보 보기
	//@Test
	public void selectPerf() {
		List<PerformanceVO> list = dao.perfListAll();
		
		System.out.println( list.get(0).getShowCode() + "========> " + list.get(0).getFacilitiesNo());
		System.out.println(list);
		
	}
	
	//시설정보 보기
	@Test
	public void selectFacilites() {
		List<FacilitiesVO> list = dao.facilitiesList();
		System.out.println(list);
	}
}
