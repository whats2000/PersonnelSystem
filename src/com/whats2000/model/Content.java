package com.whats2000.model;

/**
 * @author eddie
 * @version 1.0
 * @created 12-十二月-2023 下午 17:30:34
 */
public class Content {
    private String cargoName;
    private int quantity;

    public Content(String cargoName, int quantity) {
        this.cargoName = cargoName;
        this.quantity = quantity;
    }

    public String getCargoName() {
        return cargoName;
    }

    public void setCargoName(String cargoName) {
        this.cargoName = cargoName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean writeContent() {
        // TODO 添加寫入内容信息的邏輯
        return true;
    }

    public boolean updateContent(String cargoName, int quantity) {
        // TODO 添加更新内容信息的邏輯
        this.cargoName = cargoName;
        this.quantity = quantity;
        return true;
    }

    @Override
    public String toString() {
        return cargoName + " x " + quantity;
    }
}
