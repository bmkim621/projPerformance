package com.yi.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.PerformanceVO;
import com.yi.service.BookService;
import com.yi.util.MediaUtils;

@Controller
@RequestMapping("/book/*")
public class BookController {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	         
	//서비스
	@Autowired
	private BookService service;
	
	//이름으로 공연정보 가지고 오기
	@RequestMapping(value = "stepOne", method = RequestMethod.GET)
	public void stepOneGet(String showName, Model model) {
		logger.info("=====> Book StepOne : GET");
		logger.info("showname = " + showName);
		
		PerformanceVO vo = service.perfListAllByShowName(showName);
		List<PerformanceVO> list = service.selectListByShowName(showName);
			
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
	}
	           
	
	//날짜로 공연정보 가지고 오기  
	@ResponseBody   
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<PerformanceVO>> search(String showName, String bookDate, String bookTime) {
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
}
