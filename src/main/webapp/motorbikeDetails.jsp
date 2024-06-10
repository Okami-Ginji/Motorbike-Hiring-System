<%-- 
    Document   : motorbikeDetails
    Created on : May 29, 2024, 10:23:03 AM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Motorcycles Detail</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
            /* Wrapper to control size and center content */
            .img-wrapper {
                display: flex; /* Enables flexbox layout */
                justify-content: center; /* Centers the image horizontally */
                width: 80%; /* Full width of the parent container */
                margin-left: 10%;
                
            }
            
        </style>
    </head>
    <body>

        <jsp:include page="/includes/navbar.jsp" />

        <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/banner.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
                    <div class="col-md-9 ftco-animate pb-5">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Car details <i class="ion-ios-arrow-forward"></i></span></p>
                        <h1 class="mb-3 bread">Motorbike Details</h1>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section ftco-car-details">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 detail">
                        <div class="car-details">
                            <div class="img-wrapper">
                                <div class="img" style="background-image: url('images/${motorcycleDetail.image}');"></div>
                            </div>
                            <div class="text text-center">
                                <c:forEach var="brands" items="${brand}">
                                    <c:if test="${brands.brandID == motorcycleDetail.brandID}">
                                        <span class="subheading">${brands.brandName}</span>
                                    </c:if>
                                </c:forEach>
                                <h2>${motorcycleDetail.model}</h2>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <img src="images/bag.png" alt="Mileage Icon" style="width: 50px; height: 50px;">
                                    </div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Túi đựng giày
                                            <span>2 cái</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <img src="images/dungcu.png" alt="Mileage Icon" style="width: 50px; height: 50px;">
                                    </div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Bộ dụng cụ
                                            <span>1 bộ</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>    
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <img src="images/raincoat.png" alt="Mileage Icon" style="width: 50px; height: 50px;">
                                    </div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Áo mưa
                                            <span>2 cái</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>     
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <img src="images/mubaohiem.png" alt="Mileage Icon" style="width: 50px; height: 50px;">
                                    </div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Mũ bảo hiểm
                                            <span>2 cái</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>     
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <img src="images/gangtay.png" alt="Mileage Icon" style="width: 50px; height: 50px;">
                                    </div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Găng tay
                                            <span>2 đôi</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>     
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <img src="images/giakepdienthoai.png" alt="Mileage Icon" style="width: 50px; height: 50px;">
                                    </div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Kẹp điện thoại
                                            <span>1 cái</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>     
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 pills">
                        <div class="bd-example bd-example-tabs">
                            <div class="d-flex justify-content-center">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-pricing-tab" data-toggle="pill" href="#pills-pricing" role="tab" aria-controls="pills-pricing" aria-expanded="true">Pricing</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">Description</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="tab-content" id="pills-tabContent">

                                <div class="tab-pane fade show active" id="pills-pricing" role="tabpanel" aria-labelledby="pills-pricing-tab">
                                    <div class="container">
                                        <div class="row justify-content-center">
                                            <div class="col-md-8">
                                                <div class="card pricing-details">
                                                    <div class="card-header text-white text-center">
                                                        <h3>Pricing Details</h3>
                                                    </div>
                                                    <div class="card-body">
                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                <span>Price per day:</span>
                                                                <span class="price">${priceList.dailyPriceForDay}</span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                <span>Price per week:</span>
                                                                <span class="price">${priceList.dailyPriceForWeek}</span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                <span>Price per month:</span>
                                                                <span class="price">${priceList.dailyPriceForMonth}</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>






                                <div class="tab-pane fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
                                    <p>${motorcycleDetail.description}</p>

                                </div>



                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-no-pt">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                        <span class="subheading">Choose Car</span>
                        <h2 class="mb-2">Related Cars</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="car-wrap rounded ftco-animate">
                            <div class="img rounded d-flex align-items-end" style="background-image: url(images/car-1.jpg);">
                            </div>
                            <div class="text">
                                <h2 class="mb-0"><a href="car-single.html">Mercedes Grand Sedan</a></h2>
                                <div class="d-flex mb-3">
                                    <span class="cat">Cheverolet</span>
                                    <p class="price ml-auto">$500 <span>/day</span></p>
                                </div>
                                <p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a href="car-single.html" class="btn btn-secondary py-2 ml-1">Details</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="car-wrap rounded ftco-animate">
                            <div class="img rounded d-flex align-items-end" style="background-image: url(images/car-2.jpg);">
                            </div>
                            <div class="text">
                                <h2 class="mb-0"><a href="car-single.html">Range Rover</a></h2>
                                <div class="d-flex mb-3">
                                    <span class="cat">Subaru</span>
                                    <p class="price ml-auto">$500 <span>/day</span></p>
                                </div>
                                <p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a href="car-single.html" class="btn btn-secondary py-2 ml-1">Details</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="car-wrap rounded ftco-animate">
                            <div class="img rounded d-flex align-items-end" style="background-image: url(images/car-3.jpg);">
                            </div>
                            <div class="text">
                                <h2 class="mb-0"><a href="car-single.html">Mercedes Grand Sedan</a></h2>
                                <div class="d-flex mb-3">
                                    <span class="cat">Cheverolet</span>
                                    <p class="price ml-auto">$500 <span>/day</span></p>
                                </div>
                                <p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a href="car-single.html" class="btn btn-secondary py-2 ml-1">Details</a></p>
                            </div>
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
    <style>
        .pricing-details {
            background: #ffffff;
            border: 1px solid #e1e1e1;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .pricing-details:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .pricing-details .card-header {
            background: linear-gradient(to right, #1089FF 0%, #1089FF 28%, #01D28E 91%, #01D28E 100%);
            font-size: 1.75rem;
            padding: 1rem;
            border-bottom: none;
        }

        .pricing-details .card-body {
            padding: 2rem;
        }

        .pricing-details .list-group-item {
            font-size: 1.1rem;
            border: none;
            padding: 1rem 1.5rem;
            transition: background 0.3s ease-in-out;
        }

        .pricing-details .list-group-item:nth-child(even) {
            background-color: #f8f8f8;
        }

        .pricing-details .list-group-item:hover {
            background-color: #f1f1f1;
        }

        .pricing-details .price {
            font-weight: bold;
            color: #005cbf;
            font-size: 30px;
        }

    </style>
</html>
