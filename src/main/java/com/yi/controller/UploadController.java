package com.yi.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yi.domain.AttachFileDTO;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/upload/")
public class UploadController {
	//로그로 확인하기
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	
	//년/월/일 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//이미지 파일의 판단 => 이미지면 썸네일 만들고, 그렇지 않으면 썸네일 만들지 않는다.
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
		return false;
	}
	
	
	//폼: 첨부파일을 업로드할 수 있는 화면
	@RequestMapping(value = "uploadForm", method = RequestMethod.GET)
	public void uploadFormGet() {
		logger.info("===== uploadForm: GET =====");
	}
	
	//폼
	@RequestMapping(value = "uploadForm", method = RequestMethod.POST)
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		logger.info("===== uploadForm: POST =====");
		
		//파일 업로드 될 폴더 지정
		String uploadFolder = "C:\\proj_performance";
		
		for(MultipartFile multipartFile : uploadFile) {
			logger.info(" ----------------------------- ");
			//getOriginalFilename: 업로드되는 파일의 이름
			logger.info("업로드 파일 이름 = " + multipartFile.getOriginalFilename());
			//getSize: 업로드되는 파일의 크기
			logger.info("업로드 파일 크기 = " + multipartFile.getSize());
			
			//파일 객체만들어서 저장하기
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			//transferTo(File file): 파일 저장
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	
	//Ajax를 이용하는 파일 업로드
	@RequestMapping(value = "uploadAjax", method = RequestMethod.GET)
	public void uploadAjaxGet() {
		logger.info("===== uploadAjax: GET =====");
	}
	
/*	@RequestMapping(value = "uploadAjax", method = RequestMethod.POST)
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		logger.info("===== uploadAjax: POST =====");
		
		//업로드 될 폴더 경로 지정
		String uploadFolder = "C:\\upload";
		
		//년/월/일 폴더 만들기
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("업로드 경로 = " + uploadPath);
		
		//폴더가 존재하지 않는다면 폴더를 만든다.
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			logger.info(" ----------------------------- ");
			//getOriginalFilename: 업로드되는 파일의 이름
			logger.info("업로드 파일 이름 = " + multipartFile.getOriginalFilename());
			//getSize: 업로드되는 파일의 크기
			logger.info("업로드 파일 크기 = " + multipartFile.getSize());
			
			//업로드 파일 이름
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//익스플로러 경우, 전체 파일 경로가 전송되므로 마지막 \를 기준으로 잘라낸 문자열이 실제 파일 이름이 됨.
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			logger.info("IE 실제 파일 이름 = " + uploadFileName);
			
			
			//중복 방지를 위한 UUID 적용
			UUID uuid = UUID.randomUUID();
			//uuid가 적용된 파일 이름
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			

			try {
				//파일 객체를 만든다.
				//File saveFile = new File(uploadFolder, uploadFileName);
				//파일 객체를 만들어서 년/월/일 폴더에 저장한다.
				File saveFile = new File(uploadPath, uploadFileName);
				//저장한다.
				multipartFile.transferTo(saveFile);
				
				// ** 저장하는 파일의 파일 종류가 이미지인지 확인
				if(checkImageType(saveFile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					//썸네일 만들기(width = 100, height = 100)
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}*/
	
	
	//AttachFileDTO의 리스트를 반환하는 구조로 변경
	@RequestMapping(value = "uploadAjax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile){
		logger.info("===== uploadAjax: POST =====");
		
		//AttachFileDTO를 담을 리스트
		List<AttachFileDTO> list = new ArrayList<>();
		
		//업로드 될 파일 C:\\upload
		String uploadFolder = "C:\\proj_performance";
		
		//업로더 폴더의 경로를 가지고 온다 => getFolder()를 이용하면 upload 폴더 밑에 년/월/일 폴더 생성
		String uploadFolderPath = getFolder();
		
		//파일 만들기
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		//폴더 존재하지 않으면 만든다.
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			//각 파일에 맞는 AttachFileDTO 생성
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			//업로드 파일 이름
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//익스플로러 경우, 전체 파일 경로가 전송되므로 마지막 \를 기준으로 잘라낸 문자열이 실제 파일 이름이 됨.
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			logger.info("실제 파일 이름 = " + uploadFileName);
			
			//attachDTO에 filename에 적용.
			attachDTO.setFileName(uploadFileName);
			
			//UUID 생성
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				//AttachDTO에 uuid
				attachDTO.setUuid(uuid.toString());
				//attachDTO에 업로드 경로
				attachDTO.setUploadPath(uploadFolderPath);
				
				//이미지 파일인지 확인
				if(checkImageType(saveFile)) {
					attachDTO.setImage(true);	//이미지 파일 Yes
					
					//이미지니까 썸네일 만들기
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					
					thumbnail.close();
				}
				
				//리스트에 추가한다.
				list.add(attachDTO);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	//썸네일 데이터 전송하기
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName){
		logger.info("fileName = " + fileName);
		
		File file = new File("C:\\proj_performance\\" + fileName);
		
		logger.info("file = " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//첨부파일의 다운로드
	@ResponseBody
	@RequestMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	//인터넷 익스플로러의 경우 다르게 처리해야 하므로, User-Agent 값으로 IE인지 판단
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName){
		logger.info("===== downloadFile =====");
		logger.info("downloadFile = " + fileName);
		
		Resource resource = new FileSystemResource("C:\\proj_performance\\" + fileName);
		
		if(resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
//		logger.info("resource = " + resource);
		
		String resourceName = resource.getFilename();
		
		//UUID가 붙은 부분을 제거하고 순수하게 다운로드되는 파일의 이름으로 저장될 수 있도록 처리한다.
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			String downloadName = null;
			
			//Trident(IE 브라우저의 엔진 이름)인 경우 다른 방식으로 처리한다.
			if(userAgent.contains("Trident")) {
				logger.info("===== Internet Explorer Browser =====");
				
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
				
			} else if(userAgent.contains("Edge")) {
				logger.info("===== Edge Browser =====");
				
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
	
			} else {
				logger.info("===== Chrome Browser ======");
				
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			logger.info("downloadName = " + downloadName);
			
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);       
	}

	
	//서버에서 첨부파일 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type){
		logger.info("===== Delete File ======");
		logger.info("삭제하고싶은 fileName = " + fileName);
		
		File file;
		
		try {
			file = new File("C:\\proj_performance\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if(type.equals("image")) {	//이미지 파일인 경우 => 썸네일, 원본 파일 삭제
				String largeFileName = file.getAbsolutePath().replace("s_", "");	//원본파일
				logger.info("원본파일이름 = " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}
