package com.whats2000.model;


/**
 * @author hsian
 * @version 1.0
 * @created 12-�Q�G��-2023 �U�� 17:30:34
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
		// TODO �K�[�q�ƾڮw�g�J�H���H�����޿�
		return true;
	}

	public boolean updatePersonnelInformation() {
		// TODO �K�[��s�ƾڮw���H���H�����޿�
		return true;
	}
}
