<%-- 
    Document   : pricing
    Created on : May 25, 2024, 4:59:34 PM
    Author     : DiepTCNN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Giá</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="website icon" type="png" href="images\logo.png">
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            .banner-image img {
                object-fit: contain;
            }
            .timeline1{
                background: radial-gradient(circle at 10% 20%, rgb(0, 93, 133) 0%, rgb(0, 181, 149) 90%);
            }
            .timeline2{
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
            }
            .timeline3{
                background: linear-gradient(91.9deg, rgb(94, 124, 121) 4.4%, rgb(64, 224, 208) 89%);
            }
            .rentalNow:hover{
                background: linear-gradient(178.6deg, rgb(232, 245, 253) 3.3%, rgb(252, 253, 255) 109.6%) !important;
            }
            .tablePrice{
                background-color: black !important;
            }
            .rentalButton a{
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%) !important;
            }

            .section-title h2 {
                font-size: 32px;
                font-weight: 700;
                text-transform: uppercase;
                margin-bottom: 20px;
                padding-bottom: 0;
                position: relative;
                z-index: 2;
            }
            .section-title span {
                position: absolute;
                top: 4px;
                color:color-mix(in srgb, var(--heading-color), transparent 95%);
                left: 0;
                right: 0;
                z-index: 1;
                font-weight: 700;
                font-size: 52px;
                text-transform: uppercase;
                line-height: 1;
            }
        </style>
    </head>
    <body>

        <jsp:include page="/includes/navbar2.jsp" />


        <section class="ftco-section ftco-cart">
            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <span>Bảng giá xe máy<br></span>
                <h2>Bảng giá xe máy</h2>
            </div><!-- End Section Title -->
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="car-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th class="timeline1">Thuê theo ngày</th>
                                        <th class="timeline2">Thuê theo tuần</th>
                                        <th class="timeline3">Thuê theo tháng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listM}" var="m">
                                        <tr class="tablePrice">
                                            <c:forEach items="${listP}" var="p">
                                                <c:if test="${p.priceListId == m.priceListID}">
                                                    <td class="car-image">
                                                        <div class="img banner-image">
                                                            <img src="images/${m.image}" width="100%" height="100%" alt="alt"/>
                                                        </div></td>
                                                    <td class="product-name">
                                                        <h3>${m.model}</h3>
                                                    </td>

                                                    <td class="price rentalNow">
                                                        <p class="btn-custom rentalButton"><a href="booking?motorcycleid=${m.motorcycleId}">Thuê xe máy</a></p>
                                                        <div class="price-rate">
                                                            <h3>
                                                                <span class="num"><fmt:formatNumber value="${p.dailyPriceForDay * 1000}" type="currency" currencySymbol="VNĐ" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" /></span>
                                                                <span class="per">/ngày</span>
                                                            </h3>
                                                            <span class="subheading">Có thiết bị đi kèm</span>
                                                        </div>
                                                    </td>

                                                    <td class="price rentalNow">
                                                        <p class="btn-custom rentalButton"><a href="booking?motorcycleid=${m.motorcycleId}">Thuê xe máy</a></p>
                                                        <div class="price-rate">
                                                            <h3>
                                                                <span class="num"><fmt:formatNumber value="${p.dailyPriceForWeek * 1000}" type="currency" currencySymbol="VNĐ" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" /></span>
                                                                <span class="per">/tuần</span>
                                                            </h3>
                                                            <span class="subheading">Có thiết bị đi kèm</span>
                                                        </div>
                                                    </td>

                                                    <td class="price rentalNow">
                                                        <p class="btn-custom rentalButton"><a href="booking?motorcycleid=${m.motorcycleId}">Thuê xe máy</a></p>
                                                        <div class="price-rate">
                                                            <h3>
                                                                <span class="num"><fmt:formatNumber value="${p.dailyPriceForMonth * 1000}" type="currency" currencySymbol="VNĐ" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" /></span>
                                                                <span class="per">/tháng</span>
                                                            </h3>
                                                            <span class="subheading">Có thiết bị đi kèm</span>
                                                        </div>
                                                    </td>
                                                </tr><!-- END TR-->
                                            </c:if>
                                        </c:forEach> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="/includes/footer.jsp" />



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>