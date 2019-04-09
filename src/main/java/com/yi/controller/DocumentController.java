package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/doc/*")
public class DocumentController {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	//예매안내
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public void docInfoGet() {
		logger.info("==========> docInfo GET ");   
	}
}
