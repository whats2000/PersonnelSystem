<%--
  Created by IntelliJ IDEA.
  User: eddie
  Date: 2023/12/14
  Time: 下午 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>登入介面</title>
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
        form {
            background: #fff;
            padding: 2em;
            border-radius: 5px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 1em;
        }
        .form-group {
            margin-bottom: 1em;
        }
        label {
            display: block;
            margin-bottom: .5em;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: .5em;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: .5em;
            border: none;
            background-color: #5cb85c;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1em;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>

<!-- 登入表單 -->
<form action="${pageContext.request.contextPath}/submitLoginInfo" method="post">
    <h2>用戶登入</h2>

    <% if ("true".equals(request.getParameter("error"))) { %>
    <p style="color: red;">用戶名或密碼錯誤！</p>
    <% } %>

    <div class="form-group">
        <label for="username">用戶名:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
        <label for="password">密碼:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div class="form-group">
        <input type="submit" value="登入">
    </div>
</form>

</body>
</html>
