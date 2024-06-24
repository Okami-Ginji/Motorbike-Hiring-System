<%-- 
    Document   : register
    Created on : May 25, 2024, 4:58:16 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css"
            rel="stylesheet" />

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
            .container {
                min-height: 100vh;
                padding-inline: 1rem;
                display: grid;
                overflow: hidden;
            }
            .containerContent {
                width: 100%;
                padding-block: 2rem;
                max-width: 400px;
                margin-inline: auto;
                margin-left: 20%;
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
                right: 5em;
                height: 90%;
                width: 100%;
                background-color: #CADDFE;
                border-top-right-radius: 2rem;
                border-bottom-right-radius: 2rem;
                z-index: -1;
                margin-left: 7%;
                margin-top: 5%;
            }
            .containerImg img {
                width: 80%;
                max-width: 100%;
                align-self:center;
                margin-left: 45%;
                filter: drop-shadow(0 0 5px rgb(102, 102, 231));
                image-rendering: pixelated;
            }
            .container-fluid{
                display: flex;
            }
            .eye{
                width: 100%;
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

            /*
            .forever{
                display:flex;
                justify-content: space-between;
            }
            .container-fluid{
                margin-top: 30px;
            } */
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
            /*phone validation*/

            .tooltip {
                position: absolute;
                top: 53%;
/*                left: 0;
                transform: translateY(10px);*/
                background-color: #f44336;
                color: #fff;
                padding: 0px 10px;
                border-radius: 4px;
                font-size: 0.9rem;
                visibility: hidden;
                opacity: 0;
                transition: opacity 0.3s ease, visibility 0.3s ease;
                margin: 20px;
                
            }
            .tooltip::after {
                content: "";
                position: absolute;
                top: -5px;
                left: 10px;
                border-width: 5px;
                border-style: solid;
                border-color: transparent transparent #f44336 transparent;
            }
            .inputRow.input-error .tooltip {
                visibility: visible;
                opacity: 1;
            }
        </style>

    </head>

    <body>
        <div class="container-fluid">
            <div class="containerImg col-md-6">
                <img src="images/register.png" alt="header" />
            </div>
            <div class="containerContent col-md-6">
                <h3>Welcome to COLORBIKE</h3>
                <h1>Register</h1>
                <form action="register" method="post">
                    <div class="inputRow">
                        <input type="text" name="firstname" placeholder="Enter your FirstName" />
                    </div>
                    <div class="inputRow">
                        <input type="text" name="lastname" placeholder="Enter your LastName" />
                    </div>
                    <select id="gender" name="gender" class="inputRow">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="unknown">Unknown</option>
                    </select>
                    <div class="inputRow">
                        <input type="text" name="phone" id="phone"
                               placeholder="Enter your Phone Number" />          
                        <div class="tooltip" id="phone-error">Phone number must be exactly 10 digits.</div>
                    </div>
<!--                    <div id="phone-error" style="color: red; margin-bottom: 1rem;"></div>-->

                    <div class="inputRow">
                        <input type="date" name="dob" placeholder="Enter your Data of birth" />
                    </div>
                    <div class="inputRow">
                        <input type="text" name="address" placeholder="Enter your Address" />
                    </div>
                    <div class="inputRow">
                        <input type="email" name="email" placeholder="Enter your Email" />
                    </div>
                    <div class="inputRow">
                        <input type="text" name="username" placeholder="Enter your Username" />
                    </div>
                    <div class="inputRow">
                        <input type="password" class="eye" name="password" id="password"
                               value="" placeholder="Password" required/>
                        <span id="password-eye-1"><i class="ri-eye-off-line"></i></span>
                    </div>
                    <div class="inputRow">
                        <input type="password" class="eye" name="passwordConfirmation" id="passwordConfirmation"
                               value="" placeholder="Confirm Password" required/>
                        <span id="password-eye-2"><i class="ri-eye-off-line"></i></span>
                    </div>

                    <div style="color: red; margin-left:30px; ">${info}</div><br>
                    <button type="submit" name="register-submit" id="register-submit">Create new account</button>
                </form>
                <h6>Or continue with</h6>
                <div class="logins">
                    <a href="#"><img src="images/search.png" alt="google" /></a>
                    <a href="#"><img src="images/github.png" alt="github" /></a>
                    <a href="#"><img src="images/facebook.png"
                                     alt="facebook" /></a>
                </div>
                <p>I have an account <a href="#">Log in</a></p>
            </div>

        </div>

        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const togglePasswordVisibility = (inputId, iconId) => {
                    const passwordInput = document.getElementById(inputId);
                    const icon = document.getElementById(iconId).querySelector("i");
                    const isVisible = icon.classList.contains("ri-eye-line");
                    passwordInput.type = isVisible ? "password" : "text";
                    icon.setAttribute("class", isVisible ? "ri-eye-off-line" : "ri-eye-line");
                };

                const passwordBtn1 = document.getElementById("password-eye-1");
                const passwordBtn2 = document.getElementById("password-eye-2");

                passwordBtn1.addEventListener("click", () => togglePasswordVisibility("password", "password-eye-1"));
                passwordBtn2.addEventListener("click", () => togglePasswordVisibility("passwordConfirmation", "password-eye-2"));

                //Phone Validation
                const phoneInput = document.getElementById("phone");

                phoneInput.addEventListener("blur", () => {
                    const phoneValue = phoneInput.value.trim();
                    const phonePattern = /^\d{10}$/;

                    let phoneError = document.getElementById("phone-error");
                    if (!phoneError) {
                        phoneError = document.createElement("div");
                        phoneError.id = "phone-error";
                        phoneError.className = "error-message";
                        phoneInput.parentElement.appendChild(phoneError);
                    }

                    if (phoneValue === "") {
                        phoneError.textContent = "Please enter your phone number.";
                        phoneError.style.display = "block";
                        phoneInput.parentElement.classList.add("input-error");
                    } else if (!phonePattern.test(phoneValue)) {
                        phoneError.textContent = "Phone number must be exactly 10 digits.";
                        phoneError.style.display = "block";
                        phoneInput.parentElement.classList.add("input-error");
                    } else {
                        phoneError.style.display = "none";
                        phoneInput.parentElement.classList.remove("input-error");
                    }
                });

                phoneInput.addEventListener("input", () => {
                    const phoneError = document.getElementById("phone-error");
                    if (phoneError) {
                        phoneError.style.display = "none";
                        phoneInput.parentElement.classList.remove("input-error");
                    }
                });
            });

        </script>


    </body>

</html>
