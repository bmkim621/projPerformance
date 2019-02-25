package com.yi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.NoticeVO;
import com.yi.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	//서비스
	@Autowired
	private NoticeService service;

	//공지사항 리스트
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Model model) {
		logger.info("=====> List ----- GET");
		
		List<NoticeVO> list = service.noticeListAll();
			
		model.addAttribute("list", list);
	}
}
