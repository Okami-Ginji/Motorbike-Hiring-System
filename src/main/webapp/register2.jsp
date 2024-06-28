<%-- 
    Document   : register2
    Created on : Jun 22, 2024, 9:25:49 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
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
            .border-md {
                border-width: 20px;
            }
            .form-control::placeholder {
                color: #ccc;
                font-weight: bold;
                font-size: 0.9rem;
            }
            .register {
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                color: white;
                border-radius: 10px;
            }
            .register:hover {
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%);
                color: #5CF1B4;
            }
            .info input {
                border: 5px solid white;
                border-radius: 20px;
                box-shadow: #76C8B4 0 0 5px;
                width: 100%;
                padding: 2%;
            }
            .img-fluid {
                max-width: 200%;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row py-5 align-items-center">
                <!-- For Demo Purpose -->
                <div class="col-md-5 pr-lg-5 mb-md-0" data-aos="zoom-in">
                    <img src="images/register2.png" style="border-radius: 100px;" alt="" class="img-fluid mb-3 d-none d-md-block">
                </div>

                <!-- Registration Form -->
                <div class="col-md-7 col-lg-6 ml-auto" data-aos="fade-left">
                    <form action="#">
                        <div class="row">
                            <!-- First Name -->
                            <div class="col-lg-6 mb-4 info" data-aos="fade-up">
                                <input id="firstName" type="text" name="firstname" placeholder="First Name">
                            </div>

                            <!-- Last Name -->
                            <div class="input-group col-lg-6 mb-4 info" data-aos="fade-up" data-aos-delay="100">
                                <input id="lastName" type="text" name="lastname" placeholder="Last Name">
                            </div>

                            <!-- Email Address -->
                            <div class="input-group col-lg-12 mb-4 info" data-aos="fade-up" data-aos-delay="200">
                                <input id="email" type="email" name="email" placeholder="Email Address">
                            </div>

                            <!-- Phone Number -->
                            <div class="input-group col-lg-12 mb-4 info" data-aos="fade-up" data-aos-delay="300">
                                <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number">
                            </div>

                            <!-- Username -->
                            <div class="input-group col-lg-12 mb-4 info" data-aos="fade-up" data-aos-delay="400">
                                <input id="Username" type="text" name="Username" placeholder="Username">
                            </div>

                            <!-- Password -->
                            <div class="input-group col-lg-6 mb-4 info" data-aos="fade-up" data-aos-delay="500">
                                <input id="password" type="password" name="password" placeholder="Password">
                            </div>

                            <!-- Password Confirmation -->
                            <div class="input-group col-lg-6 mb-4 info" data-aos="fade-up" data-aos-delay="600">
                                <input id="passwordConfirmation" type="password" name="passwordConfirmation" placeholder="Confirm Password">
                            </div>

                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0" data-aos="zoom-in" data-aos-delay="700">
                                <a href="#" class="btn btn-block py-2 register">
                                    <span class="font-weight-bold">Create your account</span>
                                </a>
                            </div>

                            <!-- Divider Text -->
                            <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4" data-aos="zoom-in" data-aos-delay="800">
                                <div class="border-bottom w-100 ml-5"></div>
                                <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                                <div class="border-bottom w-100 mr-5"></div>
                            </div>

<!--                             Social Login 
                            <div class="form-group col-lg-12 mx-auto" data-aos="zoom-in" data-aos-delay="900">
                                <a href="#" class="btn btn-block py-2 btn-facebook register">
                                    <i class="fa fa-facebook-f mr-2"></i>
                                    <span class="font-weight-bold">Continue with Google</span>
                                </a>
                            </div>-->

                            <!-- Already Registered -->
                            <div class="text-center w-100" data-aos="fade-up" data-aos-delay="1000">
                                <p class="text-muted font-weight-bold">Already Registered? <a href="login2.jsp" class="ml-2" style="color: #0A8EBF;">Login</a></p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="js/register.js"></script>
        <script src="js/aos.js"></script>
        <script>
            AOS.init({
                duration: 400, // Duration of animation in milliseconds
                once: true // Whether animation should happen only once
            });
        </script>
    </body>

</html>
