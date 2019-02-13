package com.yi.domain;

public class ManagerVO {
	private String managerCode;
	private String managerName;
	
	public ManagerVO() {
		// TODO Auto-generated constructor stub
	}

	public ManagerVO(String managerCode, String managerName) {
		this.managerCode = managerCode;
		this.managerName = managerName;
	}

	public String getManagerCode() {
		return managerCode;
	}

	public void setManagerCode(String managerCode) {
		this.managerCode = managerCode;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	@Override
	public String toString() {
		return String.format("ManagerVO [managerCode=%s, managerName=%s]", managerCode, managerName);
	}
	
	
}
