<%-- 
    Document   : register
    Created on : May 25, 2024, 4:58:16 PM
    Author     : DiepTCNN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <a href="login.jsp">
                        <img  src="images/anh4.png" alt="" class="img-fluid mb-3 d-none d-md-block" style="width: 100%"></a>
                    <h2 style="text-align: center; color: black;">Quên mật khẩu</h2>

                </div>

                <!-- Registeration Form -->
                <div class="col-md-7 col-lg-6 ml-auto">
                    <form action="updatepassword" method="get">
                        <!--
                                                <input type="hidden" name="email" value="${requestScope.email}">-->
                        <div class="row">                          
                            <!-- Email Address -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted"></i>
                                    </span>
                                </div>
                                <input id="newpass" type="password" name="newpass" placeholder="Mật khẩu mới" class="form-control bg-white border-left-0 border-md">

                            </div>
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted"></i>
                                    </span>
                                </div>

                                <input id="confirmpass" type="password" name="confirmpass" placeholder="Xác nhận mật khẩu" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <div style="width: 100%; text-align: center; color: red">                              
                                <p style="margin-bottom: 5px;">${requestScope.messageError}</p>
                            </div>
                            <div style="width: 100%; text-align: center; color: green">                              
                                <p style="margin-bottom: 5px;">${requestScope.messageOke}</p>
                            </div>
                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0">                          
                                <input class="btn btn-primary btn-block py-2" type="submit" value="Xác nhận">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/register.js"></script>
    </body>
</html>