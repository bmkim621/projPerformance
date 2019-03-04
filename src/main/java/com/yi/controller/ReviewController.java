package com.yi.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yi.domain.LoginDTO;
import com.yi.domain.MemberVO;
import com.yi.domain.NoticeAttachVO;
import com.yi.domain.PageMaker;
import com.yi.domain.ReviewAttachVO;
import com.yi.domain.ReviewVO;
import com.yi.domain.SearchCriteria;
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
		
		List<MemberVO> list = service.getWriter(info.getUserid());
		logger.info("list = " + list);
		
		model.addAttribute("list", list);
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
		
		return "redirect:/review/list";
	}
	
	//리스트
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(SearchCriteria cri, Model model) {
		logger.info("=====> Review List ----- GET");
		
		//검색
		List<ReviewVO> list = service.listSearch(cri);
		
		// 페이지 하단 부분
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchTotalCount(cri)); // totalCount어디에서? mapper에서 처리해야함.

		logger.info("list = " + list);
		logger.info("page = " + pageMaker.getCri().getPage());
		logger.info("cri = " + cri);
				
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}
	
	
	//읽기
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void read(@RequestParam("no") int no, SearchCriteria cri, Model model) {
		logger.info("=====> Review Read ----- GET");
		
		ReviewVO vo = service.read(no);
		//조회수
		service.increaseReviewViewCnt(no);
		//회원코드에 해당하는 회원정보 가지고 오기
		MemberVO user = service.getMemberId(vo.getMemberCode());
		
		logger.info("reviewVO = " + vo);
		logger.info("cri = " + cri);
		logger.info("page = " + cri.getPage());
		
		model.addAttribute("reviewVO", vo);
		model.addAttribute("cri", cri);
		model.addAttribute("user", user);
	}
	
	//첨부파일 보기
	@ResponseBody
	@RequestMapping(value = "getReviewAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ReviewAttachVO>> getReviewAttachList(int reviewNo){
		logger.info("=====> getReviewAttachList : " + reviewNo);
				
		return new ResponseEntity<>(service.getAttachList(reviewNo), HttpStatus.OK);
	}
	
	//파일 삭제 처리
	private void deleteFiles(List<ReviewAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		logger.info("delete attach files...............");
		logger.info("attachList = " + attachList);
		
		attachList.forEach(attach -> {
			
			try {
				Path file = Paths.get("C:\\proj_performance\\" + attach.getReviewUploadPath() + "\\" + attach.getReviewUuid() + "_" + attach.getReviewFileName());
				
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\proj_performance\\" + attach.getReviewUploadPath() + "\\s_" + attach.getReviewUuid() + "_" + attach.getReviewFileName());
					
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				// TODO: handle exception
				logger.info("delete file error" + e.getMessage());
			}
			
		});	//end foreach	
	}
	
	//삭제
	@RequestMapping(value = "remove", method = RequestMethod.POST)
	public String remove(@RequestParam("no") int no, SearchCriteria cri, Model model, RedirectAttributes rttr) {
		logger.info("=====> Review Remove ----- POST");
		
		List<ReviewAttachVO> attachList = service.getAttachList(no);
		
		if(service.delete(no)) {
			//첨부파일 삭제
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");	
		}
		model.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/list?page=" + cri.getPage() + "&searchType=" + cri.getSearchType();
	}
	
	//수정
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modify(@RequestParam("no") int no, SearchCriteria cri, Model model) {
		logger.info("=====> Review Modify ----- GET");
		
		ReviewVO vo = service.read(no);
		
		model.addAttribute("reviewVO", vo);
		model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(ReviewVO vo, @RequestParam("reviewNo") int reviewNo, SearchCriteria cri, Model model) {
		logger.info("======> Review Modify ----- POST");
		logger.info("reviewNo = " + reviewNo);
		logger.info("페이지번호 = " + cri.getPage());
		logger.info("검색종류 = " + cri.getSearchType());
		logger.info("검색어 = " + cri.getKeyword());
		
		service.update(vo);
		
		// redirect 때는 cri 객체 전체를 전달할 수 없음. 하나씩 심어서 보내야함. ex) "page", cri.getPage()
		model.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/read?page=" + cri.getPage() + "&no=" + vo.getReviewNo() + "&page=" + cri.getPage() + "&searchType=" + cri.getSearchType();
	}
}
