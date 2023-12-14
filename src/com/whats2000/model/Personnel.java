package com.whats2000.model;


/**
 * @author hsian
 * @version 1.0
 * @created 12-十二月-2023 下午 17:30:34
 */
public class Personnel {
	private String personnelNumber;
	private String personnelPassword;

	public Personnel(String personnelNumber, String personnelPassword) {
		this.personnelNumber = personnelNumber;
		this.personnelPassword = personnelPassword;
	}

	public String getPersonnelNumber() {
		return personnelNumber;
	}

	public void setPersonnelNumber(String personnelNumber) {
		this.personnelNumber = personnelNumber;
	}

	public String getPersonnelPassword() {
		return personnelPassword;
	}

	public void setPersonnelPassword(String personnelPassword) {
		this.personnelPassword = personnelPassword;
	}

	public boolean writeInformation() {
		// TODO 添加從數據庫寫入人員信息的邏輯
		return true;
	}

	public boolean updatePersonnelInformation() {
		// TODO 添加更新數據庫中人員信息的邏輯
		return true;
	}
}
