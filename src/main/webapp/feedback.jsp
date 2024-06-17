<%-- 
    Document   : feedback
    Created on : 16 thg 6, 2024, 07:01:43
    Author     : MINH TUAN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Motorcycle Rental Feedback</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                background: url('images/backgrFB.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Poppins', sans-serif;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #1C1D22;
            }

            .feedback-container {
                width: 46%;
                margin: 20px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                animation: fadeIn 1.5s ease-in-out;
            }

            .header {
                text-align: center;
                margin-bottom: 20px;
            }

            .product-info {
                display: flex;
                align-items: center;
                margin-top: 8px;
                margin-bottom: 28px;
            }

            .product-info img {
                width: 100px;
                height: 80px;
                border-radius: 8px;
                animation: fadeIn 1s ease-in-out;
            }

            .feedback-form {
                display: flex;
                flex-direction: column;
            }

            .rating-section, .service-rating, .delivery-speed {
                display: flex;
                align-items: center;
            }

            .rating-section label, .service-rating label, .delivery-speed label {
                width: 35%;
            }

            .rating-section .rating, .service-rating .rating, .delivery-speed .rating {
                width: 22%;
            }

            .rating-section, .additional-feedback, .submit-section, .service-rating, .delivery-speed {
                margin-bottom: 20px;
            }

            .rating .star {
                font-size: 24px;
                color: rgb(0 0 0 / 16%);
                cursor: pointer;
                transition: transform 0.2s, color 0.2s;
                margin-right: 3px;
            }

            .rating .star:hover,
            .rating .star.hovered {
                transform: scale(1.2);
                color: #ffb800;
                opacity: 0.5;
            }

            .rating .star.selected {
                color: #ffb800;
                transform: scale(1.2);
                opacity: 1;
            }

            .rating-text {
                margin-top: 5px;
                font-size: 16px;
                color: #555;
                transition: opacity 0.3s;
            }

            textarea {
                width: 100%;
                height: 60px;
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: border-color 0.3s;
            }

            textarea:focus {
                border-color: #007bff;
            }

            .submit-section {
                text-align: center;

            }

            .submit-section button {
                padding: 10px 20px;
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 18%;
                margin: 0px 60px;
                padding: 10px 0;
                transition: background-color 0.3s, transform 0.2s;
            }

            .submit-section button:hover {
                background-color: #218838;
                transform: scale(1.05);
            }

            @media (max-width: 768px) {
                .feedback-container {
                    width: 90%;
                }
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            /* Modal Styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                animation: fadeIn 0.5s ease-in-out;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 600px;
                border-radius: 8px;
                animation: slideIn 0.5s ease-in-out;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            @keyframes slideIn {
                from {
                    transform: translateY(-50%);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }
            .selected {
                color: gold;
            }

            .loading {
                position: absolute;
                z-index: 1;
                width: 100%;
                height: 100%;
                display: none;
                align-items:center;
                justify-content:center;
                background: rgba(0, 0, 0, 0.479);
            }
            .loading img{
                width: 7rem;
            }

            .star.readonly {
                pointer-events: none; /* Ngăn không cho các sự kiện chuột tương tác */
            }

        </style>
    </head>
    <body>
        <div class="loading" id="loading" >
            <img src="images/loading.gif" alt="loading">
        </div>
        <div class="feedback-container">
            <div class="header">
                <h1 class="fw-bold">Đánh giá dịch vụ thuê xe máy</h1>
            </div>
            <c:if test="${not empty sessionScope.feedbackResult}">
                <p style="color: green; font-style: italic; margin-bottom: 0">${sessionScope.feedbackResult}</p>
                <c:remove var="feedbackResult" scope="session"/>
                <script>
                    setTimeout(() => {
                        window.location.href = 'bookingHistory?status=all';
                    }, 3000);
                </script>
            </c:if>
            <c:if test="${not empty sessionScope.feedbackUpdate}">
                <p style="color: green; font-style: italic; margin-bottom: 0">${sessionScope.feedbackUpdate}</p>
                <c:remove var="feedbackUpdate" scope="session"/>
                <script>
                    setTimeout(() => {
                        window.location.href = 'bookingHistory?status=all';
                    }, 3000);
                </script>
            </c:if>
            <c:if test="${not empty sessionScope.feedbackFail}">
                <p style="color: red; font-style: italic; margin-bottom: 0">${sessionScope.feedbackFail}</p>
                <c:remove var="feedbackFail" scope="session"/>
            </c:if>

            <div class="product-info d-flex">
                <c:forEach var="motorcycle" items="${motorcycleBook}">

                    <img style="margin-bottom: 20px" src="images/${motorcycle.Image}" alt="Motorcycle">
                    <div>
                        <h5>${motorcycle.Model}</h5>
                        <h7>Phân loại: ${motorcycle.CategoryName}</h7><br>
                        <h7>Số lượng: ${motorcycle.Quantity}</h7>
                        <p>${text}</p>  
                    </div>
                </c:forEach>
            </div>
            <form class="feedback-form" id="feedback-form" action="feedback" method="post">
                <input type="hidden" name="bookingId" value="${booking.bookingID}" />
                <div class="rating-section">
                    <label for="product-quality">Chất lượng sản phẩm</label>
                    <div id="product-quality" class="rating d-flex">
                        <span class="star ${fb.productRate >= 1 ? 'selected' : ''}" name="product" data-value="1">&#9733;</span>
                        <span class="star ${fb.productRate >= 2 ? 'selected' : ''}" name="product" data-value="2">&#9733;</span>
                        <span class="star ${fb.productRate >= 3 ? 'selected' : ''}" name="product" data-value="3">&#9733;</span>
                        <span class="star ${fb.productRate >= 4 ? 'selected' : ''}" name="product" data-value="4">&#9733;</span>
                        <span class="star ${fb.productRate >= 5 ? 'selected' : ''}" name="product" data-value="5">&#9733;</span>
                    </div>
                    <span class="rating-text"></span>
                </div>
                <div class="service-rating">
                    <label for="service-rating">Dịch vụ của chúng tôi</label>
                    <div id="service-rating" class="rating d-flex">
                        <span class="star ${fb.serviceRate >= 1 ? 'selected' : ''}" data-value="1" name="service">&#9733;</span>
                        <span class="star ${fb.serviceRate >= 2 ? 'selected' : ''}" data-value="2" name="service">&#9733;</span>
                        <span class="star ${fb.serviceRate >= 3 ? 'selected' : ''}" data-value="3" name="service">&#9733;</span>
                        <span class="star ${fb.serviceRate >= 4 ? 'selected' : ''}" data-value="4" name="service">&#9733;</span>
                        <span class="star ${fb.serviceRate >= 5 ? 'selected' : ''}" name="service" data-value="5">&#9733;</span>
                    </div>
                    <span class="rating-text"></span>
                </div>
                <div class="delivery-speed">
                    <label for="delivery-speed">Tốc độ giao hàng</label>
                    <div id="delivery-speed" class="rating d-flex">
                        <span class="star ${fb.deliveryRate >= 1 ? 'selected' : ''}" data-value="1" name="delivery">&#9733;</span>
                        <span class="star ${fb.deliveryRate >= 2 ? 'selected' : ''}" data-value="2" name="delivery">&#9733;</span>
                        <span class="star ${fb.deliveryRate >= 3 ? 'selected' : ''}" data-value="3" name="delivery">&#9733;</span>
                        <span class="star ${fb.deliveryRate >= 4 ? 'selected' : ''}" data-value="4" name="delivery">&#9733;</span>
                        <span class="star ${fb.deliveryRate >= 5 ? 'selected' : ''}" data-value="5" name="delivery">&#9733;</span>
                    </div>
                    <span class="rating-text"></span>
                </div>

                <div class="additional-feedback">
                    <label for="general-feedback">Nhận xét chung:</label>
                    <textarea id="general-feedback" name="content" style="margin-top: 12px; width: 665px; height: 128px;" value="${fb.content}" placeholder="Hãy chia sẻ nhận xét cho sản phẩm này bạn nhé!">${fb.content}</textarea>
                </div>

                <div id="submit-feedback" class="submit-section">
                    <c:if test="${fb.productRate == null && fb.serviceRate == null && fb.deliveryRate == null}">
                        <button type="submit" onclick="submitForm()">Gửi</button>
                    </c:if>
                    <c:if test="${fb.productRate != null && fb.serviceRate != null && fb.deliveryRate != null}">
                        <button onclick="submitForm()" type="button" id="edit-feedback">Sửa đánh giá</button>
                    </c:if>
                    <button type="button" onclick="closeFeedback()">Quay về</button>
                </div>
                <input type="hidden" id="productRating" name="product" value="${fb.productRate}">
                <input type="hidden" id="serviceRating" name="service" value="${fb.serviceRate}">
                <input type="hidden" id="deliveryRating" name="delivery" value="${fb.deliveryRate}">
            </form>
        </div>

        <!-- Modal -->
        <div id="modal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p id="modal-message"></p>
            </div>
        </div>

        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', () => {

                const stars = document.querySelectorAll('.rating .star');
                const ratingTexts = {
                    1: 'Tệ',
                    2: 'Kém',
                    3: 'Bình thường',
                    4: 'Tốt',
                    5: 'Tuyệt vời'
                };
                stars.forEach(star => {
                    star.addEventListener('mouseover', () => {
                        const ratingValue = star.getAttribute('data-value');
                        const parent = star.parentElement;
                        let siblings = parent.children;
                        for (let sibling of siblings) {
                            sibling.classList.remove('hovered');
                            if (sibling.getAttribute('data-value') <= ratingValue) {
                                sibling.classList.add('hovered');
                            }
                        }
                    });
                    star.addEventListener('mouseleave', () => {
                        stars.forEach(s => s.classList.remove('hovered'));
                    });
                    star.addEventListener('click', () => {
                        const ratingValue = star.getAttribute('data-value');
                        const parent = star.parentElement;
                        const ratingText = parent.nextElementSibling;
                        let siblings = parent.children;
                        for (let sibling of siblings) {
                            sibling.classList.remove('selected');
                            if (sibling.getAttribute('data-value') <= ratingValue) {
                                sibling.classList.add('selected');
                            }
                        }

                        ratingText.textContent = ratingTexts[ratingValue];
                        ratingText.style.opacity = 1;
                        const ratingType = star.getAttribute('name'); // Lấy loại đánh giá từ name
                        const hiddenInput = document.getElementById(ratingType + 'Rating'); // Đặt id cho input ẩn là productRating, serviceRating, deliveryRating, v.v...
                        if (hiddenInput) {
                            hiddenInput.value = ratingValue;
                        }
                    });
                });
            });
            function closeFeedback() {
                window.location.href = 'bookingHistory?status=all';
            }

            const iconLoading = document.getElementById("loading");
            const showLoading = () => {
                iconLoading.style.display = "flex";
            };

            function submitForm() {
                showLoading();
                document.getElementById('feedback-form').submit();
            }
        </script>
    </body>
</html>

