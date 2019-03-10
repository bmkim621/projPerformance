package com.yi.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yi.domain.LoginDTO;
import com.yi.domain.MemberVO;
import com.yi.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	//로그로 확인하기
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
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
	
}
