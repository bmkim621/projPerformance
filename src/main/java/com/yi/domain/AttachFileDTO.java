package com.yi.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String fileName;	//원본 파일의 이름
	private String uploadPath;	//업로드 경로
	private String uuid;		//UUID의 값
	private boolean image;		//이미지 여부
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return String.format("AttachFileDTO [fileName=%s, uploadPath=%s, uuid=%s, image=%s]", fileName, uploadPath,
				uuid, image);
	}
	
	
	
	
}
