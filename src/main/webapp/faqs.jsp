<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/png" href="images/logo.png"> <!-- Fixed the typo in rel attribute -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <title>FAQs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"> <!-- Thư viện animate.css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css"/>
        <!-- Thêm thư viện AOS (Animate on Scroll) để tăng hiệu ứng animation khi cuộn -->
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <style type="text/css">
            .section_heading h3 {
                color: #fff;
                padding: 10px 20px;
                border: 2px solid #1089FF;
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                display: inline-block;
                border-radius: 10px;
                /* Animation cho tiêu đề */
                animation: fadeInDown 1s ease-in-out;
            }

            .faq_area {
                padding-top: 100px;
                padding-bottom: 100px;
                position: relative;
                z-index: 1;
                background: white;
            }

            .faq-accordian .card-header {
                border-radius: 50px !important;
                background: radial-gradient(circle at 10% 20%, rgba(216, 241, 230, 0.46) 0.1%, rgba(233, 226, 226, 0.28) 90.1%);
                padding: 0;
                border-bottom: 5px solid #ebebeb;
                margin-bottom: 10px;
                /* Animation cho header card */
                animation: fadeInLeft 1s ease-in-out;
            }

            .faq-accordian .card-header h6 {
                cursor: pointer;
                padding: 1.75rem 2rem;
                color: #005689;
                display: flex;
                align-items: center;
            }

            .faq-accordian .card-header h6 span {
                font-size: 0.5rem;
            }

            .faq-accordian .card-header h6.collapsed {
                color: #001973;
            }

            .faq-accordian .card-header h6.collapsed .fa-caret-up {
                transform: rotate(-180deg);
            }

            .faq-accordian .card .card-body {
                padding: 1.75rem 2rem;
                color: black;
                /* Animation cho nội dung card */
                animation: fadeInRight 1s ease-in-out;
            }

            .support-button {
                /* Animation cho nút hỗ trợ */
                animation: fadeInUp 1.5s ease-in-out;
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
            .noidung {
                margin-top: 3%;
            }
            .scrollup1 {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 40px;
                height: 40px;
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                border-radius: 50%;
                text-align: center;
                line-height: 40px;
                color: #fff;
                font-size: 24px;
                text-decoration: none;
                transition: background-color 3s ease;
            }

            .scrollup1 :hover {
                color: #000;
            }

            .scrollup1 .ri-arrow-up-fill {
                vertical-align: middle;
            }
        </style>
        <jsp:include page="/includes/customer/header.jsp" />
    </head>
    <body>

        <jsp:include page="/includes/customer/navbar.jsp" />

        <div class="faq_area section_padding_130" id="faq">
            <div class="container noidung" data-aos="fade-up">
                <div class="row justify-content-center topDetail" data-aos="fade-up">
                    <div class="col-12 col-sm-8 col-lg-6">
                        <!--                        <div class="section_heading text-center">
                                                    <h3>Các câu hỏi thường gặp</h3>
                                                    <p style="margin-top: 3%; font-size: 20px; color:#001973;">ColorBike sẽ mang đến trải nghiệm xứng đáng với những gì bạn kì vọng.</p>
                                                    <div class="line"></div>
                                                </div>-->
                        <div class="container section-title" data-aos="fade-up">
                            <span>FAQs Questions</span>
                            <h2>Các Câu Hỏi Thường Gặp</h2>
                            <p>Điều gì khiến ColorBike là lựa chọn tốt nhất cho
                                "hành trình mới, xe cũng mới"?</p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-lg-8" data-aos="fade-up">
                        <div class="accordion faq-accordian" id="faqAccordion">
                            <c:forEach var="faq" items="${sessionScope.FAQ}" varStatus="status">
                                <div class="card border-0" data-aos="fade-in" data-aos-delay="${status.index * 100}">
                                    <div class="card-header" id="heading${status.index}">
                                        <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapse${status.index}" aria-expanded="false" aria-controls="collapse${status.index}">
                                            <i class="fas fa-question-circle" style="font-size:40px; margin-right: 1%;"></i>
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
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-lg-8">
                        <div class="support-button text-center d-flex align-items-center justify-content-center mt-4" data-aos="zoom-in" data-aos-delay="500">
                            <i class="lni-emoji-sad"></i>
                            <p class="mb-0 px-2">Bạn không tìm thấy câu trả lời</p>
                            <a style="box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3); border-radius: 8px; padding: 1%; color: #0482C8;" href="contact.jsp">Hãy liên hệ với chúng tôi!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/includes/customer/footer.jsp" />

        <!-- Các tệp JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init({
                duration: 500, // Duration of the animations in milliseconds
                once: true, // Whether animation should happen only once - while scrolling down
            });

            $(document).ready(function () {
                $('.accordion .card-header h6').click(function () {
                    $(this).find('.fa-caret-down').toggleClass('fa-caret-up');
                });
            });
        </script>

    </body>
</html>
