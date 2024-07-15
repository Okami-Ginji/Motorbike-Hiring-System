<%-- 
    Document   : login2
    Created on : Jun 24, 2024, 2:40:27 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <link rel="website icon" type="png" href="images\logo.png">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css"
            rel="stylesheet" />
        <title>Đăng nhập</title>
        <link rel="stylesheet"
              href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
            :root {
                --primary-color: linear-gradient(243.4deg, rgb(2, 184, 139) 13%, #0a92f3 98%);

                --primary-color-light: #6861f1;
                --secondary-color: #c0dbea;
                --text-dark: #020617;
                --text-light: #94a3b8;
                --white: #ffffff;
                --max-width: 1200px;
            }
            .gradient-background {
                background: var(--primary-color);
            }
            .gradient-background:hover {
                background: linear-gradient(243.4deg, #0a92f3 13%, rgb(2, 184, 139) 98%);
            }

            body {
                font-family: "Poppins", sans-serif;

            }

            .containerContent {
                width: 100%;
                padding-block: 2rem;
                max-width: 400px;
                margin-inline: auto;
                margin-left: 18%;
            }
            .containerContent h3 {
                font-size: 1.2rem;
                font-weight: 600;

            }
            .containerContent h1 {
                margin-bottom: 1rem;
                font-size: 3rem;
                font-weight: 600;
                color: var(--text-dark);
            }

            .containerContent label {
                font-size: 0.9rem;
                color: var(--text-dark);
            }
            .inputRow {
                margin-bottom: 1rem;
                width: 100%;
                padding: 0.75rem 1rem;
                display: flex;
                align-items: center;
                gap: 1rem;
                /* background-color: #B4E2F0; */
                border-radius: 20px;
                box-shadow: #0d82a2 0 0 10px;
            }
            .containerContent input {
                outline: none;
                border: none;
                font-size: 1rem;
                color: var(--text-dark);
                background-color: transparent;
            }
            .containerContent input::placeholder {
                color: var(--text-dark);
            }
            #password-eye {
                color: var(--primary-color);
            }
            .inputFP {
                align-items: center;
                justify-content: space-between;
                gap: 1rem;
            }
            .inputFP a {
                font-size: 0.9rem;
                color: var(--text-light);
                text-decoration: none;
                transition: 0.3s;
            }
            .inputFP a:hover {
                color: var(--text-dark);
            }
            .containerContent button {
                max-width: 80%;
                display: flex;
                justify-content: center;
                margin-left: 30%;
                margin-block: 1rem 2rem;
                padding: 0.75rem 2rem;
                outline: none;
                border: none;
                font-size: 1rem;
                color: var(--white);
                background-color: var(--primary-color);
                border-radius: 20px;
                box-shadow: #0d82a2 0 0 10px;
            }
            .containerContent button:hover {
                background-color: var(--primary-color-light);
            }
            .containerContent h6 {
                margin-bottom: 2rem;
                font-size: 1rem;
                font-weight: 400;
                color: var(--text-dark);
                text-align: center;
            }
            .logins {
                margin-bottom: 2rem;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 1rem;
            }
            .logins a {
                padding: 0.5rem 2.5rem;
                border: 2px solid #05A7B8;
                border-radius: 5rem;
            }
            .logins a:hover {
                background:#EFFAF4;
                border-radius: 5rem;
                border: 2px solid black;
            }
            .logins img {
                display: flex;
                max-width: 25px;
                margin-right: 5px;
            }
            .containerContent p {
                color: var(--text-light);
                text-align: center;
                font-size: smaller;
            }
            .containerContent p a {
                text-decoration: none;
                font-weight: 500;
                color: var(--primary-color);
            }
            .containerImg {
                position: relative;
                isolation: isolate;
                display: grid;
                margin-bottom: 8%;

            }

            .containerImg img {
                width: 70%;
                max-width: 100%;
                align-self: flex-end;
                /* margin-bottom: 20%; */
            }
            @media (width : 768px) {
                .container {
                    grid-template-columns:
                        minmax(1rem, 1fr) minmax(0, calc(var(--max-width) / 2)) minmax(0, calc(var(--max-width) / 2)) minmax(1rem, 1fr);
                }
                .containerContent {
                    margin-inline-start: unset;
                    grid-area: 1/2/2/3;
                    align-self: center;
                }
                .containerImg {
                    padding-block: 2rem;
                    grid-area: 1/3/2/4;
                }
            }
            .eye{
                width: 100%;
            }
            .forever{
                display:flex;
                justify-content: space-between;
            }

            .container-fluid{
                margin-top: 30px;
            }
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .animate-page {
                animation: fadeInUp 3s ease-out;
            }

            .username input{
                width: 100%;
            }
            .colorbike {
                font-weight: 900;

            }

            .comeback{
                text-decoration: none;
                color: #00ACD7;
            }
            
            .googleLogin{
                text-decoration: none;
                display: flex;
                padding: 0 15px;
                color: #001973;
            }
        </style>

    </head>

    <body>
        <div class="container-fluid animate__animated animate__fadeInUp">
            <div class="row fullform">
                <div class="containerContent col-md-6">
                    <a class="comeback" href="home"><h3 >COLORBIKE</h3></a>
                    <h1 class="begin" style="color: #001973;">Chào Mừng Bạn Trở Lại</h1>
                    <h4 class="h4 animate__animated animate__fadeInUp" style="color: red; font-size: 16px; font-weight: bold; text-align: center;">
                        <i class="bi bi-exclamation-circle"></i> ${error}
                    </h4>
                    <form id="loginForm" action="login" method="post">
                        <div class="inputRow username animate__animated animate__pulse">
                            <input value="${cookie.Username.value}" type="text" name="Username" id="Username"
                                   placeholder="Username" required />
                        </div>
                        <div class="inputRow animate__animated animate__pulse">
                            <input value="${cookie.Password.value}" type="password" class="eye" name="Password"
                                   id="Password"
                                   placeholder="Password" required />
                            <span id="password-eye"><i
                                    class="ri-eye-off-line"></i></span>
                        </div>
                        <div class="forever">
                            <div>
                                <input ${cookie.rem != null? "checked" : ""} type="checkbox" id="remember-me"
                                       id="rememberMe" name="rem" value="ON" />
                                <label for="remember-me">Nhớ Mật Khẩu</label>
                            </div>
                            <div class="inputFP">
                                <a href="forgotPassword.jsp">Quên Mật Khẩu?</a>
                            </div>
                        </div>

                        <h4 class="h4 animate__animated animate__fadeInUp"
                            style="color: red; font-size: 16px; font-weight: bold; text-align: center;">
                            <i class="bi bi-exclamation-circle"></i>
                        </h4>
                        <button class="gradient-background animate__animated animate__pulse" type="submit">Đăng Nhập</button>

                    </form>
                    <h6>Hoặc Đăng Nhập Với</h6>
                    <div class="logins">
                        <a class="googleLogin"
                            href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/MotorcyleHiringProject/login-google&response_type=code&client_id=158327451054-1sdvun9trsl75ng2i96pfmr9lsgrjnjb.apps.googleusercontent.com&approval_prompt=force"><img
                                src="images/search.png" alt="google"/>Google</a>
                        <!--<a href="#"><img src="images/github.png" alt="github" /></a>-->
<!--                        <a href="#"><img src="images/facebook.png"
                                         alt="facebook" /></a>-->
                    </div>
                    <p>Nếu bạn không có tài khoản? <a href="register2.jsp" style="color: #0d82a2; font-weight: 600; font-size:medium;">Tạo tài
                            khoản</a></p>
                    <p><a href="home.jsp" style="color: white; font-weight: 600; font-size:small; background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%); padding: 5px; border-radius: 5px; ">Về Trang Chủ</a></p>
                </div>
                <div class="containerImg col-md-6 animate__animated animate__zoomIn">
                    <img src="assets/img/login.png" alt="header" />
                </div>
            </div>
        </div>

        <script>
            const passwordBtn = document.getElementById("password-eye");
            passwordBtn.addEventListener("click", (e) => {
                const passwordInput = document.getElementById("Password");
                const icon = passwordBtn.querySelector("i");
                const isVisible = icon.classList.contains("ri-eye-line");
                passwordInput.type = isVisible ? "Password" : "text";
                icon.setAttribute("class", isVisible ? "ri-eye-off-line" : "ri-eye-line");
            });
        </script>
    </body>

</html>