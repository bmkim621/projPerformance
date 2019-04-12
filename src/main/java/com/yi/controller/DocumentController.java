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
	
	//할인안내
	@RequestMapping(value = "discount", method = RequestMethod.GET)
	public void discountGet() {
		logger.info("==========> discount GET ");   
	}
	
	//할인안내
	@RequestMapping(value = "refund", method = RequestMethod.GET)
	public void refundGet() {
		logger.info("==========> refund GET ");   
	}
	
	//시설안내
	@RequestMapping(value = "facilities", method = RequestMethod.GET)
	public void facilitiesGet() {
		logger.info("==========> facilities GET ");          
	}
	
	//대관안내
	@RequestMapping(value = "rent", method = RequestMethod.GET)
	public void rentGet() {
		logger.info("==========> rent GET ");          
	}
	
	//갤러리
	@RequestMapping(value = "gallery", method = RequestMethod.GET)
	public void galleryGet() {
		logger.info("==========> gallery GET ");                  
	}
	
	//오시는 길
	@RequestMapping(value = "map", method = RequestMethod.GET)
	public void mapGet() {
		logger.info("==========> map GET ");                    
	}
}
