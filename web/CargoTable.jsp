<%@ page import="com.whats2000.model.Cargo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: eddie
  Date: 2023/12/14
  Time: 下午 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
        // 未登入，重定向到登入頁面
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>貨物列表</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 2em;
            border-radius: 5px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
        }
        h2 {
            text-align: center;
            margin-bottom: 1em;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1em;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .details-button {
            padding: 5px 10px;
            margin: 0;
            border: none;
            background-color: #337ab7;
            color: white;
            cursor: pointer;
            border-radius: 3px;
        }
        .details-button:hover {
            background-color: #286090;
        }
        .scan-button {
            padding: 10px 20px;
            border: none;
            background-color: #5cb85c;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1em;
            margin-top: 10px;
        }
        .scan-button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>貨物列表</h2>
    <table>
        <tr>
            <th>貨物編號</th>
            <th>貨物限制</th>
            <th>目的地</th>
            <th>操作</th>
        <!-- 在表格中動態展示貨物數據 -->
        <%
            List<Cargo> cargoList = (List<Cargo>) request.getAttribute("cargoList");
            if (cargoList != null) {
                for (Cargo cargo : cargoList) {
                    out.println("<tr>");
                    out.println("<td>" + cargo.getCargoNumber() + "</td>");
                    out.println("<td>" + cargo.getLimit() + "</td>");
                    out.println("<td>" + cargo.destination.toString() + "</td>");
                    out.println("<td><button class='details-button' onclick='viewGoodsDetails()'>瀏覽貨物細節</button></td>");
                    out.println("</tr>");
                }
            }
        %>

    </table>
    <div>
        <button class="scan-button" onclick="openScan()">開啟掃描</button>
    </div>
</div>

<script>
    // 這裡添加JavaScript函數來處理按鈕事件
    function viewGoodsDetails() {
        // 瀏覽貨物細節的邏輯
        alert("瀏覽貨物細節功能尚未實現。");
    }

    function openScan() {
        // 開啟掃描的邏輯
        alert("開啟掃描功能尚未實現。");
    }
</script>

</body>
</html>
