<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
        <title>Login Page</title>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
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
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            body {
                font-family: "Poppins", sans-serif;
            }
            /*            .container {
                            min-height: 100vh;
                            padding-inline: 1rem;
                            display: grid;
                            overflow: hidden;
                        }*/
            .containerContent {
                width: 100%;
                padding-block: 2rem;
                max-width: 400px;
                margin-inline: auto;
                margin-left: 250px;
            }
            .containerContent h3 {
                font-size: 1.2rem;
                font-weight: 600;
                color: var(--text-dark);
            }
            .containerContent h1 {
                margin-bottom: 1rem;
                font-size: 3rem;
                font-weight: 600;
                color: var(--text-dark);
            }
            .containerContent form {
                display: grid;
                gap: 5px;
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
                background-color: #CADDFE;
                border-radius: 5px;
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
                margin-left: 10%;
                margin-block: 1rem 2rem;
                padding: 0.75rem 2rem;
                outline: none;
                border: none;
                font-size: 1rem;
                color: var(--white);
                background-color: var(--primary-color);
                border-radius: 5rem;
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
                border: 2px solid var(--text-dark);
                border-radius: 5rem;
            }
            .logins a:hover {
                background: var(--secondary-color);
                border: 2px solid var(--primary-color);
            }
            .logins img {
                display: flex;
                max-width: 20px;
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
            }
            .containerImg::before {
                position: absolute;
                content: "";
                top: 0;
                left: 10rem;
                height: 113.5%;
                width: 78%;
                background-color: #CADDFE;
                border-top-left-radius: 2rem;
                border-bottom-left-radius: 2rem;
                z-index: -1;
            }
            .containerImg img {
                width: 70%;
                max-width: 600px;
                align-self: flex-end;
                margin-bottom: 60px;
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
        </style>

    </head>

    <body>
        <div class="container-fluid animate__animated animate__fadeInUp">
            <div class="row">
                <div class="containerContent col-md-6">
                    <h3>COLORBIKE</h3>
                    <h1>Welcome Back</h1>
                    <form id="loginForm" action="login" method="post">
                        <div class="inputRow">
                            <input name="Username" id="Username"
                                   placeholder="Username" value="${cookie.Username.value}" required/>
                        </div>
                        <div class="inputRow">
                            <input type="password" class="eye" name="Password" id="Password"
                                   value="${cookie.Password.value}" placeholder="Password" required/>
                            <span id="password-eye"><i class="ri-eye-off-line"></i></span>
                        </div>
                        <div class="forever">
                            <div>
                                <input type="checkbox" id="remember-me" id="rememberMe" name="rem" ${(cookie.rem != null ? 'checked' : '')} value="ON"/>
                                <label for="remember-me">Remember Me</label>
                            </div>
                            <div class="inputFP">
                                <a href="forgotPassword.jsp">Forgot Password?</a>
                            </div>
                        </div>
                        <% String error = (String)request.getAttribute("error"); %>
                        <% if (error != null && !error.isEmpty()) { %>
                        <h4 class="h4 animate__animated animate__fadeInUp" style="color: red; font-size: 16px; font-weight: bold; text-align: center;">
                            <i class="bi bi-exclamation-circle"></i> <%= error %>
                        </h4>
                        <% } %>
                        <button type="submit">LOGIN</button>
                    </form>
                    <h6>Or continue with</h6>
                    <div class="logins">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:6789/MotorcyleHiringProject/login-google&response_type=code&client_id=158327451054-1sdvun9trsl75ng2i96pfmr9lsgrjnjb.apps.googleusercontent.com&approval_prompt=force"><img src="images/search.png" alt="google" /></a>
                        <!--<a href="#"><img src="images/github.png" alt="github" /></a>-->
                        <a href="#"><img src="images/facebook.png" alt="facebook" /></a>
                    </div>
                    <p>Don't have an account yet? <a href="register.jsp">Create new account</a></p>
                </div>
                <div class="containerImg col-md-6">
                    <img src="images/5.png" alt="header" />
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