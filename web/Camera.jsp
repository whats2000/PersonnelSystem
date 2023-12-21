<%--
  Created by IntelliJ IDEA.
  User: eddie
  Date: 2023/12/15
  Time: 上午 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<style>
    .camera-ui img {
        width: 100%; /* 使圖片填充整個 camera-ui 容器 */
        height: auto; /* 保持圖片的原始比例 */
        border-radius: 5px; /* 如果需要，可以為圖片添加圓角 */
    }

    .scan-modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
        padding-top: 60px;
    }

    .scan-modal-content {
        position: relative;
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 400px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        animation-name: scanModalOpen; /* New animation for opening */
        animation-duration: 0.4s;
    }

    /* Scan Modal Opening Animation */
    @keyframes scanModalOpen {
        from {
            top: -300px;
            opacity: 0;
        }
        to {
            top: 0;
            opacity: 1;
        }
    }

    /* Scan Modal Closing Animation */
    .scan-modal-closing {
        animation-name: scanModalClose;
        animation-duration: 0.4s;
    }

    @keyframes scanModalClose {
        from {
            top: 0;
            opacity: 1;
        }
        to {
            top: -300px;
            opacity: 0;
        }
    }

    .scan-btn {
        padding: 10px 20px;
        background: #5cb85c;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
    }

    .scan-btn:hover {
        background: #4cae4c;
    }
</style>

<div id="scanModal" class="scan-modal">
    <div class="scan-modal-content">
        <div class="camera-ui">
            <img src="static/image/camera-preview.jpg" alt="Camera Preview">
            <button class="scan-btn" onclick="updateGoodsData()">更新貨物資料</button>
            <button class="close-btn" onclick="backToGoodsListFromCamera()">返回貨物列表</button>
        </div>
    </div>
</div>

<script>
    // JavaScript
    const scanModal = document.getElementById('scanModal');

    function updateGoodsData() {
        alert("掃描功能尚未實現。");
    }

    function backToGoodsListFromCamera(){
        // Close modal with animation
        scanModal.classList.add("scan-modal-closing");
        setTimeout(function () {
            scanModal.style.display = "none";
            scanModal.classList.remove("scan-modal-closing");
        }, 395); // Duration of the closing animation
    }
</script>

