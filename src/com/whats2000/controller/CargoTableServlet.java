package com.whats2000.controller;

import com.whats2000.dao.CargoDAO;
import com.whats2000.model.Cargo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class CargoTableServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 獲取貨物數據
        List<Cargo> cargoList; // 假設 fetchCargoData() 是從數據庫中獲取數據的方法
        try {
            cargoList = fetchCargoData();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // 將數據存儲在請求屬性中
        request.setAttribute("cargoList", cargoList);

        // 請求轉發到 JSP 頁面
        RequestDispatcher dispatcher = request.getRequestDispatcher("CargoTable.jsp");
        dispatcher.forward(request, response);
    }

    // 模擬從數據庫獲取貨物數據的方法
    private List<Cargo> fetchCargoData() throws SQLException {
        String jdbcURL = "jdbc:mariadb://localhost:3306/personnel";
        String jdbcUsername = "root";
        String jdbcPassword = "";

        CargoDAO cargoDao = new CargoDAO(jdbcURL, jdbcUsername, jdbcPassword);

        return cargoDao.listAllCargos();
    }
}
