package com.yi.controller;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yi.domain.PerformanceVO;
import com.yi.service.PerformanceService;

@RestController
@RequestMapping("search")      
public class SearchPerformanceController {
	//로그로 확인하기
	private static final Logger logger = LoggerFactory.getLogger(SearchPerformanceController.class);
	
	@Autowired
	private PerformanceService service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<PerformanceVO>> search(int sYear, int sMonth, String category){
		ResponseEntity<List<PerformanceVO>> entity = null;
		
		logger.info("===== search =====");
		logger.info("sYear = " + sYear);
		logger.info("sMonth = " + sMonth);
		logger.info("category = " + category);
		
		try {
			List<PerformanceVO> result = new ArrayList<>();
			
			GregorianCalendar s = new GregorianCalendar(sYear, sMonth - 1, 1);
			GregorianCalendar e = new GregorianCalendar(sYear, sMonth - 1, 31);
			
			Map<String, Object> map = new HashMap<>();
			map.put("sYear", s.getTime());			  
			map.put("eYear", e.getTime());
  
			
			if(category != "") {
				map.put("category", category);
			}
			
			List<PerformanceVO> list = service.selectPerformanceByCondition(map); 
			
			//공연이름, 이름에 해당하는 PerformanceVO를 담는 map
			Set<String> showNames = new HashSet<>();
			
			for(PerformanceVO vo : list) {
				showNames.add(vo.getShowName());
			}
			
			for(String sName : showNames) {
				PerformanceVO pvo = service.perfListAllByShowName(sName);
				result.add(pvo);
				
			}

			entity = new ResponseEntity<List<PerformanceVO>>(result, HttpStatus.OK);
						
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
			
		
		
		return entity;
	}
}
