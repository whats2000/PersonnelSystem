<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    session = request.getSession(false); // 獲取現有的 session，不創建新的
    if (session == null || session.getAttribute("user") == null) {
        // 沒有用戶登入，重定向到 Login.jsp
        response.sendRedirect("Login.jsp");
    } else {
        // 用戶已登入，重定向到 CargoTable.jsp
        response.sendRedirect("CargoTable.jsp");
    }
%>

<!-- 您的頁面內容 -->

