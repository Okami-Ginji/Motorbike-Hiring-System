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
        <jsp:include page="/includes/header.jsp" />
        <meta charset="utf-8">
        <title>FAQs</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

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
                /*z-index: 1;*/
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

           

            #backtoTopBtn {
                display: none; /* Ẩn nút ban đầu */
                position: fixed; /* Nút ở vị trí cố định trên màn hình */
                bottom: 20px; /* Khoảng cách từ dưới cùng */
                right: 30px; /* Khoảng cách từ bên phải */
                z-index: 99; /* Đảm bảo nút nằm trên các phần tử khác */
                border: none; /* Không viền */
                outline: none; /* Không viền khi nhấp */
                background: linear-gradient(to right, #1089FF 0%, #1089FF 28%, #01D28E 91%, #01D28E 100%);
                color: white; /* Màu chữ */
                cursor: pointer; /* Con trỏ chuyển thành tay khi di chuột */
                padding: 15px; /* Khoảng đệm bên trong nút */
                border-radius: 10px; /* Bo góc nút */
            }

            #backtoTopBtn:hover {
                background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%);
            }
            .accordion .card-header h6 {
                display: flex;                   /* Sử dụng flexbox để bố trí nội dung */
                justify-content: space-between;  /* Căn giữa các phần tử theo chiều ngang */
                align-items: center;             /* Căn giữa các phần tử theo chiều dọc */
            }

            .accordion .card-header i.fa-caret-down {
                margin-left: auto;               /* Đẩy biểu tượng icon về phía cuối dòng */
                font-size: 1.2em;                /* Thay đổi kích thước biểu tượng nếu cần */
                display: flex;                   /* Đảm bảo rằng biểu tượng tuân theo bố trí flex */
            }

            .accordion .card-header h6 .lni-chevron-up {
                display: none;                   /* Ẩn span "lni-chevron-up" nếu không cần thiết */
            }

        </style>
    </head>

    <body>
        <jsp:include page="/includes/navbar.jsp" /> 
        <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_3.jpg');"
                 data-stellar-background-ratio="0.5">
            <div class="overlay"></div>

        </section>
        
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
                                            aria-expanded="false" aria-controls="collapse${status.index}"><i class="fa fa-question-circle" style="font-size:40px;color:#158BFF; margin-right: 1%;"></i>
                                            ${faq.question}<i class="fa-solid fa-caret-down"></i><span class="lni-chevron-up"></span>
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

        <a id="backToTopBtn" href="#" class="back-to-top">Back to Top</a>

    </body> 

    <script>
        // Lắng nghe sự kiện scroll của trang
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            // Nếu scroll xuống 500px thì hiển thị nút "Back to Top", ngược lại ẩn đi
            if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
                document.getElementById("backToTopBtn").style.display = "block";
            } else {
                document.getElementById("backToTopBtn").style.display = "none";
            }
        }

        // Xử lý sự kiện khi nút được nhấp
        document.getElementById("backToTopBtn").onclick = function () {
            // Cuộn trang lên đầu
            document.body.scrollTop = 0; // Cho Safari
            document.documentElement.scrollTop = 0; // Cho Chrome, Firefox, IE và Opera
        }
    </script>

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
</html>
