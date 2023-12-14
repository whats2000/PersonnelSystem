package com.whats2000.dao;

import com.whats2000.model.Cargo;
import com.whats2000.model.Content;

import java.util.List;

public class DAOTest {
    public static void main(String[] args) {
        try {
            // 替換為您的數據庫配置
            String jdbcURL = "jdbc:mariadb://localhost:3306/personnel";
            String jdbcUsername = "root";
            String jdbcPassword = "";

            CargoDAO cargoDao = new CargoDAO(jdbcURL, jdbcUsername, jdbcPassword);

            List<Cargo> cargos = cargoDao.listAllCargos();

            for (Cargo cargo : cargos) {
                System.out.println("Cargo Number: " + cargo.getCargoNumber());
                System.out.println("Estimated Delivery Date: " + cargo.getEstimatedDeliveryDate());
                System.out.println("Limit: " + cargo.getLimit());
                System.out.println("Shipping Date: " + cargo.shippingDate);
                System.out.println("Origin Address: " + cargo.origin.toString()); // 假設 Address 有 getCity 方法
                System.out.println("Destination Address: " + cargo.destination.toString());

                // 貨物內容列表
                for (Content content : cargo.getContent()) {
                    System.out.println("Content: " + content.toString());
                }

                System.out.println("-------------------------------");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

