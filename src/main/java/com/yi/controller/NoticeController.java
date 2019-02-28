package com.yi.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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

import com.yi.domain.LoginDTO;
import com.yi.domain.MemberVO;
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
	
	//업로드 할 주소
	@Resource(name = "uploadPath")	//servlet-context에 있는 id와 일치해야 함.
	private String uploadPath;

	
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
	public String registerPost(HttpServletRequest request, NoticeVO vo, Model model, List<MultipartFile> uploadFiles) throws IOException {
		logger.info("에디터 컨텐츠 값 = " + request.getParameter("content"));
		logger.info("=====> Register ----- POST");

		
		List<String> files = new ArrayList<>();
		for(MultipartFile file : uploadFiles) {
			logger.info("=====> File name : " + file.getOriginalFilename());
			logger.info("=====> File size : " + file.getSize());
			
			//이미지 파일 썸네일
			String thumbPath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			logger.info("=====> thumbPath" + thumbPath);
			files.add(thumbPath);	
		}
		vo.setFiles(files);
		  
		//공지사항 등록하기
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
	
	
	// 서버 <-> 브라우저(데이터 요청하면 보내줄거니까 안보여도 됨) 파일명에 해당하는 이미지의 데이터만 줌.
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String filename) {
		ResponseEntity<byte[]> entity = null;
		logger.info("DisplayFile = " + filename);

		try {
			// 확장자에 따라서 미디어타입 결정(확장자만 가지고 온다.)
			String format = filename.substring(filename.lastIndexOf(".") + 1); // 확장자만 가지고 옴.
			MediaType mType = MediaUtils.getMediaType(format); // 맞는 미디어 타입 찾아냄.

			HttpHeaders headers = new HttpHeaders();
			InputStream in = null;
			in = new FileInputStream(uploadPath + "/" + filename); // 서버 파일 경로 C:/zzz/upload/~~~~.filename.jpg
			headers.setContentType(mType); // 고객 브라우저로 돌려주는 헤더에 미디어 타입 알려줌.

			// 이미지 파일의 데이터
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

			in.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}
