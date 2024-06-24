<%-- 
    Document   : index
    Created on : May 25, 2024, 4:56:59 PM
    Author     : DiepTCNN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="/includes/header.jsp" /> 
        <style>
            .event-box {
                position: fixed;
                bottom: 10px;
                left: 7px;
                width: 190px;
                background: #dc3545f2;
                color: white;
                padding: 15px;
                border-radius: 12px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease;
                z-index: 1000;
                font-family: Arial, sans-serif;
                display: block;
            }

            .event-box img {
                width: 56%;
                cursor: pointer;
                opacity: 0.8;
            }

            .event-box .sale {
                font-size: 26px;
                font-weight: bold;
                color: yellow;
            }

            .event-box button {
                background-color: rgb(0,208, 141);
                color: #fff;
                border: none;
                padding: 0px 16px;
                border-radius: 5px;
                cursor: pointer;
                right: 5px;
            }

            .event-box h5, .event-box p {
                margin-bottom: 0;
            }

            .event-box button:hover {
                border: none;
                opacity: 0.8;
            }

            .text-event {
                margin-top: 30px;
            }
            .text-event h6 {
                font-weight: 900;
                font-size: 20px;
            }

            .text-event .bike {
                color: rgb(0,208, 141);
            }

            .minimize-btn{
                position: absolute;
                top: 5px;
                right: 30px;
                background: transparent;
                border: none;
                transition: transform 0.3s ease;
                color: white;
                font-size: 1.2em;
                cursor: pointer;
            }

            .text-more:hover, .minimize-btn:hover,
            .text-more:focus, .minimize-btn:focus {
                color: #fff;
                outline: none;
            }

            .show-event-btn {
                position: fixed;
                bottom: 10px;
                left: 7px;
                background: #ff3b3f;
                color: white;
                border: none;
                padding: 4px 24px;
                font-size: 15px;
                border-radius: 5px;
                cursor: pointer;
                display: none;
                z-index: 1000;
            }

            .show-event-btn:hover, .show-event-btn:focus {
                background: #ff6b6b;
                outline: none;
            }
        </style>
        <meta charset="UTF-8"/>
    </head>
    <body>

        <jsp:include page="/includes/navbar.jsp" />

        <div class="hero-wrap ftco-degree-bg" style="background-image: url('images/banner5.jpg');"
             data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
                    <div class="col-lg-8 ftco-animate">
                        <div class="text w-100 text-center mb-md-5 pb-md-5">
                            <h1 class="mb-4">Fast &amp; Easy Way To Rent A Motorbike</h1>
                            <p style="font-size: 18px;">A small river named Duden flows by their place and supplies it with the
                                necessary regelialia. It is a paradisematic country, in which roasted parts</p>
                            <a href="https://vimeo.com/45830194"
                               class="icon-wrap popup-vimeo d-flex align-items-center mt-4 justify-content-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="ion-ios-play"></span>
                                </div>
                                <div class="heading-title ml-5">
                                    <span>Easy steps for renting a car</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <section class="ftco-section ftco-no-pt bg-light">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-12	featured-top">
                        <div class="row no-gutters">
                            <div class="col-md-4 d-flex align-items-center">
                                <form action="#" class="request-form ftco-animate bg-primary">
                                    <h2>Make your trip</h2>
                                    <div class="form-group">
                                        <label for="" class="label">Pick-up location</label>
                                        <input type="text" class="form-control" placeholder="City, Airport, Station, etc">
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="label">Drop-off location</label>
                                        <input type="text" class="form-control" placeholder="City, Airport, Station, etc">
                                    </div>
                                    <div class="d-flex">
                                        <div class="form-group mr-2">
                                            <label for="" class="label">Pick-up date</label>
                                            <input type="text" class="form-control" id="book_pick_date" placeholder="Date">
                                        </div>
                                        <div class="form-group ml-2">
                                            <label for="" class="label">Drop-off date</label>
                                            <input type="text" class="form-control" id="book_off_date" placeholder="Date">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="label">Pick-up time</label>
                                        <input type="text" class="form-control" id="time_pick" placeholder="Time">
                                    </div>
                                    <div class="form-group">
                                        <!-- <input type="submit" value="Rent A Car Now" class="btn btn-secondary py-3 px-4" /> -->
                                        <a href="booking.jsp" class="btn btn-secondary py-3 px-4">Rent A Car Now</a>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-8 d-flex align-items-center">
                                <div class="services-wrap rounded-right w-100">
                                    <h3 class="heading-section mb-4">Better Way to Rent Your Perfect Motorbikes</h3>
                                    <div class="row d-flex mb-4">
                                        <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                                            <div class="services w-100 text-center">
                                                <div class="icon d-flex align-items-center justify-content-center"><span
                                                        class="flaticon-route"></span></div>
                                                <div class="text w-100">
                                                    <h3 class="heading mb-2">Choose Your Pickup Location</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                                            <div class="services w-100 text-center">
                                                <div class="icon d-flex align-items-center justify-content-center"><span
                                                        class="flaticon-handshake"></span></div>
                                                <div class="text w-100">
                                                    <h3 class="heading mb-2">Select the Best Deal</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                                            <div class="services w-100 text-center">
                                                <div class="icon d-flex align-items-center justify-content-center"><span
                                                        class="flaticon-rent"></span></div>
                                                <div class="text w-100">
                                                    <h3 class="heading mb-2">Reserve Your Rental Motorbike</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <p><a href="#" class="btn btn-primary py-3 px-4">Reserve Your Perfect Car</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <div class="event-box" id="eventBox" >
            <button class="minimize-btn" onclick="minimizeEventBox()">−</button>
            <div class="text-event text-center">
                <h6>COLOR<span class="bike">BIKE</span> Tri Ân!</h6>
            </div>
            <div class="text-center">
                <img onclick="checkLogin('${sessionScope.account}')" 
                     src="https://img.lazcdn.com/g/p/5c721d75a2bb91f64ab172f2f47e1ee1.png_720x720q80.png" alt="alt"/>
            </div>
            <div class="text-center">
                <p>Sale cực <span class="sale">HỜI</span></p>
            </div>
            <div class="text-center">
                <button class="text-more" onclick="checkLogin('${sessionScope.account}')">Xem thêm</button>
            </div>
        </div>
        <button class="show-event-btn" id="showEventBtn" onclick="showEventBox()">Event</button>

        <!-- select box section end -->

        <section class="ftco-section ftco-no-pt bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                        <span class="subheading">What we offer</span>
                        <h2 class="mb-2">Featured Vehicles</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="carousel-car owl-carousel">
                            <c:forEach items="${listM}" var="motor">
                                <div class="item">
                                    <div class="car-wrap rounded ftco-animate">
                                        <div class="img rounded d-flex align-items-end">
                                            <img src="images/${motor.image}" alt="alt"/>
                                        </div>
                                        <div class="text">
                                            <h2 class="mb-0"><a href="#">${motor.model}</a></h2>
                                                <c:forEach items="${listB}" var="b">
                                                    <c:if test="${motor.brandID == b.brandID}">
                                                    <div class="d-flex mb-3">
                                                        <span class="cat">${b.brandName}</span>
                                                        <c:forEach items="${listP}" var="p">
                                                            <c:if test="${motor.priceListID == p.priceListId}">
                                                                <p class="price ml-auto">${p.dailyPriceForDay} <span>/day</span></p>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">Book now</a> 
                                                <a href="#" class="btn btn-secondary py-2 ml-1">Details</a></p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <!-- <span class="subheading">Services</span> -->
                        <h2 class="mb-3">Why Choose Us</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="services services-2 w-100 text-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span class="fa-solid fa-bars"></span>
                            </div>
                            <div class="text w-100">
                                <h3 class="heading mb-2">Variety Choices</h3>
                                <p>Hundreds of diverse types of vehicles in many locations in Da Nang, suitable for all your purposes.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="services services-2 w-100 text-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span
                                    class="flaticon-transportation"></span></div>
                            <div class="text w-100">
                                <h3 class="heading mb-2">Convenient</h3>
                                <p>Easily search, compare and book the motorbike you want with just a few clicks</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="services services-2 w-100 text-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-car"></span></div>
                            <div class="text w-100">
                                <h3 class="heading mb-2">Competitive price</h3>
                                <p>Rental prices are publicly listed and are up to 10% cheaper than traditional prices.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="services services-2 w-100 text-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span
                                    class="fa-regular fa-circle-check"></span></div>
                            <div class="text w-100">
                                <h3 class="heading mb-2">Reliable</h3>
                                <p>All vehicles have a lifespan of less than 3 years and are regularly maintained.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="services services-2 w-100 text-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-headphones"></span>
                            </div>
                            <div class="text w-100">
                                <h3 class="heading mb-2">24/7 Support Services</h3>
                                <p>There is staff to support customers throughout the car rental process.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="services services-2 w-100 text-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span
                                    class="fas fa-calendar-check"></span></div>
                            <div class="text w-100">
                                <h3 class="heading mb-2">Flexible Rental Duration</h3>
                                <p>You can book the motorbike for any period of time and extend it if you want.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- <section class="ftco-section ftco-intro" style="background-image: url(images/bg_3.jpg);">
          <div class="overlay"></div>
          <div class="container">
            <div class="row justify-content-end">
              <div class="col-md-6 heading-section heading-section-white ftco-animate">
                <h2 class="mb-3">Do You Want To Earn With Us? So Don't Be Late.</h2>
                <a href="#" class="btn btn-primary btn-lg">Become A Driver</a>
              </div>
            </div>
          </div>
        </section> -->


        <section class="ftco-section testimony-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <span class="subheading">Testimonial</span>
                        <h2 class="mb-3">Happy Clients</h2>
                    </div>
                </div>
                <div class="row ftco-animate">


                    <div class="col-md-12">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <c:forEach items="${listF}" var="feedback">
                                <div class="item">
                                    <div class="testimony-wrap rounded text-center py-4 pb-5">
                                        <div class="user-img mb-2" style="background-image: url(images/person_1.jpg)"></div>
                                        <div class="text pt-4">
                                            <p class="mb-4">${feedback.content}</p>
                                            <p class="name">${feedback.customerName}</p>
                                            <span>rated:</span>
                                            <c:forEach begin="1" end="${feedback.rate}" var="star">
                                                <span style="color: #F7D000;" class="ion-ios-star"></span>
                                            </c:forEach>
                                            <c:forEach begin="${feedback.rate + 1}" end="5" var="emptyStar">
                                                <span class="ion-ios-star-outline"></span>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>


                </div>
            </div>
        </section>
        <!-- events -->
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <!-- <span class="subheading">Events</span> -->
                        <h2>Recent Events</h2>
                    </div>
                </div>
                <div class="row d-flex">
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry justify-content-end">
                            <a href="blog-single.html" class="block-20" style="background-image: url('images/image_1.jpg');">
                            </a>
                            <div class="text pt-4">
                                <div class="meta mb-3">
                                    <div><a href="#">Oct. 29, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                                <p><a href="#" class="btn btn-primary">Read more</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry justify-content-end">
                            <a href="blog-single.html" class="block-20" style="background-image: url('images/image_2.jpg');">
                            </a>
                            <div class="text pt-4">
                                <div class="meta mb-3">
                                    <div><a href="#">Oct. 29, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                                <p><a href="#" class="btn btn-primary">Read more</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry">
                            <a href="blog-single.html" class="block-20" style="background-image: url('images/image_3.jpg');">
                            </a>
                            <div class="text pt-4">
                                <div class="meta mb-3">
                                    <div><a href="#">Oct. 29, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                                <p><a href="#" class="btn btn-primary">Read more</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end events -->
        <section class="ftco-counter ftco-section img bg-light" id="section-counter">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="60">0</strong>
                                <span>Year <br>Experienced</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="1090">0</strong>
                                <span>Total <br>Cars</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="2590">0</strong>
                                <span>Happy <br>Customers</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text d-flex align-items-center">
                                <strong class="number" data-number="67">0</strong>
                                <span>Total <br>Branches</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- map -->
        <section>
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8560635690856!2d108.2584456746545!3d15.968891342117118!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421060734d1d45%3A0xee0cabb7ddf0acc7!2zS2h1IMSRw7QgdGjhu4sgRlBUIENpdHksIEhvw6AgSOG6o2ksIE5nxakgSMOgbmggU8ahbiwgxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1715738592214!5m2!1svi!2s"
                width="1300" height="400" style="border:0; margin: 20px 0 10px 110px;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
        </section>
        <!-- end map -->

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
        <!-- thanh search -->
        <script>
            function minimizeEventBox() {
                document.getElementById('eventBox').style.display = 'none';
                document.getElementById('showEventBtn').style.display = 'block';
            }

            function showEventBox() {
                document.getElementById('eventBox').style.display = 'block';
                document.getElementById('showEventBtn').style.display = 'none';
            }

            function checkLogin(account) {
                if (account !== '') {
                    window.location.href = 'event';
                } else {
                    window.location.href = 'login.jsp';
                }
            }

        </script>
    </body>

</html>
