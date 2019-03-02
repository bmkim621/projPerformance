package com.yi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yi.domain.LoginDTO;
import com.yi.domain.ReviewVO;
import com.yi.interceptor.LoginInterceptor;
import com.yi.service.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService service;
	
	//쓰기
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerGet(HttpSession session, Model model) {
		logger.info("=====> Review Register ----- GET");
		
		//로그인한 사용자의 정보 가져오기 -> 여기에 이름을 작성자로
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		logger.info("info = " + info);
		
		model.addAttribute("info", info);
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerPost(HttpServletRequest request, ReviewVO vo, Model model, RedirectAttributes rttr) {
		logger.info("에디터 컨텐츠 값 = " + request.getParameter("reviewContent"));
		logger.info("=====> Review Register ----- POST");
		
		//파일 넘어왔는지 확인
		logger.info("=========================");
		logger.info("공연관람후기 글 등록하기 ReviewVO : " + vo);
		
		//첨부파일 있을 경우
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> logger.info("attach = " + attach));
		}
		logger.info("=========================");
		
		//글쓰기
		service.register(vo);
		
		return "redirect:/notice/list";
	}
}
