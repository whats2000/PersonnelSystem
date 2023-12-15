<%--
  Created by IntelliJ IDEA.
  User: eddie
  Date: 2023/12/15
  Time: 上午 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<style>
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
        background-color: rgb(0, 0, 0); /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
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
        from {
            top: -300px;
            opacity: 0
        }
        to {
            top: 0;
            opacity: 1
        }
    }

    /* Modal closing animation */
    .modal-closing {
        animation-name: modalClose;
        animation-duration: 0.4s;
    }

    /* Modal closing animation */
    @keyframes modalClose {
        from {
            top: 0;
            opacity: 1
        }
        to {
            top: -300px;
            opacity: 0
        }
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
    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
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

    span.onclick = function () {
        // 使用動畫隱藏模態框
        modal.classList.add("modal-closing");
        setTimeout(() => {
            modal.style.display = "none";
            modal.classList.remove("modal-closing");
        }, 395); // 等待動畫完成
    }

    window.onclick = function (event) {
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
