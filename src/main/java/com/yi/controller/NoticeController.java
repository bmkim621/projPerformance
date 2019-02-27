package com.yi.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yi.domain.NoticeVO;
import com.yi.domain.PageMaker;
import com.yi.domain.SearchCriteria;
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
	public void list(SearchCriteria cri, Model model) {
		logger.info("=====> List ----- GET");
		
		// is_notice = 1
		List<NoticeVO> noticeList = service.listWithIsNotice();
		logTest("noticeList", noticeList);
		int cnt = cri.getPerPageNum();
		
		cri.setPerPageNum(cnt - noticeList.size());
		
		//검색
		List<NoticeVO> list = service.listSearch(cri);	//is_notice가 0인 것
		logTest("list", list);
		// 1. noticeList.add(list)
		noticeList.addAll(list);
		
		logTest("total noticeList", noticeList);
		
		
		//페이지
		PageMaker pageMaker = new PageMaker();
//		cri.setPerPageNum(10);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchTotalCount(cri));
			
		logger.info("list = " + list.size());
		logger.info("page = " + pageMaker.getCri().getPage());
		logger.info("cri = " + cri);
		logger.info("noticeList = " + noticeList);
		logger.info("noticeList size = " + noticeList.size());    
		
		model.addAttribute("list", noticeList);
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);
	}

	private void logTest(String title, List<NoticeVO> noticeList) {
		logger.info(title + " ======> " + title);
		
		for(NoticeVO v : noticeList) {
			logger.info("v ======> " + v);	
		}
	}
	
	//글 읽기
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void read(@RequestParam("no") int no, SearchCriteria cri, Model model) {
		logger.info("=====> Read ----- GET");
		
		NoticeVO vo = service.read(no);
		//조회수 1 증가 시키기
		service.increaseViewCnt(no);
		
		logger.info("noticeVO = " + vo);
		logger.info("cri = " + cri);
		logger.info("page = " + cri.getPage());
		 
		model.addAttribute("noticeVO", vo);
		model.addAttribute("cri", cri);
	}
	
	//글 쓰기
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerGet() {
		logger.info("=====> Register ----- GET");
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public void registerPost(HttpServletRequest request) {
		logger.info("에디터 컨텐츠 값 = " + request.getParameter("ir1"));
		
	}
}
