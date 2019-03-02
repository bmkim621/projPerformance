package com.yi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

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

import com.yi.domain.FacilitiesVO;
import com.yi.domain.PageMaker;
import com.yi.domain.PerformanceVO;
import com.yi.domain.SearchCriteria;
import com.yi.domain.SearchDate;
import com.yi.service.PerformanceService;
import com.yi.util.MediaUtils;
import com.yi.util.UploadFileUtils;

@Controller
@RequestMapping("/perf/*")
public class PerformanceController {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(PerformanceController.class);
	
	//서비스 주입
	@Autowired
	private PerformanceService service;
	
	
	//공연정보 등록
	@RequestMapping(value = "addPerf", method = RequestMethod.GET)
	public void addPerfGet() {
		logger.info("=====> addPerf ----- GET");
	}
	
	@RequestMapping(value = "addPerf", method = RequestMethod.POST)
	public String addPerfPost(PerformanceVO vo, FacilitiesVO fno, Model model, MultipartFile uploadFile) throws IOException {
		logger.info("=====> addPerf ----- POST");
		logger.info("=====> VO : " + vo);
		logger.info("=====> fno : " + fno);
		logger.info("파일 이름 = " + uploadFile.getOriginalFilename());
		logger.info("파일 크기 = " + uploadFile.getSize());
		
		//FacilitiesVO의 fno를 VO에 있는 fno에 넣기
		vo.setFno(fno);
		
		//외부에서 저장한다. (servelt-context.xml 파일에 있는 uploadPath에 저장된다.)
		File dirPath = new File("C:\\proj_performance");
		if(dirPath.exists() == false) {	//폴더 존재하지 않으면 폴더를 만든다.
			dirPath.mkdir();
		}
		
		//파일크기 0이 아닌 경우
		if(uploadFile.getSize() > 0) {
			//썸네일
			String thumPath = UploadFileUtils.uploadFile("C:\\proj_performance", uploadFile.getOriginalFilename(), uploadFile.getBytes());
			
			//원본파일
			String front = thumPath.substring(0, 12);
			String end = thumPath.substring(14);
			String origin = front + end;
			System.out.println("origin ======> " + origin);
			//VO에 원본파일 경로 넣기
			vo.setShowImagePath(origin);
		}
		
		//performance 테이블에 데이터 추가하기
		service.insertPerf(vo);
		
		logger.info("추가한 후 =====> VO : " + vo);
				
		//새로고침하면 계속 같은 데이터 추가되기 때문에 redirect 시킨다.
		return "redirect:/perf/perfList";                                                     
		
	}
	
	//perf/perfList/month=2&year=2019&category=A
	//공연정보 리스트 보기
	@RequestMapping(value = "perfList", method = RequestMethod.GET)
	public void perfList(Model model, SearchDate search) {
		logger.info("=====> perfList ----- GET");
		
		List<PerformanceVO> result = new ArrayList<>();
//		List<PerformanceVO> list = service.perfListAll();
		
		//날짜
		int nYear = Calendar.getInstance().get(Calendar.YEAR);
		int nMonth = Calendar.getInstance().get(Calendar.MONTH);
				
		GregorianCalendar s = new GregorianCalendar(nYear, nMonth, 1);
		GregorianCalendar e = new GregorianCalendar(nYear, nMonth, 31);
		
		Map<String, Object> map = new HashMap<>();
		map.put("sYear", s.getTime());			
		map.put("eYear", e.getTime());	
		
		List<PerformanceVO> list = service.selectPerformanceByCondition(map);
		
		//공연이름, 이름에 해당하는 PerformanceVO를 담는 map
		Set<String> showNames = new HashSet<>();
		
		for(PerformanceVO vo : list) {
			showNames.add(vo.getShowName());
		}
		
		for(String sName : showNames) {
			PerformanceVO pvo = service.perfListAllByShowName(sName);
			result.add(pvo);
			
		}
		
		logger.info("result = " + result);
//		logger.info("search = " + search);
		logger.info("map = " + map);
		
		model.addAttribute("result", result);
//		model.addAttribute("search", search);
		model.addAttribute("map", map);
		

		
/*		SearchDate sd = new SearchDate();
		sd.setsYear(nYear);
		sd.setsMonth(nMonth);
		System.out.println("sd =========> " + sd); 
		
		model.addAttribute("date", sd);*/
		
	}
	
	// 서버 <-> 브라우저(데이터 요청하면 보내줄거니까 안보여도 됨) 파일명에 해당하는 이미지의 데이터만 줌.
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String filename){
		ResponseEntity<byte[]> entity = null;
		logger.info("DisplayFile = " + filename);
		
		try {
			//확장자에 따라서 미디어타입 결정(확장자만 가지고 온다.)
			String format = filename.substring(filename.lastIndexOf(".") + 1);	//확장자만 가지고 옴.
			MediaType mType = MediaUtils.getMediaType(format);	//맞는 미디어 타입 찾아냄.
			
			HttpHeaders headers = new HttpHeaders();
			InputStream in = null;
			in = new FileInputStream("C:\\proj_performance" + "/" + filename);	//서버 파일 경로 C:/zzz/upload/~~~~.filename.jpg
			headers.setContentType(mType);	//고객 브라우저로 돌려주는 헤더에 미디어 타입 알려줌.
			
												//이미지 파일의 데이터
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
			in.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	//공연정보 읽기
	@RequestMapping(value = "readPerf", method = RequestMethod.GET)
	public void readPerf(@RequestParam("showName") String showName, Model model) {
		logger.info("=====> readPerf ----- GET");
		
		PerformanceVO vo = service.perfListAllByShowName(showName);
		
		logger.info("vo ===============> " + vo);
		         
		model.addAttribute("PerformanceVO", vo);
	}
	
}
