package com.yi.projPerformance;

import java.util.List;

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
		List<PerformanceVO> list = dao.selectListByShowName("뮤지컬 시카고");
		System.out.println(list);
	}
}
   