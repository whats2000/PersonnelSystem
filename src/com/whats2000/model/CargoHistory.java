package com.whats2000.model;


import java.sql.Timestamp;

/**
 * @author hsian
 * @version 1.0
 * @created 12-十二月-2023 下午 17:30:34
 */
public class CargoHistory {

	private String currentState;
	private int historyNumber;
	private Timestamp timeOfArrival;
	private Cargo mCargo;
	private Personnel mPersonnel;
	public Address origin;
	public Address destination;

	public CargoHistory(String currentState, int historyNumber, Timestamp timeOfArrival, Cargo mCargo, Personnel mPersonnel, Address origin, Address destination) {
		this.currentState = currentState;
		this.historyNumber = historyNumber;
		this.timeOfArrival = timeOfArrival;
		this.mCargo = mCargo;
		this.mPersonnel = mPersonnel;
		this.origin = origin;
		this.destination = destination;
	}

	public String getCurrentState() {
		return currentState;
	}

	public void setCurrentState(String currentState) {
		this.currentState = currentState;
	}

	public int getHistoryNumber() {
		return historyNumber;
	}

	public void setHistoryNumber(int historyNumber) {
		this.historyNumber = historyNumber;
	}

	public Timestamp getTimeOfArrival() {
		return timeOfArrival;
	}

	public void setTimeOfArrival(Timestamp timeOfArrival) {
		this.timeOfArrival = timeOfArrival;
	}

	public Cargo getCargo() { return mCargo;}

	public void setCargo(Cargo mCargo) { this.mCargo = mCargo;}

	public Personnel getPersonnel() { return mPersonnel;}

	public void setPersonnel(Personnel mPersonnel) { this.mPersonnel = mPersonnel;}

	public boolean writeCargoHistory() {
		// TODO 添加寫入貨物歷史信息的邏輯
		return true;
	}

	public boolean updateCargoHistory(String currentState, int historyNumber, Timestamp timeOfArrival) {
		// 添加設定貨物歷史信息的邏輯
		this.currentState = currentState;
		this.historyNumber = historyNumber;
		this.timeOfArrival = timeOfArrival;
		return true;
	}
}
