package com.yi.domain;

public class GradeVO {
	private String gradeCode;
	private String gradeName;
	
	public String getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
	@Override
	public String toString() {
		return String.format("GradeVO [gradeCode=%s, gradeName=%s]", gradeCode, gradeName);
	}
	
	
}
