package com.yi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yi.domain.FacilitiesVO;
import com.yi.service.PerformanceService;

@RestController
@RequestMapping("/facilities/*")
public class FacilitiesController {
	//로그로 확인하기
	private static final Logger logger = LoggerFactory.getLogger(FacilitiesController.class);
	
	//서비스 주입받기
	@Autowired
	private PerformanceService service;
	
	//시설정보 보기
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ResponseEntity<List<FacilitiesVO>> list(){
		
		ResponseEntity<List<FacilitiesVO>> entity = null;
		
		logger.info("===== Facilities List ===== ");
		
		try {
			List<FacilitiesVO> list = service.facilitiesList();
			//리스트 가져와서 실어서 보내기
			entity = new ResponseEntity<>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
}
