package com.yi.domain;

public class NoticeAttachVO {	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;	//이미지 파일인지 구분하기 위한 변수
	private int noticeNo;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isFileType() {
		return fileType;
	}
	public void setFileType(boolean fileType) {
		this.fileType = fileType;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	@Override
	public String toString() {
		return String.format("NoticeAttachVO [uuid=%s, uploadPath=%s, fileName=%s, fileType=%s, noticeNo=%s]", uuid,
				uploadPath, fileName, fileType, noticeNo);
	}
	

	
	
}
