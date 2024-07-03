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
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

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
                animation-name: fadeIn;
                animation-duration: 0.5s;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 70%;
                transform: translateY(-200px);
                animation-name: slideIn;
                animation-duration: 0.5s;
                animation-fill-mode: forwards;
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
                    transform: translateY(-200px);
                }
                to {
                    transform: translateY(0);
                }
            }
            .title h2 {
                letter-spacing: 2px;
            }
            .title {
                margin-bottom: 50px;
            }
            .priceAcc {
                margin-top: 15rem;
                font-style: italic;
            }
            .icon:hover {
                opacity: 0.7;
                cursor: pointer;
            }

            .img img{
                object-fit: contain;
            }
            .banner-image img {
                object-fit: contain;
            }
        </style>
    </head>
    <body>

        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />


        <section class="ftco-section ftco-car-details">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 detail">
                        <div class="car-details">
                            <div class="img-wrapper animate__animated animate__zoomIn">
                                <div class="img banner-image">
                                    <img src="images/${motorcycleDetail.image}" width="100%" height="100%" alt="alt"/>
                                </div>
                            </div>
                            <div class="text text-center animate__animated animate__bounceIn">
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

                <h3 class="mt-5 text-center">Một số phụ kiện đi kèm</h3>
                <div style="justify-content: center" class="row">
                    <c:forEach items="${listAccess}" var="listAccess">
                        <div style="margin-right: 67px" class="col-md-1 d-flex align-self-stretch ftco-animate">
                            <div class="media block-6 services">
                                <div class="media-body py-md-1">
                                    <div class="d-flex mb-3 align-items-center">
                                        <div class="icon d-flex align-items-center justify-content-center" 
                                             onclick="openModal('${listAccess.accessoryName}', '${listAccess.accessoryDescription}', '${listAccess.price * 1000} VNĐ', 'images/${listAccess.accessoryImage}')">
                                            <img src="images/${listAccess.accessoryImageicon}" alt="${listAccess.accessoryName}" style="width: 60px; height: 60px;">
                                        </div>
                                        <div class="text">
                                            <h3 style="margin-top: -17px;;" class="heading mb-0 pl-3 text-left">
                                                ${listAccess.accessoryName}
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                            </div>      
                        </div>
                    </c:forEach>
                </div>

                <div id="myModal" class="modal">
                    <div style="width: 70%" class="modal-content">
                        <span class="close" onclick="closeModal()">&times;</span>
                        <div class="row" id="accessoryForm">
                            <div class="pl-4 col-md-6">
                                <div class="mt-4 title">
                                    <h1  style= "font-family: 'Roboto Slab'" class="fw-bold" id="accessoryName"></h1>
                                </div>
                                <div class="description">
                                    <p id="accessoryDescription"></p>
                                </div>
                                <div class="text-center priceAcc">
                                    <h3 style="color: red" id="accessoryPrice"></h3>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="img">
                                    <img id="accessoryImage" style="width: 100%;" src="accessoryImage" alt="accessoryName">
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
                                                                <span class="price">
                                                                    <fmt:formatNumber value="${priceList.dailyPriceForDay * 1000}" type="currency" currencySymbol="VNĐ" />
                                                                </span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                <span>Price per week:</span>
                                                                <span class="price">
                                                                    <fmt:formatNumber value="${priceList.dailyPriceForWeek * 1000}" type="currency" currencySymbol="VNĐ" />
                                                                </span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                <span>Price per month:</span>
                                                                <span class="price">
                                                                    <fmt:formatNumber value="${priceList.dailyPriceForMonth * 1000}" type="currency" currencySymbol="VNĐ" />
                                                                </span>
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
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                        <span class="subheading">Chọn xe</span>
                        <h2 class="mb-2">TOP SẢN PHẨM</h2>
                    </div>
                </div>
                <iframe src="slide.jsp" style="width: 99.1%; height: 540px; padding: 0; margin: 0;"></iframe>
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
    <script>
                            function openModal(name, description, price, imageSrc) {
                                document.getElementById('accessoryName').textContent = name;
                                document.getElementById('accessoryDescription').textContent = description;
                                document.getElementById('accessoryPrice').textContent = price;
                                document.getElementById('accessoryImage').src = imageSrc;
                                document.getElementById('myModal').style.display = 'block';
                            }
                            function closeModal() {
                                document.getElementById('myModal').style.display = 'none';
                            }

                            window.onclick = function (event) {
                                var modal = document.getElementById("myModal");
                                if (event.target === modal) {
                                    modal.style.display = "none";
                                }
                            }
                            window.onkeydown = function (event) {
                                var modal = document.getElementById("myModal");
                                if (event.key === "Escape" || event.key === "Esc") {
                                    modal.style.display = "none";
                                }
                            }

    </script>
</html>
