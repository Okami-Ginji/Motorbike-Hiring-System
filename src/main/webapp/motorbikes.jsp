<%-- 
    Document   : motorbikes
    Created on : May 25, 2024, 5:01:05 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="/includes/header.jsp" />

        <!-- thanh search -->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <style>
            /* Reset some basic styles for the pagination list */
            .pagination {
                display: flex;
                justify-content: center;
                display: inline-flex;
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            .page-item {
                margin: 0 5px;
            }

            .page-link {
                display: block;
                padding: 8px 16px;
                color: #007bff;
                text-decoration: none;
                border: 1px solid #dee2e6;
                border-radius: 4px;
                transition: background-color 0.3s, color 0.3s;
            }

            .page-link:hover {
                background-color: #007bff;
                color: white;
            }

            .page-item.active .page-link {
                background-color: #007bff;
                color: white;
                border-color: #007bff;
            }

            .page-item.disabled .page-link {
                color: #6c757d;
                pointer-events: none;
                cursor: not-allowed;
                background-color: #e9ecef;
                border-color: #dee2e6;
            }

        </style>
    </head>

    <body>

        <jsp:include page="/includes/navbar.jsp" />


        <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_3.jpg');"
                 data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
                    <div class="col-md-9 ftco-animate pb-5">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i
                                        class="ion-ios-arrow-forward"></i></a></span> <span>Cars <i
                                    class="ion-ios-arrow-forward"></i></span></p>
                        <h1 class="mb-3 bread">Choose Your Car</h1>
                    </div>
                </div>
            </div>
        </section>

        <!-- thanh search -->
        <section class="">
            <div class="flight-engine">
                <div class="container">
                    <div class="tabing">
                        <ul>
                            <li><a class="active" href="#1"><i class="" aria-hidden="true"></i>Motorbike</a>
                                <!-- </li>
        <li><a href="#2"><i class="fa fa-plane" aria-hidden="true"></i> Flight</a>
        </li> -->
                        </ul>
                        <div class="tab-content">
                            <div id="1" class="tab1 active">
                                <div class="flight-tab row">
                                    <div class="persent-one">
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                        <input type="text" name="dep" class="textboxstyle" id="dep"
                                               placeholder="From City or airport">
                                    </div>
                                    <div class="persent-one">
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                        <input type="text" name="dep" class="textboxstyle" id="arival"
                                               placeholder="To City or airport">
                                    </div>
                                    <div class="persent-one less-per">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        <input type="text" name="dep" class="textboxstyle" id="from-date1"
                                               placeholder="Depart">
                                    </div>
                                    <div class="persent-one less-per">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        <input type="text" name="dep" class="textboxstyle" id="to-date"
                                               placeholder="Returrn">
                                    </div>
                                    <div class="persent-one">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <div class="textboxstyle" id="passenger">01 Passenger</div>
                                    </div>
                                    <div class="persent-one less-btn">
                                        <input type="Submit" name="submit" value="Search" class="btn btn-info cst-btn"
                                               id="srch">
                                    </div>
                                </div>
                                <!-- flight tab -->
                            </div>
                            <!-- tab 1 -->
                            <div id="2" class="tab1">
                                <div class="flight-tab row">
                                    <div class="persent-one">
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                        <input type="text" name="dep" class="textboxstyle" id="dep"
                                               placeholder="From City or airport">
                                    </div>
                                    <div class="persent-one">
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                        <input type="text" name="dep" class="textboxstyle" id="arival"
                                               placeholder="To City or airport">
                                    </div>
                                    <div class="persent-one less-per">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        <input type="text" name="dep" class="textboxstyle" id="from-date1"
                                               placeholder="Depart">
                                    </div>
                                    <div class="persent-one less-per">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        <input type="text" name="dep" class="textboxstyle" id="to-date"
                                               placeholder="Return">
                                    </div>
                                    <div class="persent-one">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <div class="textboxstyle" id="passenger">01 Passenger</div>
                                    </div>
                                    <div class="persent-one less-btn">
                                        <input type="Submit" name="submit" value="Search" class="btn btn-info cst-btn"
                                               id="srch">
                                    </div>
                                </div>
                                <!-- flight tab -->
                            </div>
                            <!-- tab 1 -->
                        </div>
                    </div>
                    <!-- tab content -->
                </div>
                <!-- tabbing -->
            </div>
        </section>
        <!-- end search -->
        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row">
                    <c:forEach var="motorbike" items="${motorcycles}">
                        <div class="col-lg-4">
                            <div class="car-wrap rounded ftco-animate">
                                <div class="img rounded d-flex align-items-end"
                                     style="background-image: url('images/${motorbike.image}');">
                                </div>
                                <div class="text">
                                    <h2 class="mb-0">
                                        <a href="motorcycleDetail?id=${motorbike.motorcycleId}">${motorbike.model}</a>
                                    </h2>
                                    <div class="d-flex mb-3">
                                        <!-- Category Name -->
                                        <span class="cat">${categoryMap[motorbike.categoryID]}</span>

                                        <!-- Price -->
                                        <span class="price ml-auto">${priceMap[motorbike.priceListID]}/ngày</span>
                                    </div>
                                    <p class="d-flex mb-0 d-block">
                                        <a href="#" class="btn btn-primary py-2 mr-1">Book now</a>
                                        <a href="motorcycleDetail?id=${motorbike.motorcycleId}" class="btn btn-secondary py-2 ml-1">Details</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul class="pagination">
                                <c:forEach begin="1" end="${endP}" var="i">
                                    <li class="page-item ${currentIndex == i ? 'active' : ''}">
                                        <a class="page-link" href="motorcycle?index=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>

        </section>
        <jsp:include page="/includes/footer.jsp" />



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>


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
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>
