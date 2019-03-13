package com.yi.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.BookVO;
import com.yi.domain.DiscountVO;
import com.yi.domain.LoginDTO;
import com.yi.domain.MemberVO;
import com.yi.domain.PaymentVO;
import com.yi.domain.PerformanceVO;
import com.yi.domain.SeatVO;
import com.yi.interceptor.LoginInterceptor;
import com.yi.service.BookService;
import com.yi.service.MemberService;
import com.yi.util.MediaUtils;

@Controller
@RequestMapping("/book/*")
public class BookController {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	    
	//서비스
	@Autowired
	private BookService service;
	@Autowired
	private MemberService memService;
	
	
	//이름으로 공연정보 가지고 오기
	// ==================== step1 ======================
	@RequestMapping(value = "stepOne", method = RequestMethod.GET)
	public void stepOneGet(String showName, Model model, HttpSession session) {
		logger.info("=====> Book Step1 : GET");
		logger.info("showname = " + showName);
		
		PerformanceVO vo = service.perfListAllByShowName(showName);
		List<PerformanceVO> list = service.selectListByShowName(showName);
		
		//아이디
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		logger.info("info = " + info);
		MemberVO memberVO = service.readMember(info.getUserid());
			
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("memberVO", memberVO);
		
		
	}
	           
	
	//날짜로 공연정보 가지고 오기  
	@ResponseBody   
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<PerformanceVO>> search(String showName, String bookDate, String bookTime, HttpServletRequest request) {
		ResponseEntity<List<PerformanceVO>> entity = null;
		
		logger.info("====== Search ======");
		logger.info("bookDate = " + bookDate);
		logger.info("bookTime = " + bookTime);
		logger.info("showname = " + showName);
		
		Map<String, Object> map = new HashMap<>();
		
		try {
			//공연이름
			if(!showName.equals("")) {          
				map.put("showName", showName);   
			}     
			                            
			//예매날짜                     
			if(bookDate != null && !bookDate.equals("")) {                  
				//날짜 Date로 바꾸기
				SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");  	
				Date selectBookDate = sdfd.parse(bookDate);
				logger.info("선택한 날짜 = " + selectBookDate);
				
				map.put("bookDate", selectBookDate);
			/*	
				logger.info("선택한 날짜 = " + bookDate);
				map.put("bookDate", bookDate);   */
			}
			
			//회차선택                             
			if(bookTime != null && !bookTime.equals("")) {      
				SimpleDateFormat sdft = new SimpleDateFormat("HH:mm");
				Date selectBookTime = sdft.parse(bookTime);
				
				logger.info("선택한 회차 = " + selectBookTime);
				map.put("bookTime", selectBookTime);
			}
			
			logger.info("map =====> " + map);   
			List<PerformanceVO> list = service.searchPerformance(map);
			logger.info("list = " + list);  
			entity = new ResponseEntity<List<PerformanceVO>>(list, HttpStatus.OK);
			
			String scode = list.get(0).getShowCode();
			HttpSession session = request.getSession();
			session.setAttribute("scode", scode);
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
	
	
	
	// ==================== step2 ======================
	@RequestMapping(value = "stepTwo", method = RequestMethod.POST)
	public void stepTwoGet(@ModelAttribute("vo") BookVO vo, MemberVO mCode, PerformanceVO sCode, Model model, HttpServletRequest request) {         
		logger.info("=====> Book Step2 : POST");
		logger.info("mCode : " + mCode);
		logger.info("sCode = " + sCode);
		
		HttpSession session = request.getSession();
		
		//set해야함.
		vo.setmCode(mCode);
		String code = (String) session.getAttribute("scode");
		logger.info("code ======> " + code); 
		
		sCode.setShowCode(code);
		vo.setsCode(sCode);
		
		logger.info("vo = " + vo);
		model.addAttribute("vo", vo);
		
		//열
		int row = BookVO.getSeatRow();
		model.addAttribute("row", row);
//		logger.info("row = " + row);
		
		//좌석정보
		List<SeatVO> list = service.getSeatInfo(vo.getSeatCategory()); 
		model.addAttribute("list", list);
		
		//이미 예약 완료 된 좌석  
		List<BookVO> reservedSeat = service.getFinishResvSeat(vo.getsCode().getShowCode());
		logger.info("reservedSeat ===> " + reservedSeat);

		model.addAttribute("reservedSeat", reservedSeat);
		
		//
		
		
		List<BookVO> bookList = (List<BookVO>) session.getAttribute("bookList");
		
		if(bookList == null) {
			bookList = new ArrayList<>();
			session.setAttribute("bookList", bookList);
			Map<String, Integer> pricemap = new HashMap<>();
			pricemap.put("R", 100000);
			pricemap.put("S", 80000);
			pricemap.put("A", 50000);
			pricemap.put("B", 30000);
			pricemap.put("N", 20000);
			session.setAttribute("pMap", pricemap);
		}
		BookVO bvo = new BookVO();
		bvo.setmCode(mCode);
		bvo.setsCode(sCode);
		bvo.setBookDate(vo.getBookDate());
		bvo.setBookTime(vo.getBookTime());
		bvo.setSeatCategory(vo.getSeatCategory());
		
		bookList.add(bvo);
		logger.info("bookList 1 =========>" + bookList);
	}
	
	
	//좌석 선택할 때
	@ResponseBody
	@RequestMapping(value = "insertTempSeat", method = RequestMethod.POST)
	public ResponseEntity<String> insertTempSeat(String selectShowCode, String selectSeatZone, String selectSeatNum, String selectSeatGrade, HttpSession session){
		ResponseEntity<String> entity = null;
		
		logger.info("좌석 선택하기(임시좌석) =======> insertTempSeat : POST");
		logger.info("selectShowCode = " + selectShowCode);
		logger.info("selectSeatZone = " + selectSeatZone);
		logger.info("selectSeatNum = " + selectSeatNum);
		logger.info("selectSeatGrade = " + selectSeatGrade);
		
		try {
			int res = service.getTempResvSeat(selectShowCode, selectSeatZone, selectSeatNum);
			logger.info("임시좌석 테이블에 값 있는지 확인하기 res =====> " + res);
			
			List<BookVO> bookList = (List<BookVO>) session.getAttribute("bookList"); 
			BookVO bvo = bookList.get(0);
			logger.info("getbookzone===>" + bvo.getBookZone() + "getbooknum=====>" + bvo.getBookNum());
			
			if(res == 0) {
				service.insertTempSeat(selectShowCode, selectSeatZone, selectSeatNum);
				
				
				logger.info("bookList 2 =========>" + bookList);
				if(bvo.getBookZone() == null) {
					bvo.setBookZone(selectSeatZone);
					bvo.setBookNum(Integer.parseInt(selectSeatNum));
					bvo.setSeatGrade(selectSeatGrade);
				} else {
					BookVO addBvo = new BookVO();
					addBvo.setBookDate(bvo.getBookDate());
					addBvo.setBookTime(bvo.getBookTime());
					addBvo.setSeatCategory(bvo.getSeatCategory());
					PerformanceVO pvo = new PerformanceVO();
					pvo.setShowCode(bvo.getsCode().getShowCode());
					addBvo.setsCode(pvo);
					MemberVO mvo = new MemberVO();
					mvo.setMemberCode(bvo.getmCode().getMemberCode());
					addBvo.setmCode(mvo);
					addBvo.setBookZone(selectSeatZone);
					addBvo.setBookNum(Integer.parseInt(selectSeatNum));
					addBvo.setSeatGrade(selectSeatGrade);
					
					bookList.add(addBvo);
				}
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				
			} else if(res > 0) {
				logger.info("이미 선택된 좌석");
				
				LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
				logger.info("info ====> " + info);
				
				MemberVO mvo = memService.readMember(info.getUserid());
				logger.info("mvo membercode====> " + mvo.getMemberCode());
				logger.info("bvo membercode=====> " + bvo.getmCode().getMemberCode());
				
				if(mvo.getMemberCode().equals(bvo.getmCode().getMemberCode())) {
					logger.info("수정..");
					service.delTempResvSeat(selectShowCode, selectSeatZone, selectSeatNum);  
										
					entity = new ResponseEntity<String>("modify", HttpStatus.OK);     
					
				} else {
					entity = new ResponseEntity<String>("fail", HttpStatus.OK);
				}

				  
			}  
			                 
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);	//실패 시 에러 원인과 400 에러를 같이 보냄.
		}
		return entity;
	}
	  
	// ==================== step3 ======================
	@RequestMapping(value = "stepThree", method = RequestMethod.GET)
	public void stepThreeGet(HttpSession session, Model model) {
		logger.info("stepThree : GET");
		
		logger.info("discount 내용들 ======> ");
		List<DiscountVO> discountList = service.selectDiscountAll();
		model.addAttribute("discountList", discountList);
		
		
		List<BookVO> bookList = (List<BookVO>) session.getAttribute("bookList");
//		logger.info("bookList size====>" + bookList.size());
		
		int total =0;
		Map<String, Integer> pMap = (Map<String, Integer>) session.getAttribute("pMap");
		
		for(BookVO bvo: bookList) {
			total += pMap.get(bvo.getSeatGrade());        
		}
		int tax = (int) (total*0.1);

		for(int i = 0; i < bookList.size() ; i++) {
			BookVO bvo = bookList.get(i);
			logger.info("bvo ===========> " + bvo);
			
			//디스플레이하기 위해 필요한 공연정보.....
			PerformanceVO searchPerf = service.selectListByShowCode(bvo.getsCode().getShowCode());	//공연코드로 해당 공연정보 가지고 오기
			logger.info("searchPerf ===========> " + searchPerf);
			PerformanceVO pvo  = service.perfListAllByShowName(searchPerf.getShowName());
			logger.info("pvo ===========> " + pvo);
			
			model.addAttribute("pvo", pvo);
			
			int res = service.getTempResvSeat(bvo.getsCode().getShowCode(), bvo.getBookZone(), String.valueOf(bvo.getBookNum()));
			logger.info("res ===========> " + res);
			
			
			if(res > 0) {
				model.addAttribute("bvo", bookList);
				model.addAttribute("total", total);
				model.addAttribute("tax", tax);
				
				logger.info("res 0 이상인 bvo ===========> " + bvo);  
			} else {
				bookList.remove(bvo);	//이미 resv_seat 테이블에 데이터가 없으므로 세션에서도 없애줌.
			}
				
		}
			      
	}
	
	
	// ==================== step4 ======================
	@RequestMapping(value = "stepFour", method = RequestMethod.GET)        
	public void stepFourGet(HttpSession session, Model model, String p, String f, String d, String t, String dCode) {
		logger.info("stepFour : GET");       
		logger.info("ticketPrice = " + p);
		logger.info("ticketFee = " + f);
		logger.info("ticketDiscount = " + d);
		logger.info("ticketTotalPrice = " + t);
		logger.info("dCode = " + dCode);
		
		//======================== 가격정보 ===============
		Map<String, Integer> priceInfoMap = new HashMap<>();
		priceInfoMap.put("ticketPrice", Integer.parseInt(p));
		priceInfoMap.put("ticketFee", Integer.parseInt(f));
		priceInfoMap.put("ticketDiscount", Integer.parseInt(d));
		priceInfoMap.put("deliveryFee", 0);
		priceInfoMap.put("totalPrice", Integer.parseInt(t));

		session.setAttribute("priceInfoMap", priceInfoMap);
		//==============================================
		
		List<BookVO> bookList = (List<BookVO>) session.getAttribute("bookList");
		
		for(int i = 0 ; i < bookList.size() ; i++) {
			BookVO bvo = bookList.get(i);
			logger.info("bvo ===========> " + bvo);
			
			//디스플레이하기 위해 필요한 공연정보.....
			PerformanceVO searchPerf = service.selectListByShowCode(bvo.getsCode().getShowCode());	//공연코드로 해당 공연정보 가지고 오기
			logger.info("searchPerf ===========> " + searchPerf);
			PerformanceVO pvo  = service.perfListAllByShowName(searchPerf.getShowName());
			logger.info("pvo ===========> " + pvo);
			
			model.addAttribute("pvo", pvo);
			
			//할인분류코드
			DiscountVO dvo = new DiscountVO();
			dvo.setDiscountCode(dCode);
			bvo.setdCode(dvo);
			
			model.addAttribute("bvo", bookList);
			//가격
			model.addAttribute("priceInfoMap", priceInfoMap);
		}
		
		// ================ 로그인 한 고객 정보 =================
		LoginDTO info = (LoginDTO) session.getAttribute(LoginInterceptor.LOGIN);
		logger.info("info = " + info);
		
		MemberVO mvo = memService.readMember(info.getUserid());
		model.addAttribute("mvo", mvo);
	}
	
	
	
	// ==================== step5 ======================
	@RequestMapping(value = "stepFive", method = RequestMethod.GET)
	public void stepFiveGet(HttpSession session, Model model) {
		logger.info("stepFive : GET");
		
		List<BookVO> bookList = (List<BookVO>) session.getAttribute("bookList");
		
		for(int i = 0 ; i < bookList.size() ; i++) {
			BookVO bvo = bookList.get(i);
			logger.info("bvo ===========> " + bvo);
			
			//디스플레이하기 위해 필요한 공연정보.....
			PerformanceVO searchPerf = service.selectListByShowCode(bvo.getsCode().getShowCode());	//공연코드로 해당 공연정보 가지고 오기
			logger.info("searchPerf ===========> " + searchPerf);
			PerformanceVO pvo  = service.perfListAllByShowName(searchPerf.getShowName());
			logger.info("pvo ===========> " + pvo);
			
			model.addAttribute("pvo", pvo);	
		}
		
		//가격
		Map<String, Integer> priceInfoMap = (Map<String, Integer>) session.getAttribute("priceInfoMap");
		
		//결제
		List<PaymentVO> paymentList = service.selectPaymentAll();
		model.addAttribute("paymentList", paymentList);
		
		model.addAttribute("bvo", bookList);
		model.addAttribute("priceInfoMap", priceInfoMap);
	}
	
	// ======================= 예매 ==========================
	@ResponseBody
	@RequestMapping(value = "insertBook", method = RequestMethod.POST)
	public ResponseEntity<String> insertBook(HttpSession session, Model model, String pCode) {
		logger.info("insertBook : POST");
		logger.info("pCode ===> " + pCode);
		ResponseEntity<String> entity = null;
		
		try {
			List<BookVO> bookList = (List<BookVO>) session.getAttribute("bookList");
			
			for(int i = 0 ; i < bookList.size() ; i++) {
				BookVO bvo = bookList.get(i);
				logger.info("bvo ===========> " + bvo);
				
				PaymentVO paymentVO = new PaymentVO();
				paymentVO.setPaymentCode(pCode);
				//
				bvo.setpCode(paymentVO);
				
				service.insertBook(bvo);
				
			}
			service.delAllTempResvSeat();
			bookList.clear();
			
			entity = new ResponseEntity<String>("insert", HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;       
	}
	
	// ==== 예매 결과 ===  
	@RequestMapping(value = "result", method = RequestMethod.GET)
	public void bookResultGET() {
		logger.info("=====> bookResult ----- GET");
	}
}
