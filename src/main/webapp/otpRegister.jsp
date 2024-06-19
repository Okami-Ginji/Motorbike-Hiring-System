<%-- 
    Document   : otpRegister
    Created on : May 31, 2024, 9:20:36 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive OTP Verification Form Using Bootstrap 5</title>
        <!-- Bootstrap 5 CDN Link -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS Link -->
        <style>
            /* Google Poppins Font CDN Link */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
            /* Variables */
            :root{
                --primary-font-family: 'Poppins', sans-serif;
                --light-white:#f5f8fa;
                --gray:#5e6278;
                --gray-1:#e3e3e3;
            }
            body{
                font-family:var(--primary-font-family);
                font-size: 14px;
            }
            /* Main CSS OTP Verification New Changing */
            .wrapper{
                padding:0 0 100px;
                background-image:url("images/bg.png");
                background-position:bottom center;
                background-repeat: no-repeat;
                background-size: contain;
                background-attachment: fixed;
                min-height: 100%;
                /* height:100vh;
                display:flex;
                align-items:center;
                justify-content:center; */
            }
            .wrapper .logo img{
                max-width:40%;
            }
            .wrapper input{
                background-color:var(--light-white);
                border-color:var(--light-white);
                color:var(--gray);
            }
            .wrapper input:focus{
                box-shadow: none;
            }
            .wrapper .password-info{
                font-size:10px;
            }
            .wrapper .submit_btn{
                padding:10px 15px;
                font-weight:500;
            }
            .wrapper .login_with{
                padding:8px 15px;
                font-size:13px;
                font-weight: 500;
                transition:0.3s ease-in-out;
            }
            .wrapper .submit_btn:focus,
            .wrapper .login_with:focus{
                box-shadow: none;
            }
            .wrapper .login_with:hover{
                background-color:var(--gray-1);
                border-color:var(--gray-1);
            }
            .wrapper .login_with img{
                max-width:7%;
            }
            /* OTP Verification CSS */
.wrapper .otp_input input{
                width:14%;
                height:70px;
                text-align: center;
                font-size: 20px;
                font-weight: 600;
            }
            @media (max-width:1200px){
                .wrapper .otp_input input{
                    height:50px;
                }
            }
            @media (max-width:767px){
                .wrapper .otp_input input{
                    height:40px;
                }
            }
        </style>
    </head>
    <body> 
        <section class="wrapper">
            <div class="container">
                <div class="col-sm-8 offset-sm-2 col-lg-6 offset-lg-3 col-xl-6 offset-xl-3 text-center otp-card" data-aos="fade-down">
                    <div class="logo">
                        <img decoding="async" src="images/anh4.png" class="img-fluid" alt="logo">
                    </div>
                    <form class="rounded bg-white shadow p-5" action="otp" method="post">
                        <h3 class="text-dark fw-bolder fs-4 mb-2">Verification</h3>

                        <div class="fw-normal text-muted mb-4">
                            Enter the verification code we sent to your Email
                        </div>  



                        <div class="otp-card-inputs otp_input text-start mb-2">
                            <label for="digit">Type your 6 digit security code</label>
                            <div class="d-flex align-items-center justify-content-between mt-2">
                                <input type="text" class="form-control" maxlength="1" name="input1">
                                <input type="text" disabled class="form-control" maxlength="1" name="input2">
                                <input type="text" disabled class="form-control" maxlength="1" name="input3">
                                <input type="text" disabled class="form-control" maxlength="1" name="input4">
                                <input type="text" disabled class="form-control" maxlength="1" name="input5">
                                <input type="text" disabled class="form-control" maxlength="1" name="input6">
                            </div> 
                        </div>  
                        <div style="color: red">${message}</div><br>
                        <button type="submit" class="btn btn-primary submit_btn my-4 verification">Verify</button> 
                    </form>

                    <div class="fw-normal text-muted mb-2">
                        Didn’t get the code ? <a href="reOtp" class="text-primary fw-bold text-decoration-none">Resend</a>
                    </div>

                </div>
            </div>
        </section>
       
        <script>
            const inputs = document.querySelectorAll('.otp-card-inputs input');
            const button = document.querySelector('.otp-card button');
            const verificationButton = document.querySelector('.verification');
verificationButton.addEventListener('click', handleVerification);

            inputs.forEach(input => {
                let lastInputStatus = 0;
                input.onkeyup = (e) => {
                    const currentElement = e.target;
                    const nextElement = input.nextElementSibling;
                    const prevElement = input.previousElementSibling;

                    if (nextElement && nextElement.hasAttribute("disabled") && currentElement.value !== "") {
                        nextElement.removeAttribute("disabled");
                        nextElement.focus();
                    }

                    if (prevElement && e.keyCode === 8) {
                        button.setAttribute('disabled', true);
                        button.classList.remove('active');
                        lastInputStatus = 1;
                    } else {
                        const reg = /^[0-9]+$/;
                        if (!reg.test(currentElement.value)) {
                            currentElement.value = currentElement.value.replace(/\D/g, '');
                        } else if (currentElement.value) {
                            if (nextElement) {
                                nextElement.focus();
                            } else if (lastInputStatus === 1) {
                                prevElement.value = '';
                                prevElement.focus();
                            }

                            const isAllDigitsEntered = inputs.every(input => input.value);
                            if (isAllDigitsEntered) {
                                button.removeAttribute('disabled');
                                button.classList.add('active'); // Add 'active' class
                            } else if (lastInputStatus === 1) {
                                button.setAttribute('disabled', true);
                                button.classList.remove('active');
                                button.classList.add('disabled'); // Add 'disabled' class
                            } else {
                                button.classList.remove('disabled'); // Remove 'disabled' class
                            }
                        }
                    }
                };
            });
            function handleVerification() {
                // Check if the verification process is successful (simulated here)
                const isVerificationSuccessful = true;

                if (isVerificationSuccessful) {
                    // Show the success message container
                    const successMessageContainer = document.querySelector('.otp-card1');
                    successMessageContainer.style.pointerEvents; // Make it visible
                    successMessageContainer.classList.add('show-success');

                    // Optionally, hide the confirmation card
                    const confirmationCard = document.querySelector('.otp-card');
                    confirmationCard.style.opacity = 0; // Hide the card
                    confirmationCard.style.pointerEvents = 'none'; // Disable interaction
                } else {
                    // Handle unsuccessful verification (display error message, etc.)
                }
            }
            
        </script>
    </body>
</html>