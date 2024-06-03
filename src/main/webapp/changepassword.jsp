<%-- 
    Document   : changepassword
    Created on : 2 thg 6, 2024, 12:33:57
    Author     : MINH TUAN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="./fonts/themify-icons-font/themify-icons/themify-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
        <style type="text/css">
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                background: url('https://powersports.honda.com/-/media/products/segment/street/sport/category-mp/hero/desktop/2024/sport-segment-hero-01-2400x1350.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Open Sans', sans-serif;
            }
            .mainDiv {
                display: flex;
                min-height: 100%;
                align-items: center;
                justify-content: center;
                background-color: rgba(249, 249, 249, 0.3);
                font-family: 'Open Sans', sans-serif;
                overflow: hidden;
            }
            .cardStyle {
                width: 500px;
                border-color: white;
                background: #fff;
                padding: 30px 0;
                border-radius: 4px;
                box-shadow: 0px 0 2px 0 rgba(0,0,0,0.25);
                transform: translateY(-100px);
                transition: transform 0.7s ease-out, opacity 0.5s ease-out;
            }
            .cardStyle.visible {
                opacity: 0.9;
                transform: translateY(0);
            }
            #signupLogo {
                max-height: 200px;
                margin: auto;
                display: flex;
                flex-direction: column;
                
            }
            .formTitle {
                font-weight: 600;
                margin-top: 20px;
                color: #2F2D3B;
                text-align: center;
            }
            .inputLabel {
                font-size: 13px;
                color: #666;
                margin-bottom: 6px;
                margin-top: 24px;
            }
            .inputDiv {
                width: 70%;
                display: flex;
                flex-direction: column;
                margin: auto;
            }
            input {
                height: 40px;
                font-size: 16px;
                border-radius: 4px;
                border: none;
                border: solid 1px #ccc;
                padding: 0 11px;
            }
            input:disabled {
                cursor: not-allowed;
                border: solid 1px #eee;
            }
            .password-eye {
                position: absolute;
                right: 88px;
                top: 54%;
                bottom: 288px;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 23px;
            }
            .buttonWrapper {
                margin-top: 40px;
            }
            .buttonWrapper:hover{
                opacity: 0.7;
            }
            .submitButton {
                width: 70%;
                height: 40px;
                margin: auto;
                display: block;
                color: #fff;
                background-color: #065492;
                border-color: #065492;
                text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
                box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
                border-radius: 4px;
                font-size: 14px;
                cursor: pointer;
            }
            .submitButton:disabled,
            button[disabled] {
                border: 1px solid #cccccc;
                background-color: #cccccc;
                color: #666666;
            }
            #loader {
                position: absolute;
                z-index: 1;
                margin: -2px 0 0 10px;
                border: 4px solid #f3f3f3;
                border-radius: 50%;
                border-top: 4px solid #666666;
                width: 14px;
                height: 14px;
                -webkit-animation: spin 2s linear infinite;
                animation: spin 2s linear infinite;
            }
            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }
        </style>
    </head>
    <body>
        <div class="mainDiv">
            <div class="cardStyle" id="changePasswordForm">
                <form action="changepassword" method="post" name="signupForm" id="signupForm">
                    <img src="" id="signupLogo"/>
                    <h1 class="formTitle" style="font-weight: bold;">Change Password</h1>
                    <c:if test="${not empty requestScope.errorPass}">
                        <div class="inputDiv" style="text-align: justify;">
                            <p style="color: red;font-size: 14px;margin: 0;font-weight: 600;">${errorPass}</p>
                        </div>
                    </c:if>
                    <c:if test="${not empty requestScope.successChange}">
                        <div class="inputDiv" style="text-align: justify;">
                            <p style="color: green;font-size: 14px;margin: 0;">${successChange}</p>
                        </div>
                    </c:if>
                    <div class="inputDiv">
                        <label class="inputLabel" for="password">Old Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="inputDiv">
                        <label class="inputLabel" for="newPassword">New Password</label>
                        <input type="password" id="newPassword" name="newPassword" required>
                    </div>
                    <div class="inputDiv">
                        <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    <div class="buttonWrapper" >
                        <button type="submit" id="submitButton" onclick="validateSignupForm()" class="submitButton pure-button pure-button-primary">
                            <span>CHANGE</span>
                            <span id="loader"></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div>
            <a href="profileCustomer.jsp" style="position: absolute; top: 20px; left: 20px; text-decoration: none; color: #000">
                <i class="ti-arrow-left" style="font-size: 40px"> </i>
            </a>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var form = document.getElementById('changePasswordForm');
                setTimeout(function () {
                    form.classList.add('visible');
                }, 100);
            });

            var password = document.getElementById("password"),
                    newPassword = document.getElementById("newPassword"),
                    confirm_password = document.getElementById("confirmPassword");

            document.getElementById('signupLogo').src = "images/anh4.png";
            enableSubmitButton();

            function validatePassword() {
                if (newPassword.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Passwords Don't Match");
                    return false;
                } else {
                    confirm_password.setCustomValidity('');
                    return true;
                }
            }

            password.onchange = validatePassword;
            newPassword.onkeyup = validatePassword;
            confirm_password.onkeyup = validatePassword;

            function enableSubmitButton() {
                document.getElementById('submitButton').disabled = false;
                document.getElementById('loader').style.display = 'none';
            }

            function disableSubmitButton() {
                document.getElementById('submitButton').disabled = true;
                document.getElementById('loader').style.display = 'unset';
            }

            function validateSignupForm() {
                var form = document.getElementById('signupForm');

                for (var i = 0; i < form.elements.length; i++) {
                    if (form.elements[i].value === '' && form.elements[i].hasAttribute('required')) {
                        console.log('There are some required fields!');
                        return false;
                    }
                }
                if (!validatePassword()) {
                    return false;
                }
                return true;
            }

            function showPassword(inputId, button) {
                const passwordInput = document.getElementById(inputId);
                const icon = button.querySelector("i");
                const isVisible = passwordInput.type === "password";
                passwordInput.type = isVisible ? "text" : "password";
                icon.className = isVisible ? "ri-eye-off-line" : "ri-eye-line";
            }
        </script>
    </body>
</html>
