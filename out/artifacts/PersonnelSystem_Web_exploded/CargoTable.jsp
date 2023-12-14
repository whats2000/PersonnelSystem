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
        /* Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }
        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            border-radius: 5px;
            animation-name: modalOpen;
            animation-duration: 0.4s;
        }
        /* Modal opening animation */
        @keyframes modalOpen {
            from {top: -300px; opacity: 0}
            to {top: 0; opacity: 1}
        }

        /* Modal closing animation */
        .modal-closing {
            animation-name: modalClose;
            animation-duration: 0.4s;
        }
        /* Modal closing animation */
        @keyframes modalClose {
            from {top: 0; opacity: 1}
            to {top: -300px; opacity: 0}
        }
        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
        /* Modal Body */
        .modal-body {
            padding: 2px 16px;
        }
        /* Modal Footer */
        .modal-footer {
            padding: 2px 16px;
            border-radius: 5px;
            text-align: right;
        }
        button {
            padding: 10px 18px;
            background-color: #555;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #777;
        }
        .modal-body {
            padding: 20px;
            line-height: 1.6;
        }

        .modal-body p {
            margin: 10px 0;
            display: flex;
            align-items: center;
        }

        .modal-body p span {
            margin-left: 10px;
            font-weight: bold;
        }

        /* 增加標籤的加粗效果 */
        .modal-body p span.label {
            font-weight: normal;
            margin-right: 10px;
            min-width: 120px; /* 或者其他適合您設計的寬度 */
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

<!-- The Modal -->
<div id="goodsDetailModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">&times;</span>
            <h2>貨物詳細資訊</h2>
        </div>
        <div class="modal-body">
            <p><span class="label">貨物編號:</span><span id="goodsId">001</span></p>
            <p><span class="label">限制:</span><span id="goodsRestriction">易碎品</span></p>
            <p><span class="label">發貨日:</span><span id="shippingDate">2023-01-01</span></p>
            <p><span class="label">發貨地址:</span><span id="shippingAddress">台北市信義區市府路1號</span></p>
            <p><span class="label">預計送達日:</span><span id="estimatedDelivery">2023-01-05</span></p>
            <p><span class="label">收貨地址:</span><span id="receivingAddress">台北市信義區松智路20號</span></p>
            <p><span class="label">內容:</span><span id="goodsContent">書籍</span></p>
        </div>
        <div class="modal-footer">
            <button onclick="backToGoodsList()">返回貨物列表</button>
        </div>
    </div>

</div>

<script>
    // 這裡添加JavaScript函數來處理按鈕事件
    // Get the modal
    const modal = document.getElementById('goodsDetailModal');

    // Get the <span> element that closes the modal
    const span = document.getElementsByClassName("close")[0];

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
            modal.classList.remove("modal-closing");
            modal.style.display = "block";
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
        alert("開啟掃描功能尚未實現。");
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }

    function backToGoodsList() {
        // 返回貨物列表的邏輯
        // 使用動畫隱藏模態框
        modal.classList.add("modal-closing");
        setTimeout(() => {
            modal.style.display = "none";
            modal.classList.remove("modal-closing");
        }, 395); // 等待動畫完成
    }

    span.onclick = function() {
        // 使用動畫隱藏模態框
        modal.classList.add("modal-closing");
        setTimeout(() => {
            modal.style.display = "none";
            modal.classList.remove("modal-closing");
        }, 395); // 等待動畫完成
    }

    window.onclick = function(event) {
        if (event.target === modal) {
            // 使用動畫隱藏模態框
            modal.classList.add("modal-closing");
            setTimeout(() => {
                modal.style.display = "none";
                modal.classList.remove("modal-closing");
            }, 395); // 等待動畫完成
        }
    }
</script>

</body>
</html>
