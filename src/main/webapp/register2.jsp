<%-- 
    Document   : register2
    Created on : May 25, 2024, 4:58:16 PM
    Author     : DiepTCNN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký tài khoản</title>
        <meta charset="UTF-8" />
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
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");

            :root {
                --primary-color: #2015ea;
                --primary-color-light: #6861f1;
                --secondary-color: #c0dbea;
                --text-dark: #020617;
                --text-light: #94a3b8;
                --white: #ffffff;
                --max-width: 1200px;
            }

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
                color: white;
            }

            .info input {
                border: 5px solid white;
                border-radius: 20px;
                box-shadow: #76C8B4 0 0 5px;
                width: 100%;
                padding: 2%;
            }
            .info select {
                border: 5px solid white;
                border-radius: 20px;
                box-shadow: #76C8B4 0 0 5px;
                width: 100%;
                padding: 2%;
            }

            /*            .formRegister {
                            width: 1300px;
                            height: 655px;
                        }*/

            .logoImg img {
                width: 127%;
                border-radius: 100px;
            }

            .img-fluid {
                max-width: none !important;
            }

            /*            .container{
                            display: flex;
                            justify-content: center;
                            width: 200%;
                        }*/
            #password-eye {
                color: var(--primary-color);
            }
            .inputDiv {
                width: 70%;
                display: flex;
                flex-direction: column;
                margin: auto;
            }
            .eye {
                width: 100%;
                /*                max-width: 80%;*/
            }
            .error-message {
                color: red;
                font-size: 0.9rem;
                display: none;
                margin-left: 5%;
            }
            .text-error {
                color: red;
                font-size: 0.9rem;
                margin-left: 5%;
            }

            .input-wrapper {
                position: relative;
                display: inline-block;
            }
            .input-wrapper input {
                width: 100%;
            }
            .input-wrapper span {
                position: absolute;
                top: 50%;
                right: 12px;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 20px;
            }
            .password-strength {
                font-size: 0.9rem;
                display: none;
                margin-left: 7%;
                right: 0px;
            }

            .red {
                color: red;
            }

            .orange {
                color: orange;
            }

            .green {
                color: green;
            }
            .gender{
                position: absolute;
                top: 121px;
                left: 15px;
                z-index: 1;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row py-5 align-items-center formRegister">
                <!-- For Demo Purpose -->
                <div class="col-md-5 pr-lg-5 mb-md-0 logoImg" data-aos="zoom-in">
                    <img src="images/register2.png" style="" alt="" class="img-fluid mb-3 d-none d-md-block">
                </div>

                <!-- Registration Form -->
                <div class="col-md-7 col-lg-6 ml-auto" data-aos="fade-left">
                    <form action="register" method="post" onsubmit="return validateForm()">
                        <div class="row">
                            <!-- First Name -->
                            <div class="col-lg-6 mb-4 info" data-aos="fade-up">
                                <input id="firstName" type="text" name="firstname" placeholder="Nhập vào Tên" required>
                                <!--                                <span id="placeholder" class="custom-placeholder">Nhập vào Tên<span class="red-asterisk">*</span></span>-->
                            </div>

                            <!-- Last Name -->
                            <div class="input-group col-lg-6 mb-4 info" data-aos="fade-up" data-aos-delay="100">
                                <input id="lastName" type="text" name="lastname" placeholder="Nhập vào Họ" required>
                            </div>
                            
                            <div class="input-group col-lg-6 mb-4 info" data-aos="fade-up" data-aos-delay="100">
                                <select id="gender" name="gender" class="inputRow">
                                    <option disabled selected>Giới tính</option>
                                    <option value="Nam">Nam</option>
                                    <option value="Nữ">Nữ</option>
                                    <option value="unknown">Không xác định</option>
                                </select>
                            </div>
                            <!-- Username -->
                            <div class="input-group col-lg-6 mb-4 info" data-aos="fade-up" data-aos-delay="400">
                                <input id="Username" type="text" name="username" placeholder="Nhập vào Username" required>
                            </div>
                            <span style="top: -22px; position: relative; left: 293px" class="error-message username" id="username-error"></span>
                            
                            <span class="error-message gender" id="gender-error">*Vui lòng chọn giới tính.</span>
                            <!-- Email Address -->
                            <div class="input-group col-lg-12 mb-4 info mt-1 " data-aos="fade-up" data-aos-delay="200">
                                <input id="email" type="text" name="email" placeholder="Nhập vào Email" required>
                                <span id="email-error" class="error-message"></span>
                            </div>


                            <!-- Phone Number -->
                            <div class="input-group col-lg-12 mb-4 info" data-aos="fade-up" data-aos-delay="300">
                                <input id="phoneNumber" type="tel" name="phone" placeholder="Nhập vào số điện thoại" required>
                                <span class="error-message" id="phone-error">*Số điện thoại phải có 10 chữ số.</span>
                            </div>

                            <!-- Password -->
                            <div class="col-lg-6 mb-2 info inputDiv" data-aos="fade-up" data-aos-delay="500">
                                <div class="input-wrapper">
                                    <input type="password" class="eye" name="password" id="password" value="" placeholder="Mật khẩu" maxlength="30" required />
                                    <span id="password-eye-1"><i class="ri-eye-off-line"></i></span>
                                </div>
                            </div>

                            <!-- Password Confirmation -->
                            <div class="col-lg-6 mb-2 info inputDiv" data-aos="fade-up" data-aos-delay="600">
                                <div class="input-wrapper">
                                    <input type="password" class="eye" name="passwordConfirmation" id="passwordConfirmation" value="" placeholder="Xác nhận mật khẩu" maxlength="30" required />
                                    <span id="password-eye-2"><i class="ri-eye-off-line"></i></span>
                                </div>
                            </div>
                            <span class="password-strength" id="password-strength"></span>
                            <span class="password-strength" id="passwordConfirm-strength"></span>


                            <div style="width: 100%; color: red; text-align: center">${errorInput}</div>

                            <div id="checkValid"></div>
                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0 mt-3" data-aos="zoom-in" data-aos-delay="700">
                                <button type="submit" name="register-submit" id="register-submit" class="btn btn-block py-2 register font-weight-bold" data-aos="zoom-in" data-aos-delay="700">Tạo tài khoản</button>
                            </div>



                            <!-- Divider Text -->
                            <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4" data-aos="zoom-in" data-aos-delay="800">
                                <div class="border-bottom w-100 ml-5"></div>
                                <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                                <div class="border-bottom w-100 mr-5"></div>
                            </div>

                            <!-- Already Registered -->
                            <div class="text-center w-100" data-aos="fade-up" data-aos-delay="1000">
                                <p class="text-muted font-weight-bold">Đã có tài khoản? <a href="login.jsp" class="ml-2" style="color: #0A8EBF;">Đăng nhập</a></p>
                                <p><a href="home.jsp" style="color: white; font-weight: 600; font-size:small; background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%); padding: 5px; border-radius: 5px; ">Về Trang Chủ</a></p>
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

        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const phoneInput = document.getElementById("phoneNumber");
                const phoneError = document.getElementById("phone-error");
                const passwordInput = document.getElementById("password");
                const passwordStrength = document.getElementById("password-strength");
                const genderSelect = document.getElementById("gender");
                const genderError = document.getElementById("gender-error");
                const checkValid = document.getElementById("checkValid");
                const confirmPass = document.getElementById("passwordConfirmation");
                const passwordBtn1 = document.getElementById("password-eye-1");
                const passwordBtn2 = document.getElementById("password-eye-2");

                const validatePhoneNumber = () => {
                    const phoneValue = phoneInput.value.trim();
                    const phoneRegex = /^0\d{9}$/;
                    if (phoneValue.length === 0) {
                        phoneError.style.display = "none";
                        return false;
                    } else if (!/^\d+$/.test(phoneValue)) {
                        phoneError.textContent = "*Số điện thoại chỉ được chứa các chữ số.";
                        phoneError.style.display = "block";
                        return false;
                    } else if (!phoneValue.startsWith('0')) {
                        phoneError.textContent = "*Số điện thoại phải bắt đầu bằng số 0.";
                        phoneError.style.display = "block";
                        return false;
                    } else if (phoneValue.length !== 10) {
                        phoneError.textContent = "*Số điện thoại phải có đúng 10 chữ số.";
                        phoneError.style.display = "block";
                        return false;
                    } else {
                        phoneError.style.display = "none";
                        return true;
                    }
                };

                const validateNewPassword = () => {
                    const newPasswordRegex = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
                    const password = passwordInput.value.trim();
                    if (newPasswordRegex.test(password)) {
                        if (password.length > 12) {
                            passwordStrength.textContent = "*Mật khẩu mạnh";
                            passwordStrength.className = "password-strength green";
                        } else if (password.length >= 10) {
                            passwordStrength.textContent = "*Mật khẩu vừa";
                            passwordStrength.className = "password-strength orange";
                        } else if (password.length > 8) {
                            passwordStrength.textContent = "*Mật khẩu yếu";
                            passwordStrength.className = "password-strength red";
                        } else {
                            passwordStrength.textContent = "";
                            passwordStrength.className = "";
                        }
                    } else {
                        passwordStrength.textContent = "*Password phải chứa ít nhất 8 ký tự, bao gồm ít nhất 1 ký tự in hoa và 1 chữ số.";
                        passwordStrength.className = "password-strength red";
                    }
                    passwordStrength.style.display = password.length > 0 ? "block" : "none";
                };


                const togglePasswordVisibility = (inputId, iconId) => {
                    const passwordInput = document.getElementById(inputId);
                    const icon = document.getElementById(iconId).querySelector("i");
                    const isVisible = passwordInput.type === "text";
                    passwordInput.type = isVisible ? "password" : "text";
                    icon.classList.toggle("ri-eye-line", !isVisible);
                    icon.classList.toggle("ri-eye-off-line", isVisible);
                };
                const emailInput = document.getElementById("email");
                const emailText = document.getElementById("email-error");
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                const validEmail = () => {
                    if (emailInput.value.trim() !== "") {
                        if (emailRegex.test(emailInput.value)) {
                            emailText.textContent = "";
                            emailText.className = "";
                        } else {
                            emailText.textContent = "*Email chưa đúng format.";
                            emailText.className = "text-error red";
                        }
                    } else {
                        if (emailInput.value.trim() === "") {
                            emailText.textContent = "*Không được để trống email.";
                            emailText.className = "text-error red";
                        } else {
                            emailText.textContent = "";
                            emailText.className = "";
                        }
                    }
                };
                const userInput = document.getElementById("Username");
                const userText = document.getElementById("username-error");
                const validUsername = () => {
                    if (userInput.value.trim() === "") {
                        userText.textContent = "*Không được để trống username.";
                        userText.className = "text-error red";
                    } else {
                        userText.textContent = "";
                        userText.className = "";
                    }
                };
                const validateForm = () => {
                    const isPhoneValid = validatePhoneNumber();

                    if (genderSelect.value === "Giới tính") {
                        genderError.style.display = "block";
                        return false;
                    } else {
                        genderError.style.display = "none";
                    }

                    return isPhoneValid && isUsernameValid && isEmailValid;
                };

                userInput.addEventListener("input", validUsername);
                emailInput.addEventListener("input", validEmail);
                phoneInput.addEventListener("input", validatePhoneNumber);
                passwordInput.addEventListener("input", validateNewPassword);
                passwordBtn1.addEventListener("click", () => togglePasswordVisibility("password", "password-eye-1"));
                passwordBtn2.addEventListener("click", () => togglePasswordVisibility("passwordConfirmation", "password-eye-2"));

                document.querySelector("form").addEventListener("submit", (event) => {
                    const isValid = validateForm();
                    if (!isValid) {
                        event.preventDefault();
                        checkValid.style.display = "block";
                        passwordStrength.style.display = "none";
                    } else {
                        checkValid.style.display = "none";
                    }
                });
            });
        </script>



    </body>

</html>