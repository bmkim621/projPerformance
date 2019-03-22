package com.yi.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yi.domain.BookVO;
import com.yi.domain.LoginDTO;
import com.yi.domain.MemberVO;
import com.yi.interceptor.LoginInterceptor;
import com.yi.service.BookService;
import com.yi.service.MemberService;
import com.yi.util.MediaUtils;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	//로그로 확인하기
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	@Autowired
	private BookService bookService;
	
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGet() {
		logger.info("==========> Login GET ");   
	}
	
	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public void loginPost(String userid, String userpw, Model model) {
		logger.info("==========> Login POST ");  
		
		logger.info("userid = " + userid);
		logger.info("userpw = " + userpw);
		
		MemberVO vo = service.read(userid, userpw);
		
		//회원이 존재하지 않는 경우 로그인 화면으로 이동
		if(vo == null) {
			logger.info("loginPOST Return ....... ");
			return;
		}   

		
		//이름, 아이디, 회원구분
		LoginDTO dto = new LoginDTO();
		dto.setUserid(vo.getId());
		dto.setUsername(vo.getMemberName());
		dto.setIsMember(vo.getIsMember());
		
		//회원이 있는 경우 실어서 보낸다.
		model.addAttribute("memberVO", dto);
	}
	
	//로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		logger.info("==========> Logout GET ");
		//로그아웃 => 세션 날리기
		session.invalidate();
		bookService.delAllTempResvSeat();
		
		//로그아웃 후 홈화면으로 이동하기
		return "redirect:/";
	}
	
	
	
	//회원가입 화면
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public void joinGet() {
		logger.info("==========> join GET ");
	}
	
	//회원가입 화면
	@RequestMapping(value = "joinForm", method = RequestMethod.POST)
	public String joinPost(String addr1, String addr2, String addr3, String phoneMiddle, String phoneLast, String phoneFirst, MemberVO vo, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException, MessagingException {
		logger.info("==========> join POST ");
		
		logger.info(vo.toString());
		String address = "(" + addr1  + ") " + addr2 + " " + addr3;
		vo.setAddress(address);
		logger.info("phoneFirst = " + phoneFirst);
		logger.info("phoneMiddle = " + phoneMiddle);
		String phone = phoneFirst + "-" + phoneMiddle + "-" + phoneLast;
		vo.setPhone(phone);
		service.insertMember(vo);
		
		return "redirect:/";
	}
	
	//아이디 중복확인
	@RequestMapping(value = "idDuplicateChk", method = RequestMethod.POST)
	public @ResponseBody String idDuplicateChk(@ModelAttribute("vo") MemberVO vo, Model model) {
		logger.info("==========> idDuplicateChk POST ");  
		
		int result = service.idDuplicateChk(vo.getId());
		logger.info("result = " + result);        
		
		return String.valueOf(result);
	}
	
	//나의 예매내역
	@RequestMapping(value = "bookInfo", method = RequestMethod.GET)
	public void bookInfoGet(HttpSession session, Model model) {
		logger.info("==========> bookInfo GET ");
		
		//아이디 이용해서 회원번호 가지고오기
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		logger.info("info = " + info);
		MemberVO mvo = service.readMember(info.getUserid());
		model.addAttribute("info", info);
		
		//예매내역
		List<BookVO> list = service.selectMyBookList(mvo.getMemberCode());
		model.addAttribute("list", list);
		
		//공연종류
		int countA = service.getCountA(mvo.getMemberCode());
		int countB = service.getCountB(mvo.getMemberCode());
		int countC = service.getCountC(mvo.getMemberCode());
		int countD = service.getCountD(mvo.getMemberCode()); 
		int countE = service.getCountE(mvo.getMemberCode());
		
		model.addAttribute("countA", countA);
		model.addAttribute("countB", countB);
		model.addAttribute("countC", countC);
		model.addAttribute("countD", countD);
		model.addAttribute("countE", countE);   
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
			in = new FileInputStream("C:\\proj_performance" + "/" + filename); // 서버 파일 경로
																				// C:/zzz/upload/~~~~.filename.jpg
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
