package com.whats2000.model;


/**
 * @author hsian
 * @version 1.0
 * @created 12-�Q�G��-2023 �U�� 17:30:34
 */
public class Address {

	private String city;
	private String street;
	private String unitNumber;

	public Address(String city, String street, String unitNumber) {
		this.city = city;
		this.street = street;
		this.unitNumber = unitNumber;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getUnitNumber() {
		return unitNumber;
	}

	public void setUnitNumber(String unitNumber) {
		this.unitNumber = unitNumber;
	}

	public boolean writeAddress() {
		// TODO �K�[��ڪ��g�J�޿�
		return true;
	}

	public boolean updateAddress(String city, String street, String unitNumber) {
		// TODO �K�[�]�w�a�}���޿�
		return true;
	}

	@Override
	public String toString() {
		return city + '/' + street + '/' + unitNumber;
	}
}
