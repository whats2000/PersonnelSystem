package com.whats2000.model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

public class ModelTest {
    public static void main(String[] args) throws ParseException {
        // 創建人事記錄
        Personnel personnel = new Personnel("A123456", "123456");

        // Content 類定義
        Content content1 = new Content("Apple", 10); // 創建 Content 對象
        Content content2 = new Content("Pear", 20); // 創建另一個 Content 對象

        // 使用 Arrays.asList() 創建 Content 對象列表
        List<Content> contentList = Arrays.asList(content1, content2);;

        Address address1 = new Address("CityA", "StateA", "12345"); // 創建 Address A 對象
        Address address2 = new Address("CityB", "StateB", "67890"); // 創建 Address B 對象

        // 使用 Content 列表創建 Cargo 對象
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        Cargo cargo = new Cargo("001", contentList, formatter.parse("2023-12-01"), "None", formatter.parse("2023-12-13"), address1, address2);

        // 創建 CargoHistory 對象
        CargoHistory cargoHistory = new CargoHistory("Good", "2023-12-13", Timestamp.valueOf("2023-12-13 14:15:51"), cargo, personnel, address1, address2);

        cargo.addCHistory(cargoHistory); // 將 CargoHistory 對象添加到 Cargo 對象中

        // 模擬業務邏輯並輸出結果
        System.out.println("Personnel Info: " + personnel);
        System.out.println("Cargo Info: " + cargo);
        System.out.println("Cargo History Info: " + cargoHistory);
    }
}
