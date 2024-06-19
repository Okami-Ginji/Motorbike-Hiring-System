<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="website icon" type="png" href="images\logo.png">
        <jsp:include page="/includes/header.jsp" />
        <meta charset="utf-8">
        <title>FAQs</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <style type="text/css">
            body {
                font-family: 'Roboto', sans-serif;
                color: #333;
                animation: fadeInEffect 1s ease-in-out forwards;
            }

            .section_heading h3 {
                color: #fff; /* Đổi màu chữ thành màu trắng */
                padding: 10px 20px; /* Thêm padding để tạo khoảng cách xung quanh văn bản */
                border: 2px solid #1089FF; /* Thêm viền 2px và màu viền là #1089FF */
                background: linear-gradient(to right, rgb(5, 117, 230), rgb(2, 27, 121)); /* Đổi background thành gradient màu */
                display: inline-block; /* Để có thể hiển thị background và border đầy đủ */
                border-radius: 10px; /* Làm bo góc viền */
            }

            .faq_area {
                padding-top: 100px;
                padding-bottom: 100px;
                position: relative;
                z-index: 1;
                background: linear-gradient(89.9deg, rgb(208, 246, 255) 0.1%, rgb(255, 237, 237) 47.9%, rgb(255, 255, 231) 100.2%);
            }

            .faq-accordian .card-header {
                background-color: #ffffff;
                padding: 0;
                border-bottom: 5px solid #ebebeb; /* Thêm border dưới cho card-header */
                margin-bottom: 10px;
            }

            .faq-accordian .card-header h6 {
                cursor: pointer;
                padding: 1.75rem 2rem;
                color: #3f43fd;
                display: flex;
                align-items: center;
            }

            .faq-accordian .card-header h6 span {
                font-size: 0.5rem;
            }

            .faq-accordian .card-header h6.collapsed {
                color: #337AB7;
            }

            .faq-accordian .card-header h6.collapsed .fa-caret-up {
                transform: rotate(-180deg);
            }

            .faq-accordian .card .card-body {
                padding: 1.75rem 2rem;
                color: black;
            }

            @media only screen and (max-width: 575px) {
                .support-button p {
                    font-size: 14px;
                }

                .support-button i {
                    font-size: 1rem;
                }

                .support-button a {
                    font-size: 13px;
                }
            }

            @keyframes fadeInEffect {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .topDetail{
                margin-bottom: 8%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/includes/navbar.jsp" /> 
        <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
        </section>

        <div class="faq_area section_padding_130" id="faq">
            <div class="container">
                <div class="row justify-content-center topDetail">
                    <div class="col-12 col-sm-8 col-lg-6">
                        <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <h3>Các câu hỏi thường gặp</h3>
                            <p>ColorBike sẽ mang đến trải nghiệm xứng đáng với những gì bạn kì vọng.</p>
                            <div class="line"></div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-lg-8">
                        <!-- FAQ Accordion List -->
                        <div class="accordion faq-accordian" id="faqAccordion">
                            <c:forEach var="faq" items="${FAQ}" varStatus="status">
                                <div class="card border-0 wow fadeInUp" data-wow-delay="${0.2 + status.index * 0.1}s" style="visibility: visible; animation-delay: ${0.2 + status.index * 0.1}s; animation-name: fadeInUp;">
                                    <div class="card-header" id="heading${status.index}">
                                        <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapse${status.index}" aria-expanded="false" aria-controls="collapse${status.index}">
                                            <i class="fas fa-question-circle" style="font-size:40px;color:#337AB7; margin-right: 1%;"></i>
                                            ${faq.question}
                                            <i class="fas fa-caret-down ml-auto rotate-icon"></i>
                                        </h6>
                                    </div>
                                    <div class="collapse" id="collapse${status.index}" aria-labelledby="heading${status.index}" data-parent="#faqAccordion">
                                        <div class="card-body">
                                            <p>${faq.answer}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- Support Button -->
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-lg-8">
                        <div class="support-button text-center d-flex align-items-center justify-content-center mt-4 wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                            <i class="lni-emoji-sad"></i>
                            <p class="mb-0 px-2">Can't find your answers?</p>
                            <a href="contact.jsp"> Contact us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.accordion .card-header h6').click(function () {
                    $(this).find('.fa-caret-down').toggleClass('fa-caret-up');
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
    </body>
</html>
