<%-- 
    Document   : policies
    Created on : May 25, 2024, 4:59:04 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Sidebar 05</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/policiesStyle.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
              rel="stylesheet">

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
            .logo{
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                background-clip: text;
                color: transparent !important;
            }
            .p{
                color: #001973 !important;
            }
        </style>
    </head>

    <body>
        <jsp:include page="/includes/navbar2.jsp" />

        <div class="wrapper d-flex align-items-stretch" style="margin-top: 5%;">
            <nav id="sidebar">

                <div class="p-4">
                    <!-- <div style="background-color:#01D28E;"> -->
                    <h1><a href="home.jsp" class="logo">COLOR BIKE <span>Your Adventure - Our Colors</span></a></h1>
                    <ul class="list-unstyled components mb-5">
                        <li class="active">
                            <a href="#"><span class="fa fa-home mr-3"></span> General Principles </a>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-user mr-3"></span>Policies & Terms </a>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-briefcase mr-3"></span>Privacy Policy</a>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-sticky-note mr-3"></span>Complaint Settlement</a>
                        </li>
                    </ul>

                </div>
            </nav>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">

                <h2 class="mb-4">General Principles</h2>
                <h6>Responsibility and honesty</h6>
                <p>

                    Mioto aims to build a car rental community with the desire to bring convenience to car renters and car
                    owners. Therefore, car renters need to be responsible for maintaining the rental car, and respecting it
                    as if it were your own car. If there is a problem or any problem with the vehicle on your trip, please
                    boldly resolve it with the vehicle owner HONESTLY and RESPONSIBLY.
                </p>
                <h6>Build trust</h6>
                <p>
                    Car owners should create a clear and transparent profile on the Mioto app, including personal images,
                    your name, contact information, and a thorough description, and invest a lot in image quality. Make your
                    car look attractive, this will help tenants TRUST and your car rental rate will be higher.
                    You can check the Customer's profile online before deciding to rent, which will give you peace of mind
                    before handing over the car keys to your guests.
                </p>
                <h6>Please keep the car clean</h6>
                <p>
                    Mioto aims to build a civilized community, so please love and keep the cars you rent clean. Delivering
                    and returning CLEAN vehicles helps both parties close the transaction well and be ready for great future
                    transactions.
                </p>
                <h6>Notify immediately when a problem arises</h6>
                <p>
                    Whenever a problem arises during the car rental process, the car owner and the car renter should NOTIFY
                    each other immediately, and use the terms of the car rental contract or Mioto's policies posted on the
                    Mioto website. .vn for quick resolution.
                </p>
                <h6>Comply with the law</h6>
                <p>
                    Car owners are responsible for ensuring your vehicles have all legal documents and are in SAFE condition
                    before handing it over to customers.
                    The customer renting a car is responsible for strictly COMPLYING with traffic rules and complying with
                    all relevant applicable laws during the rental period.
                </p>
                <h6>Final...</h6>
                <p>
                    If the car owner and renter cannot resolve the dispute themselves, please contact Mioto Customer Care.
                    We are always by your side to help you resolve issues in the best way, following the terms, policies and
                    operating regulations both parties have committed to with Mioto.
                </p>
            </div>
        </div>
        <jsp:include page="/includes/footer.jsp" />
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
