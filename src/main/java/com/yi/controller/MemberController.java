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
import com.yi.domain.PageMaker;
import com.yi.domain.PerformanceVO;
import com.yi.domain.ReviewVO;
import com.yi.domain.SearchCriteria;
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
	@RequestMapping(value = "joinTerms", method = RequestMethod.GET)
	public void joinTermsGet() {
		logger.info("==========> joinTerms GET ");
	}
	
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public void joinGet() {
		logger.info("==========> join GET ");
	}
	
	//회원가입 화면
	@RequestMapping(value = "joinForm", method = RequestMethod.POST)
	public String joinPost(String addr1, String addr2, String addr3, String phoneMiddle, String phoneLast, String phoneFirst, MemberVO vo, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException, MessagingException {
		logger.info("==========> join POST ");
		
		logger.info(vo.toString());
		String address = "(" + addr1  + ") " + addr2 + " / " + addr3;
		vo.setAddress(address);
		logger.info("phoneFirst = " + phoneFirst);
		logger.info("phoneMiddle = " + phoneMiddle);
		String phone = phoneFirst + "-" + phoneMiddle + "-" + phoneLast;
		vo.setPhone(phone);
		service.insertMember(vo);
		
		return "redirect:/member/joinSuccess";
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
	
	//연도별 공연 내역 검색   
	@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<BookVO>> search(String year, HttpSession session){
		ResponseEntity<List<BookVO>> entity = null;
		           
		logger.info("====== search MyBookList Year ===== ");
		logger.info("year =====> " + year);
		
		//아이디 이용해서 회원번호 가지고오기
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		logger.info("info = " + info);
		MemberVO mvo = service.readMember(info.getUserid());
		
		try {
			if(year.equals("")) {
				List<BookVO> list = service.selectMyBookList(mvo.getMemberCode());
				entity = new ResponseEntity<List<BookVO>>(list, HttpStatus.OK);
			} else {
				List<BookVO> searchList = service.selectBookListByYear(year, mvo.getMemberCode());
				entity = new ResponseEntity<List<BookVO>>(searchList, HttpStatus.OK);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
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
	
	//회원 관리
	@RequestMapping(value = "manage", method = RequestMethod.GET)
	public void manage(Model model, SearchCriteria cri) {
		logger.info("==========> manage GET ");
		
		//검색
		List<MemberVO> list = service.listSearch(cri);

		// 페이지 하단 부분
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchTotalCount(cri));

		logger.info("list = " + list);
		logger.info("page = " + pageMaker.getCri().getPage());
		logger.info("cri = " + cri);

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}
	
	//회원 등급
	@ResponseBody  
	@RequestMapping(value = "updateMemberGrade", method = RequestMethod.GET)
	public ResponseEntity<String> updateMemberGrade(int isMember, String mCode) {
		ResponseEntity<String> entity = null;

		logger.info("====== update Member Grade ===== ");
		logger.info("isMember = " + isMember);
		logger.info("memberCode = " + mCode);
		
		MemberVO mvo = new MemberVO();
		mvo.setIsMember(isMember);
		mvo.setMemberCode(mCode);

		try {
			service.updateMemberGrade(mvo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//회원 강제 탈퇴
	@ResponseBody
	@RequestMapping(value = "deleteMember", method = RequestMethod.GET)
	public ResponseEntity<String> deleteMember(String mCode) {
		ResponseEntity<String> entity = null;

		logger.info("====== delete Member Grade ===== ");
		logger.info("삭제하려는 memberCode = " + mCode);

		try {
			service.deleteMember(mCode);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);

		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//내 정보 수정 비밀번호 확인
	@RequestMapping(value = "confirmMember", method = RequestMethod.GET)
	public void confirmMemberGET(HttpSession session, Model model) {
		logger.info("==========> confirmMember GET ");
		
		//로그인 한 회원의 정보
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		logger.info("info = " + info);
		model.addAttribute("info", info);
	}
	        
	@RequestMapping(value = "confirmMember", method = RequestMethod.POST)
	public String confirmMemberPOST(Model model, String inputMemberPw, String inputMemberId) {
		logger.info("==========> confirmMember POST ");
		logger.info("화면에서 입력한 비밀번호 = " + inputMemberPw);
		logger.info("아이디 = " + inputMemberId);
		
		//비밀번호 체크
		boolean res = service.checkPassword(inputMemberPw, inputMemberId);  
		if(res) {	//일치하는 경우
			return "redirect:/member/myPage";
		} else {
			return "redirect:/member/invalid";  
		}
	}
	
	//내 정보 수정
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public void myPageGET(HttpSession session, Model model) {
		logger.info("==========> myPage GET ");
		
		//로그인 한 회원의 정보
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		logger.info("info = " + info);
		
		MemberVO mvo = service.readMember(info.getUserid());
		model.addAttribute("mvo", mvo);
	}
	
	//내 정보 수정
	@RequestMapping(value = "modifyInfo", method = RequestMethod.POST)
	public String myPagePOST(String emailAddr1, String emailAddr2, String addr1, String addr2, String addr3, String phoneMiddle, String phoneLast, String phoneFirst, MemberVO vo) {
		logger.info("==========> myPage POST ");
		
		logger.info(vo.toString());
		String address = "(" + addr1  + ") " + addr2 + " / " + addr3;
		vo.setAddress(address);
		logger.info("address = " + address);
		
		logger.info("phoneFirst = " + phoneFirst);
		logger.info("phoneMiddle = " + phoneMiddle);
		String phone = phoneFirst + "-" + phoneMiddle + "-" + phoneLast;
		vo.setPhone(phone);
		
		logger.info("phone = " + phone);
		
		String email = emailAddr1 + "@" + emailAddr1;  
		vo.setEmail(email);
		
		service.updateMember(vo);
		
		return "redirect:/member/myPage";
	}
	
	//비밀번호 Alert
	@RequestMapping(value = "invalid", method = RequestMethod.GET)
	public void invalidGET() {
		logger.info("==========> invalid GET ");
	}
	
	//회원 가입 완료 화면
	@RequestMapping(value = "joinSuccess", method = RequestMethod.GET)
	public void joinSuccessGET() {
		logger.info("==========> joinSuccess GET ");
	}
}