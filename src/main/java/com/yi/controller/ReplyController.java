package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yi.domain.ReplyVO;
import com.yi.service.ReplyService;
import com.yi.service.ReviewService;

//RestController : 값만 주고받음
@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	//로그로 확인하기
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	//서비스
	@Autowired
	private ReplyService service;
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	//@RequestBody : RestController에서 post로 받기 위해서는 @RequestBody가 필요함.
	//get은 주소창에 ?키=값으로 보냄(매개변수 실어서 보낸다), post는 body에 값이 실림. 그러므로 body가 있다는 @RequestBody가 필요함.(rest에서 post에서만!)
	public ResponseEntity<String> register( @RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		
		logger.info("===== Reply Create ===== " + vo);
		
		try {
			service.create(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);	//성공 시 success와 함께 OK 보냄.
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);	//실패 시 에러 원인과 400 에러를 같이 보냄.
		}	
		return entity;
	}

}
