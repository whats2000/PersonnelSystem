package com.whats2000.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author hsian
 * @version 1.0
 * @created 12-十二月-2023 下午 17:30:34
 */
public class Cargo {
	private String cargoNumber;
	private Date estimatedDeliveryDate;
	private String limit;
	private List<Content> mContent;
	public Address origin;
	public Address destination;
	public List<CargoHistory> mCargoHistory;
	public Date shippingDate;

	public Cargo(String cargoNumber, List<Content> mContent, Date estimatedDeliveryDate, String limit, Date shippingDate, Address origin, Address destination) {
		this.cargoNumber = cargoNumber;
		this.mContent = mContent;
		this.estimatedDeliveryDate = estimatedDeliveryDate;
		this.limit = limit;
		this.shippingDate = shippingDate;
		this.origin = origin;
		this.destination = destination;
		this.mCargoHistory = new ArrayList<>();
	}

	// Getters and setters for all properties
	public String getCargoNumber() {
		return cargoNumber;
	}

	public void setCargoNumber(String cargoNumber) {
		this.cargoNumber = cargoNumber;
	}

	public Date getEstimatedDeliveryDate() {
		return estimatedDeliveryDate;
	}

	public void setEstimatedDeliveryDate(Date estimatedDeliveryDate) {
		this.estimatedDeliveryDate = estimatedDeliveryDate;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public List<Content> getContent() {
		return mContent;
	}

	public void setContent(List<Content> mContent) {
		this.mContent = mContent;
	}

	public void addCHistory(CargoHistory history) {
		this.mCargoHistory.add(history);
	}

	public boolean readCargoList() {
		// TODO 添加從數據庫讀取貨物列表的邏輯
		return true;
	}

	public boolean updateCargoList() {
		// TODO 添加更新數據庫中貨物列表的邏輯
		return true;
	}
}
