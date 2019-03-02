package com.yi.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yi.domain.NoticeAttachVO;
import com.yi.persistence.NoticeAttachDAO;


@Component
public class FileCheckTask {
	private static final Logger logger = LoggerFactory.getLogger(FileCheckTask.class);
	
	@Autowired
	private NoticeAttachDAO attachDao;
	
	@Scheduled(cron="0 0 2 * * *")	//매일 새벽 2시에 동작. cron(초, 분, 시, 일, 월, 주)
	public void checkFiles() {
		logger.info("File Check Task run..............");
		logger.info("=================================");
		
		logger.info("Date ==> " + new Date());
		
		//DB에 있는 파일 리스트
		List<NoticeAttachVO> fileList = attachDao.getOldFiles();
		
		//DB에서 가져온 파일 목록은 NoticeAttachVO 객체이므로, 나중에 비교를 위해서 java.nio.Paths의 목록으로 변환한다.
		List<Path> fileListPaths = fileList.stream().map(
				vo -> Paths.get("C:\\proj_performance", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName())).collect(Collectors.toList());
		
		//이 때 이미지 파일의 경우에는 썸네일 파일의 목록도 필요하기 때문에 별도로 처리해서 해당 일의 예상 파일 목록을 완성한다.
		//fileListPaths라는 이름의 변수로 처리함.
		fileList.stream().filter(vo -> vo.isFileType() == true).map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName())).forEach(p -> fileListPaths.add(p));
		
		logger.info("=============================================");
		
		fileListPaths.forEach(p -> logger.info("p = " + p));
		
		//어제 등록된 파일들의 디렉터리
		File targetDir = Paths.get("C:\\proj_performance", getFolderYesterDay()).toFile();
		
		//삭제해야할 파일들
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		logger.info("-------------------------------------------------");
		for(File file : removeFiles) {
			logger.info("파일의 경로 = " + file.getAbsolutePath());
			//파일삭제
			file.delete();
		}
	}
	
	
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
}
