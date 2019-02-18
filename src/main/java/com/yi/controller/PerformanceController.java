package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/perf/*")
public class PerformanceController {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(PerformanceController.class);
	
	//공연정보 등록
	@RequestMapping(value = "addPerf", method = RequestMethod.GET)
	public void addPerf() {
		logger.info("=====> addPerf ----- GET");
	}
}
