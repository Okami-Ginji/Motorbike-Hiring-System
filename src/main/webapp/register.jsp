<%-- 
    Document   : register
    Created on : May 25, 2024, 4:58:16 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">



    <head>
        <jsp:include page="/includes/header.jsp" />

        <link rel="stylesheet" href="css/css/register.css">

        <!-- <a href="https://front.codes/" class="logo" target="_blank">
            <img src="https://assets.codepen.io/1462889/fcy.png" alt="">
        </a> -->

        <!-- <script src='https://www.google.com/recapcha/api.js' async defer></script> -->
        <style>
            input.error{
                border: 1px solid red;
            }
            #email-error{
                display: none !important;
            }
        </style>
    </head>


    <body>


        <!-- Navbar-->
        <!-- <header class="header">
            <nav class="navbar navbar-expand-lg navbar-light py-3">
                <div class="container">
                    <a href="#" class="navbar-brand">
                        <img src="https://bootstrapious.com/i/snippets/sn-registeration/logo.svg" alt="logo" width="150">
                    </a>
                </div>
            </nav>
        </header> -->


        <div class="container">

            <div class="row py-5 mt-4 align-items-center">
                <!-- For Demo Purpose -->

                <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">

                    <img src="images/anh4.png" alt="" class="img-fluid mb-3 d-none d-md-block">
                    <!-- <p class="font-italic text-muted mb-0">Create a minimal registeration page using Bootstrap 4 HTML form elements.</p>
                    <p class="font-italic text-muted">Snippet By <a href="https://bootstrapious.com" class="text-muted">
                        <u>Bootstrapious</u></a>
                    </p> -->
                    <h2 style="text-align: center; color: black;">Create an Account</h2>

                </div>

                <!-- Registeration Form -->
                <div class="col-md-7 col-lg-6 ml-auto">
                     <form action="register" method="POST" id="aa">
                        <div class="row">

                            <!-- First Name -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="firstName" type="text" name="firstname" placeholder="First Name" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Last Name -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="lastName" type="text" name="lastname" placeholder="Last Name" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Gender -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend" style="width: 100%">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                    <select id="gender" name="gender" class="custom-select form-control bg-white border-left-0 border-md">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                            </div>
                            <!-- Phone Number -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-phone-square text-muted"></i>
                                    </span>
                                </div>

                                <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number" class="form-control bg-white border-md border-left-0 pl-3">
                            </div>
                            
                            <!-- Email Address -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted"></i>
                                    </span>
                                </div>
                                <input id="email" type="email" name="email" placeholder="Email Address" class="form-control bg-white border-left-0 border-md">
                            </div>
                            
                            <!-- Date of Birth -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="dob" type="date" name="dob" placeholder="Date of Birth" class="form-control bg-white border-left-0 border-md">
                            </div>
                            
                            <!-- Address -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="address" type="text" name="address" placeholder="Address" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Image-->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="image" type="text" name="image" placeholder="Image" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Username -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="username" type="text" name="username" placeholder="Username" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Password -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-lock text-muted"></i>
                                    </span>
                                </div>
                                <input id="password" type="password" name="password" placeholder="Password" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Password Confirmation -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-lock text-muted"></i>
                                    </span>
                                </div>
                                <input id="passwordConfirmation" type="password" name="passwordConfirmation" placeholder="Confirm Password" class="form-control bg-white border-left-0 border-md">
                            </div>
                            
                            <div style="color: red; margin-left:30px; ">${info}</div><br>
                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0">
                                <a href="#" class="">
                                    <input type="submit" name="register-submit" id="register-submit" class="btn btn-primary btn-block py-2 font-weight-bold" value="Create your account" />
                                </a>
                            </div>

                            <!-- Divider Text -->
                            <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                                <div class="border-bottom w-100 ml-5"></div>
                                <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                                <div class="border-bottom w-100 mr-5"></div>
                            </div>

                            <!-- Social Login -->
                            <div class="form-group col-lg-12 mx-auto">
                                <a href="#" class="btn btn-primary btn-block py-2 btn-facebook">
                                    <i class="fa fa-facebook-f mr-2"></i>
                                    <span class="font-weight-bold">Continue with Google</span>
                                </a>

                            </div>

                            <!-- Already Registered -->
                            <div class="text-center w-100">
                                <p class="text-muted font-weight-bold">Already Registered? <a href="login.jsp" class="text-primary ml-2">Login</a></p>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/register.js"></script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
        <script src="vendor/jquery-steps/jquery.steps.min.js"></script>
        <script src="vendor/minimalist-picker/dobpicker.js"></script>
        <script src="vendor/nouislider/nouislider.min.js"></script>
        <script src="vendor/wnumb/wNumb.js"></script>
        <script>
            (function ($) {
                var form = $("#aa");
                form.validate({
                    errorPlacement: function errorPlacement(error, element) {
                        element.before(error);
                    },
                    rules: {
                        email: {
                            email: true
                        }
                        
                    },
                    onfocusout: function (element) {
                        $(element).valid();
                    }
                });
            })(jQuery);
        </script>
    </body>
</html>
