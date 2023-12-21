<%@ page import="com.whats2000.model.Cargo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%--
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
        </tr>
        <%
            List<Cargo> cargoList = (List<Cargo>) request.getAttribute("cargoList");
            if (cargoList != null) {
                for (Cargo cargo : cargoList) {
                    out.println("<tr>");
                    out.println("<td>" + cargo.getCargoNumber() + "</td>");
                    out.println("<td>" + cargo.getLimit() + "</td>");
                    out.println("<td>" + cargo.destination.toString() + "</td>");
                    out.println("<td><button class='details-button' onclick='viewGoodsDetails(\"" + cargo.getCargoNumber() + "\")'>瀏覽貨物細節</button></td>");
                    out.println("</tr>");
                }
            }
        %>
    </table>
    <div>
        <button class="scan-button" onclick="openScan()">開啟掃描</button>
    </div>
</div>

<!-- 引入模態框 -->
<jsp:include page="CargoDetail.jsp"/>

<!-- 引入掃描 -->
<jsp:include page="Camera.jsp" />

<script>
    // 這裡添加JavaScript函數來處理按鈕事件
    // Get the modal
    const modalDetail = document.getElementById('goodsDetailModal');
    const modalScan = document.getElementById('scanModal');

    function viewGoodsDetails(cargoNumber) {
        // 在 cargoList 中找到對應的貨物
        const cargoList = <%= new Gson().toJson(cargoList) %>;
        const cargo = cargoList?.find(c => c["cargoNumber"] === cargoNumber);

        if (cargo) {
            // 更新模態框內容
            document.getElementById('goodsId').innerText = cargo["cargoNumber"];
            document.getElementById('goodsRestriction').innerText = cargo["limit"];
            document.getElementById('shippingDate').innerText = cargo["shippingDate"];
            document.getElementById('shippingAddress').innerText = formatAddress(cargo["origin"]);
            document.getElementById('estimatedDelivery').innerText = cargo["estimatedDeliveryDate"];
            document.getElementById('receivingAddress').innerText = formatAddress(cargo["destination"]);
            document.getElementById('goodsContent').innerText = formatContentList(cargo["mContent"]);

            // 顯示模態框
            // 顯示模態框並應用動畫
            modalDetail.classList.remove("modal-closing");
            modalDetail.style.display = "block";
        } else {
            alert("找不到指定的貨物詳細信息。");
        }
    }

    function formatAddress(addressObj) {
        // 假設 addressObj 是一個包含 city 和 street 屬性的對象
        return addressObj ? addressObj["city"] + " / " + addressObj["street"] + " / " + addressObj["unitNumber"] : "";
    }

    function formatContentList(contentList) {
        // 假設 contentList 是一個包含多個內容對象的陣列
        return contentList ? contentList.map(content => content["cargoName"] + " (數量: " + content["quantity"] + ")").join(", ") : "";
    }

    function openScan() {
        // 開啟掃描的邏輯
        modalScan.classList.remove("modal-closing");
        modalScan.style.display = "block";
    }
</script>

</body>
</html>
