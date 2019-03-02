package com.yi.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yi.domain.LoginDTO;
import com.yi.domain.MemberVO;
import com.yi.domain.NoticeAttachVO;
import com.yi.domain.NoticeVO;
import com.yi.domain.PageMaker;
import com.yi.domain.SearchCriteria;
import com.yi.interceptor.LoginInterceptor;
import com.yi.service.NoticeService;
import com.yi.util.MediaUtils;
import com.yi.util.UploadFileUtils;

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
	
	//첨부파일 보기
	@ResponseBody
	@RequestMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<NoticeAttachVO>> getAttachList(int noticeNo){
		logger.info("=====> getAttachList : " + noticeNo);
			
		return new ResponseEntity<>(service.getAttachList(noticeNo), HttpStatus.OK);
	}
		
	//글 쓰기
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerGet(HttpSession session, Model model) {
		logger.info("=====> Register ----- GET");
		
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		logger.info("info = " + info);
		
		//글 쓰기화면 불러올 때 필요한 것		
		List<MemberVO> list = service.getWriter(info.getUserid());
		logger.info("list = " + list);
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerPost(HttpServletRequest request, NoticeVO vo, Model model, RedirectAttributes rttr) throws IOException {
		logger.info("에디터 컨텐츠 값 = " + request.getParameter("content"));
		logger.info("=====> Register ----- POST");

		
		//파일 넘어왔는지 확인
		logger.info("=========================");
		logger.info("공지사항 글 등록하기 NoticeVO : " + vo);
				
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> logger.info("attach = " + attach));
		}
		logger.info("=========================");
				  
		service.register(vo);

		return "redirect:/notice/list";
		
	}
	
	
	//글 수정하기, 수정할 때 필요한 부분 필요
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modify(@RequestParam("no") int no, SearchCriteria cri, Model model) {
		logger.info("=====> modify ----- GET");
	
		//no에 해당하는 게시물을 읽는다.
		NoticeVO vo = service.read(no);
		
		//실어서 보냄.
		model.addAttribute("noticeVO", vo);
		model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(NoticeVO vo, @RequestParam("noticeNo") int noticeNo, SearchCriteria cri, Model model) {
		logger.info("======> modify ----- POST");
		logger.info("noticeNo = " + noticeNo);
		logger.info("페이지번호 = " + cri.getPage());
		logger.info("검색종류 = " + cri.getSearchType());
		logger.info("검색어 = " + cri.getKeyword());
		
		service.modify(vo);
		
		// redirect 때는 cri 객체 전체를 전달할 수 없음. 하나씩 심어서 보내야함. ex) "page", cri.getPage()
		model.addAttribute("keyword", cri.getKeyword());

		return "redirect:/notice/read?page=" + cri.getPage() + "&no=" + vo.getNoticeNo() + "&page=" + cri.getPage() + "&searchType=" + cri.getSearchType();
	}
	
	//파일 삭제 처리
	private void deleteFiles(List<NoticeAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
			
		logger.info("delete attach files...............");
		logger.info("attachList = " + attachList);
			
		attachList.forEach(attach -> {
				
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
					
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
						
					Files.delete(thumbNail);
				}
					
			} catch (Exception e) {
				// TODO: handle exception
				logger.info("delete file error" + e.getMessage());
			}	//end catch
				
		});	//end foreach	
	}
		
		
	//공지사항 삭제하기
	@RequestMapping(value = "remove", method = RequestMethod.POST)
	public String remove(@RequestParam("no") int no, SearchCriteria cri, Model model, RedirectAttributes rttr) {
		logger.info("=====> remove ----- POST");
			
		List<NoticeAttachVO> attachList = service.getAttachList(no);
			
		if(service.remove(no)) {
			//첨부파일 삭제
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
			
		// redirect 때는 cri 객체 전체를 전달할 수 없음. 하나씩 심어서 보내야함. ex) "page", cri.getPage()
		model.addAttribute("keyword", cri.getKeyword());
			
		return "redirect:/notice/list?page=" + cri.getPage() + "&searchType=" + cri.getSearchType();
	}

}
