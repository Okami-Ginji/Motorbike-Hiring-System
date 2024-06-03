<%-- 
    Document   : faqs
    Created on : May 25, 2024, 5:39:04 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Frequently Asked Questions section - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
            }

            .section_padding_130 {
                padding-top: 130px;
                padding-bottom: 130px;
            }

            .faq_area {
                position: relative;
                z-index: 1;
                background-color: #f5f5ff;
            }

            .faq-accordian {
                position: relative;
                z-index: 1;
            }

            .faq-accordian .card {
                position: relative;
                z-index: 1;
                margin-bottom: 1.5rem;
            }

            .faq-accordian .card:last-child {
                margin-bottom: 0;
            }

            .faq-accordian .card .card-header {
                background-color: #ffffff;
                padding: 0;
                border-bottom-color: #ebebeb;
            }

            .faq-accordian .card .card-header h6 {
                cursor: pointer;
                padding: 1.75rem 2rem;
                color: #3f43fd;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                -ms-grid-row-align: center;
                align-items: center;
                -webkit-box-pack: justify;
                -ms-flex-pack: justify;
                justify-content: space-between;
            }

            .faq-accordian .card .card-header h6 span {
                font-size: 1.5rem;
            }

            .faq-accordian .card .card-header h6.collapsed {
                color: #070a57;
            }

            .faq-accordian .card .card-header h6.collapsed span {
                -webkit-transform: rotate(-180deg);
                transform: rotate(-180deg);
            }

            .faq-accordian .card .card-body {
                padding: 1.75rem 2rem;
            }

            .faq-accordian .card .card-body p:last-child {
                margin-bottom: 0;
            }

            @media only screen and (max-width: 575px) {
                .support-button p {
                    font-size: 14px;
                }
            }

            .support-button i {
                color: #3f43fd;
                font-size: 1.25rem;
            }

            @media only screen and (max-width: 575px) {
                .support-button i {
                    font-size: 1rem;
                }
            }

            .support-button a {
                text-transform: capitalize;
                color: #2ecc71;
            }

            @media only screen and (max-width: 575px) {
                .support-button a {
                    font-size: 13px;
                }
            }

            /* breadcrumb */

            /* Style the list */
            ul.breadcrumb {
                padding: 10px 16px;
                list-style: none;
                background-color: #eee;
            }

            /* Display list items side by side */
            ul.breadcrumb li {
                display: inline;
                font-size: 18px;
            }

            /* Add a slash symbol (/) before/behind each list item */
            ul.breadcrumb li+li:before {
                padding: 8px;
                color: black;
                content: "/\00a0";
            }

            /* Add a color to all links inside the list */
            ul.breadcrumb li a {
                color: #0275d8;
                text-decoration: none;
            }

            /* Add a color on mouse-over */
            ul.breadcrumb li a:hover {
                color: #01447e;
                text-decoration: underline;
            }
        </style>
    </head>

    <body>
        <!-- breadcrumb -->
        <div>
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">FAQs</a></li>
                <li>All List</li>
            </ul>
        </div>
        <!-- end breadcrumbs -->
        <div class="faq_area section_padding_130" id="faq">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-8 col-lg-6">

                        <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s"
                             style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <h3><span>Frequently </span> Asked Questions</h3>
                            <p>Appland is completely creative, lightweight, clean &amp; super responsive app landing page.
                            </p>
                            <div class="line"></div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">

                    <div class="col-12 col-sm-10 col-lg-8">
                        <div class="accordion faq-accordian" id="faqAccordion">
                            <div class="card border-0 wow fadeInUp" data-wow-delay="0.2s"
                                 style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                                <div class="card-header" id="headingOne">
                                    <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseOne"
                                        aria-expanded="true" aria-controls="collapseOne">What do I need to prepare to rent a motorbike?<span
                                            class="lni-chevron-up"></span></h6>
                                </div>
                                <div class="collapse" id="collapseOne" aria-labelledby="headingOne"
                                     data-parent="#faqAccordion">
                                    <div class="card-body">
                                        <p>Identity card (original); Driver's license (original and copy); 
                                            Passport if a foreigner; 
                                            Deposit from 3,000,000 VND or more depending on vehicle type.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card border-0 wow fadeInUp" data-wow-delay="0.3s"
                                 style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
                                <div class="card-header" id="headingTwo">
                                    <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseTwo"
                                        aria-expanded="true" aria-controls="collapseTwo">Can I register a motorbike rental for someone else?<span
                                            class="lni-chevron-up"></span></h6>
                                </div>
                                <div class="collapse" id="collapseTwo" aria-labelledby="headingTwo"
                                     data-parent="#faqAccordion">
                                    <div class="card-body">
                                        <p>You can sign the contract in your name to rent to relatives or friends. Depending on the motorbike rental company, 
                                            you will be asked to add a number of appropriate documents to sign the motorbike rental contract.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card border-0 wow fadeInUp" data-wow-delay="0.4s"
                                 style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                                <div class="card-header" id="headingThree">
                                    <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseThree"
                                        aria-expanded="true" aria-controls="collapseThree">If I cancel my booking, will I have to pay a penalty?<span
                                            class="lni-chevron-up"></span></h6>
                                </div>
                                <div class="collapse" id="collapseThree" aria-labelledby="headingThree"
                                     data-parent="#faqAccordion">
                                    <div class="card-body">
                                        <p>You absolutely do not have to pay any penalty fees for canceling the deposit before the time of implementing the 
                                            motorbike rental contract (not applicable for car rental on holidays, New Year, etc.).</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="support-button text-center d-flex align-items-center justify-content-center mt-4 wow fadeInUp"
                             data-wow-delay="0.5s"
                             style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                            <i class="lni-emoji-sad"></i>
                            <p class="mb-0 px-2">Can't find your answers?</p>
                            <a href="contact.jsp"> Contact us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>

</html>
