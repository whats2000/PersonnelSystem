package com.whats2000.controller;

import com.whats2000.dao.PersonnelDAO;
import com.whats2000.model.Personnel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {
    private PersonnelDAO personnelDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 使用適當的數據庫設置初始化 DAO
        this.personnelDAO = new PersonnelDAO("jdbc:mariadb://localhost:3306/personnel", "root", "");

        // 這裡添加您的驗證邏輯
        boolean isValidUser;

        try {
            isValidUser = checkUser(username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (isValidUser) {
            // 獲取當前會話，如果不存在，則創建一個新的會話
            HttpSession session = request.getSession(true);

            // 在 session 中保存用戶信息
            session.setAttribute("user", username); // 或者保存一個更復雜的用戶對象

            // 登入成功，轉發請求到 CargoTableServlet
            request.getRequestDispatcher("CargoTableServlet").forward(request, response);
        } else {
            // 驗證失敗的處理
            response.sendRedirect("Login.jsp?error=true"); // 或其他登入頁面
        }
    }

    private boolean checkUser(String username, String password) throws SQLException {
        Personnel personnel = personnelDAO.readPersonnelInformation(username);
        return personnel != null && personnel.getPersonnelPassword().equals(password);
    }
}
