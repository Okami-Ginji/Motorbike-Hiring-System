<%-- 
    Document   : faqs
    Created on : May 25, 2024, 5:39:04 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>FAQs</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
                opacity: 0; /* Khởi đầu với độ trong suốt 0 */
                animation: fadeInEffect 1s ease-in-out forwards; /* Sử dụng animation để fade-in */
            }

            @keyframes fadeInEffect {
                from {
                    opacity: 0; /* Bắt đầu với độ trong suốt 0 */
                    transform: translateY(20px); /* Dịch chuyển lên trên 20px */
                }
                to {
                    opacity: 1; /* Kết thúc với độ trong suốt 100% */
                    transform: translateY(0); /* Trở về vị trí ban đầu */
                }
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
                color: #1089FF;
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
                            <h3>Các câu hỏi thường gặp</h3>
                            <p>ColorBike sẽ mang đến trải nghiệm xứng đáng với những gì bạn kì vọng.
                            </p>
                            <div class="line"></div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-lg-8">
                        <!-- FAQ Accordion List -->
                        <div class="accordion faq-accordian" id="faqAccordion">
                            <c:forEach var="faq" items="${FAQ}" varStatus="status">
                                <div class="card border-0 wow fadeInUp" data-wow-delay="${0.2 + status.index * 0.1}s"
                                     style="visibility: visible; animation-delay: ${0.2 + status.index * 0.1}s; animation-name: fadeInUp;">
                                    <div class="card-header" id="heading${status.index}">
                                        <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapse${status.index}"
                                            aria-expanded="false" aria-controls="collapse${status.index}">
                                            ${faq.question}<span class="lni-chevron-up"></span>
                                        </h6>
                                    </div>
                                    <div class="collapse" id="collapse${status.index}" aria-labelledby="heading${status.index}"
                                         data-parent="#faqAccordion">
                                        <div class="card-body">
                                            <p>${faq.answer}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Support Button -->
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
