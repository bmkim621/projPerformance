package com.yi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.PerformanceVO;
import com.yi.service.BookService;

@Controller
@RequestMapping("/book/*")
public class BookController {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	//서비스
	@Autowired
	private BookService service;
	
	//이름으로 공연정보 가지고 오기
	@RequestMapping(value = "StepOne", method = RequestMethod.GET)
	public void stepOneGet(String showName, Model model) {
		logger.info("=====> Book StepOne : GET");
		
		List<PerformanceVO> list = service.selectListByShowName(showName);
		
		model.addAttribute("list", list);
	}
}
