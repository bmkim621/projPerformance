package com.yi.projPerformance;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.PerformanceVO;
import com.yi.persistence.BookDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BookDaoTest {
	@Autowired
	private BookDAO dao;
	
	@Test
	public void test01selectListByShowName() {
		List<PerformanceVO> list = dao.selectListByShowName("영아티스트 오페라 <사랑의 묘약>");
		System.out.println(list);
		PerformanceVO v = new PerformanceVO();
		v.setShowCode("P19008");
		int index = list.indexOf(v);
		System.out.println(index);
	}
	
}
   