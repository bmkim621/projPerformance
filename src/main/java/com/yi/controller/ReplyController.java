package com.yi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yi.domain.Criteria;
import com.yi.domain.LoginDTO;
import com.yi.domain.PageMaker;
import com.yi.domain.ReplyVO;
import com.yi.domain.ReviewVO;
import com.yi.interceptor.LoginInterceptor;
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
	public ResponseEntity<String> register( @RequestBody ReplyVO vo, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		logger.info("===== Reply Create ===== " + vo);
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		vo.setReplyerId(info.getUserid());
		
		try {	
			service.create(vo);
			logger.info("ReplyVO ============> " + vo);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);	//성공 시 success와 함께 OK 보냄.
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);	//실패 시 에러 원인과 400 에러를 같이 보냄.
		}	
		return entity;
	}
	
	
	//댓글 보기
	@RequestMapping(value = "/all/{reviewNo}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("reviewNo") int reviewNo){
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try {
			//댓글 리스트 가지고 오기
			List<ReplyVO> list = service.list(reviewNo);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//페이지
	@RequestMapping(value = "/{reviewNo}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("reviewNo") int reviewNo, @PathVariable("page") int page){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			//페이지 당 댓글 몇 개 나오게 하는지 결정
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			List<ReplyVO> list = service.listPage(cri, reviewNo);
			
			//페이지 정보
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			//댓글 총 개수
			int count = service.totalCount(reviewNo);
			pageMaker.setTotalCount(count);
			
			//댓글 수
			ReviewVO vo = reviewService.read(reviewNo);
			System.out.println("======> ReviewVO replycnt : " + vo.getReplycnt());
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			map.put("replycnt", vo.getReplycnt());
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
	//댓글 수정
	//put => post와 마찬가지로 body로 보내짐. 수정되는 내용이 ReplyVO에 있으니까 @RequestBody 앞에 붙여야 함.
	@RequestMapping(value = "{replyNo}", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("replyNo") int replyNo, @RequestBody ReplyVO vo){
		
		System.out.println("======> modify Reply : PUT");
		
		ResponseEntity<String> entity = null;
			
		try {
			logger.info("replyNo = " + replyNo);
			vo.setReplyNo(replyNo);
			service.update(vo);
				
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
				// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
			
		return entity;
	}
	
	
	// 댓글 삭제
	// get, delete => 주소줄에 실어서 보냄.
	@RequestMapping(value = "{replyNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("replyNo") int replyNo) {

		ResponseEntity<String> entity = null;

		try {
			service.delete(replyNo);
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}
