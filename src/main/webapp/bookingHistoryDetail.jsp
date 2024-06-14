<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                background: url('https://cdn.visordown.com/field/image/H2R-01.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Open Sans', sans-serif;
            }
            .booking-detail .detail-content p {
                margin-bottom: 1rem;
            }

            .booking-detail .detail-actions {
                display: flex;
                gap: 1rem;
            }

            .booking-detail .detail-actions button {
                padding: 0.5rem 1rem;
                border: none;
                cursor: pointer;
            }

            .booking-detail .detail-actions button:nth-child(1) {
                background-color: #ffc107;
            }

            .booking-detail .detail-actions button:nth-child(2) {
                background-color: #28a745;
            }

            .booking-detail .detail-actions button:nth-child(3) {
                background-color: #007BFF;
            }

            .booking-detail .detail-actions button:nth-child(4) {
                background-color: #6c757d;
            }

            .booking-detail .detail-actions button:hover {
                opacity: 0.9;
            }
            .extension-infooo {
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
                animation-name: fadeIn;
                animation-duration: 0.5s;
            }
            .extension-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 70%;
                animation-name: slideIn;
                animation-duration: 0.5s;
                animation-fill-mode: forwards;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            @keyframes slideIn {
                from {
                    transform: translateY(-250px);
                }
                to {
                    transform: translateY(0);
                }
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            .booking-detail {
                background: #fff;
                border-radius: 24px;
                box-shadow: 0px 0 2px 0 rgba(0,0,0,0.25);
                transform: translateX(-50%);
                animation-name: fadeIn;
                animation-duration: 1.5s;
                animation-fill-mode: forwards;
                padding: 31px;
                border: 3px solid #000;
                margin-top: 2rem;
                width: 45%;
                display: inline-block;
                position: relative;
                left: 50%;
            }
        </style>
    </head>
    <body>
        <section style="border: none" class="booking-detail" id="booking-detail">
            <h2 class="text-center mb-4">Chi Tiết Booking</h2>
            <div class="detail-content">
                <p><strong>Mã đơn:</strong> <span id="order-id">${booking.bookingID}</span></p>
                <p><strong>Tên các xe:</strong> <span id="vehicle-names">
                        <c:forEach var="entry" items="${motorcycleDetails}" varStatus="loop">
                            ${entry.key} (x${entry.value})
                            <c:if test="${not loop.last}">,</c:if>
                        </c:forEach>
                </p>
                <p><strong>Thời gian đặt xe: </strong>
                    <c:set var="bookingDate" value="${booking.bookingDate}" />
                    <c:set var="bookingYear" value="${fn:substring(bookingDate, 0, 4)}" />
                    <c:set var="bookingMonth" value="${fn:substring(bookingDate, 5, 7)}" />
                    <c:set var="bookingDay" value="${fn:substring(bookingDate, 8, 10)}" />
                    <c:set var="bookingHour" value="${fn:substring(bookingDate, 11, 13)}" />
                    <c:set var="bookingMinute" value="${fn:substring(bookingDate, 14, 16)}" />
                    <c:set var="bookingSecond" value="${fn:substring(bookingDate, 17, 19)}" />
                    ${bookingDay}-${bookingMonth}-${bookingYear} ${bookingHour}:${bookingMinute}:${bookingSecond}
                </p>
                <p><strong>Ngày bắt đầu: </strong><span id="start-date">
                        <c:set var="startDate" value="${booking.startDate}" />
                        <c:set var="startYear" value="${fn:substring(startDate, 0, 4)}" />
                        <c:set var="startMonth" value="${fn:substring(startDate, 5, 7)}" />
                        <c:set var="startDay" value="${fn:substring(startDate, 8, 10)}" />
                        <c:set var="startHour" value="${fn:substring(startDate, 11, 13)}" />
                        <c:set var="startMinute" value="${fn:substring(startDate, 14, 16)}" />
                        <c:set var="startSecond" value="${fn:substring(startDate, 17, 19)}" />
                        ${startDay}-${startMonth}-${startYear} ${startHour}:${startMinute}:${startSecond}
                    </span></p>
                <p><strong>Ngày trả xe: </strong><span id="end-date"> 
                        <c:set var="endDate" value="${booking.endDate}" />
                        <c:set var="endYear" value="${fn:substring(endDate, 0, 4)}" />
                        <c:set var="endMonth" value="${fn:substring(endDate, 5, 7)}" />
                        <c:set var="endDay" value="${fn:substring(endDate, 8, 10)}" />
                         <c:set var="endHour" value="${fn:substring(endDate, 11, 13)}" />
                        <c:set var="endMinute" value="${fn:substring(endDate, 14, 16)}" />
                        <c:set var="endSecond" value="${fn:substring(endDate, 17, 19)}" />
                        ${endDay}-${endMonth}-${endYear} ${endHour}:${endMinute}:${endSecond}
                    </span></p>
                <p><strong>Số lượng xe:</strong> <span id="vehicle-count">${fn:length(booking.listBookingDetails)}</span></p>
                <p><strong>Địa chỉ giao:</strong> <span id="delivery-address">${booking.deliveryLocation}</span></p>
                <p><strong>Địa chỉ trả:</strong> <span id="return-address">${booking.returnedLocation}</span></p>
                <p><strong>Trạng thái giao xe:</strong> <span style="color: red" id="delivery-status">${booking.deliveryStatus}</span></p>
                <p><strong>Tổng giá:</strong> <span id="total-price">
                        <c:set var="total" value="0"/>
                        <c:forEach items="${booking.listBookingDetails}" var="detail">
                            <c:set var="total" value="${total + detail.totalPrice}"/>
                        </c:forEach>
                        <fmt:formatNumber value="${total*1000}" type="currency" currencySymbol="VNĐ" />
                    </span> (Đã thanh toán: <span id="amount-paid">500,000 VND</span>)</span></p>
                <!--nếu đổi số > 500.000 sẽ có thanh toán :3 -->
                <a style="cursor: pointer; text-decoration: underline" onclick="openExtension()"><strong>Xem thông tin gia hạn </strong></a>    
                <p></p>

                <div class="extension-infooo" id="extension-info">
                    <div class="extension-content">
                        <span class="close" onclick="closeExtension()">&times;</span>
                        <c:choose>
                            <c:when test="${extension == null}">
                                <p>Không có thông tin gia hạn nào/</p>
                                <!--sửa lại chút chỗ này cho đẹp-->
                            </c:when>
                            <c:otherwise>
                                <h4 class="text-center">Thông tin gia hạn</h4>
                                <p><strong>Ngày gia hạn:</strong>
                                    <span id="extension-date">
                                        <c:set var="extensionDate" value="${extension.extensionDate}" />
                                        <c:set var="extYear" value="${fn:substring(extensionDate, 0, 4)}" />
                                        <c:set var="extMonth" value="${fn:substring(extensionDate, 5, 7)}" />
                                        <c:set var="extDay" value="${fn:substring(extensionDate, 8, 10)}" />
                                        <c:set var="extHour" value="${fn:substring(extensionDate, 11, 13)}" />
                                        <c:set var="extMinute" value="${fn:substring(extensionDate, 14, 16)}" />
                                        <c:set var="extSecond" value="${fn:substring(extensionDate, 17, 19)}" />
                                        ${extDay}-${extMonth}-${extYear} ${extHour}:${extMinute}:${extSecond}
                                    </span>
                                </p>

                                <p><strong>Ngày trả xe trước đó:</strong>
                                    <span id="previous-end-date">
                                        <c:set var="previousEndDate" value="${extension.previousEndDate}" />
                                        <c:set var="prevYear" value="${fn:substring(previousEndDate, 0, 4)}" />
                                        <c:set var="prevMonth" value="${fn:substring(previousEndDate, 5, 7)}" />
                                        <c:set var="prevDay" value="${fn:substring(previousEndDate, 8, 10)}" />
                                        <c:set var="prevHour" value="${fn:substring(previousEndDate, 11, 13)}" />
                                        <c:set var="prevMinute" value="${fn:substring(previousEndDate, 14, 16)}" />
                                        <c:set var="prevSecond" value="${fn:substring(previousEndDate, 17, 19)}" />
                                        ${prevDay}-${prevMonth}-${prevYear} ${prevHour}:${prevMinute}:${prevSecond}
                                    </span>
                                </p>

                                <p><strong>Ngày trả xe mới:</strong>
                                    <span id="new-end-date">
                                        <c:set var="newEndDate" value="${extension.newEndDate}" />
                                        <c:set var="newYear" value="${fn:substring(newEndDate, 0, 4)}" />
                                        <c:set var="newMonth" value="${fn:substring(newEndDate, 5, 7)}" />
                                        <c:set var="newDay" value="${fn:substring(newEndDate, 8, 10)}" />
                                        <c:set var="newHour" value="${fn:substring(newEndDate, 11, 13)}" />
                                        <c:set var="newMinute" value="${fn:substring(newEndDate, 14, 16)}" />
                                        <c:set var="newSecond" value="${fn:substring(newEndDate, 17, 19)}" />
                                        ${newDay}-${newMonth}-${newYear} ${newHour}:${newMinute}:${newSecond}
                                    </span>
                                </p>

                                <p><strong>Phí gia hạn:</strong>
                                    <span id="extension-fee">
                                        <fmt:formatNumber value="${extension.extensionFee}" type="currency" currencySymbol="VNĐ" />
                                    </span>
                                </p>

                                <p><strong>Mã đặt xe:</strong>
                                    <span id="booking-id">${extension.bookingID}</span>
                                </p>

                                <p><strong>Tổng giá mới:</strong>
                                    <span id="new-total-price">
                                        <c:set var="total" value="${total + extension.extensionFee}" />
                                        <fmt:formatNumber value="${total*1000}" type="currency" currencySymbol="VNĐ" />
                                    </span>
                                </p>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
            <div class="detail-actions">
                <button id="pay-btn">Thanh toán</button>
                <button onclick="openExtension()">Gia Hạn</button>
                <button id="rebook-btn">Đặt lại</button>
                <button onclick="closeDetail()">Quay về</button>
            </div>
        </section>


        <script>
            //demo dữ liệu
            const urlParams = new URLSearchParams(window.location.search);
            const orderId = urlParams.get('orderId');
            // document.getElementById('order-id').textContent = orderId;
            // document.getElementById("vehicle-names").textContent = vehicleNames;
            // document.getElementById("start-date").textContent = startDate;
            // document.getElementById("end-date").textContent = endDate;
            // document.getElementById("vehicle-count").textContent = vehicleCount;
            // document.getElementById("delivery-address").textContent = deliveryAddress;
            // document.getElementById("return-address").textContent = returnAddress;
            // document.getElementById("booking-status").textContent = bookingStatus;
            // document.getElementById("delivery-status").textContent = deliveryStatus;
            // document.getElementById("total-price").textContent = totalPrice;
            // document.getElementById("amount-paid").textContent = amountPaid;

            //đủ tiền thì k hiện thanh toán
            togglePayButton();
            function togglePayButton() {
                const payButton = document.getElementById("pay-btn");
                const amount = document.getElementById("amount-paid");
                const total = document.getElementById("total-price");

                const amountPaid = parseFloat(amount.textContent.replace(/[^\d.]/g, '')); //regex: xóa ký tự đb
                const totalPrice = parseFloat(total.textContent.replace(/[^\d.]/g, ''));

                if (amountPaid < totalPrice) {
                    payButton.style.display = "inline-block";
                } else {
                    payButton.style.display = "none";
                }
            }

            function openExtension() {
                document.getElementById('extension-info').style.display = 'block';
            }
            function closeExtension() {
                document.getElementById('extension-info').style.display = 'none';
            }
            function closeDetail() {
                window.location.href = 'bookingHistory.jsp';
            }
        </script>
    </body>
</html>