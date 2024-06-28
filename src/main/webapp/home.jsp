<%-- 
    Document   : home
    Created on : Jun 24, 2024, 2:15:07 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <jsp:include page="/includes/header2.jsp" />

        <style>
            .rental{
                width: 50%;
                padding: 2.5% 0%;
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                font-size: 24px;
                font-weight: 800;
                color: white;
                transition: transform .2s;
                border: 1px solid rgb(2, 184, 175); 
                border-radius: 5px;
                box-shadow: 0 2px 10px #9BE9E6;
            }
            .rental :hover{
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%);                
            }
            .rentalbutton:hover {
                transform: scale(1.1);
                margin-left: 5%;
            }


            .sitename {
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                background-clip: text;
                color: transparent !important;
            }
            .gradient-button {
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                color: white; /* Màu chữ */
                padding: 10px 20px; /* Đệm cho nút */
                border-radius: 5px; /* Bo góc */
                text-decoration: none; /* Xóa gạch chân */
                display: inline-block; /* Hiển thị như một khối nội dòng */
                transition: background 0.3s; /* Hiệu ứng chuyển đổi nền khi di chuột */
                margin-bottom: 4%;
            }

            .gradient-button:hover {
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%);
                color: white;
            }
            .call-to-action a:hover{
                color: white;
            }
        </style>
    </head>

    <body class="index-page">

        <jsp:include page="/includes/navbar2.jsp" />

        <main class="main">

            <!-- Hero Section -->
            <section id="hero" class="hero section">

                <img src="assets/img/world-dotted-map.png" alt="World Map"
                     class="hero-bg" data-aos="fade-in">

                <div class="container">
                    <div class="row gy-4 d-flex justify-content-between">
                        <div
                            class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
                            <h2 data-aos="fade-up">Khám phá cùng COLORBIKE</h2>
                            <p data-aos="fade-up" data-aos-delay="100">Hành trình bạn tìm
                                kiếm, chúng tôi đồng hành để mang đến cho bạn trải nghiệm xe máy
                                đơn giản, an toàn và đầy thú vị</p>
                            <div class="rentalbutton">
                                <a href="booking" type="button"
                                        class="align-items-stretch mb-3 rental"
                                        data-aos="fade-up" style="padding: 2.5%; font-size: large; font-weight: 700; text-align: center; color: white;">THUÊ XE NGAY</a>
                            </div>
                            <div class="row gy-4" data-aos="fade-up" data-aos-delay="300">

                                <div class="col-lg-3 col-6">
                                    <div class="stats-item text-center w-100 h-100">
                                        <span data-purecounter-start="0" data-purecounter-end="2324"
                                              data-purecounter-duration="0"
                                              class="purecounter">2324</span>
                                        <p>Khách Hàng</p>
                                    </div>
                                </div><!-- End Stats Item -->

                                <div class="col-lg-3 col-6">
                                    <div class="stats-item text-center w-100 h-100">
                                        <span data-purecounter-start="0" data-purecounter-end="20"
                                              data-purecounter-duration="0"
                                              class="purecounter">20</span>
                                        <p>Năm Hoạt Động</p>
                                    </div>
                                </div><!-- End Stats Item -->

                                <div class="col-lg-3 col-6">
                                    <div class="stats-item text-center w-100 h-100">
                                        <span data-purecounter-start="0" data-purecounter-end="55"
                                              data-purecounter-duration="0"
                                              class="purecounter">55</span>
                                        <p>Đối Tác</p>
                                    </div>
                                </div><!-- End Stats Item -->

                                <div class="col-lg-3 col-6">
                                    <div class="stats-item text-center w-100 h-100">
                                        <span data-purecounter-start="0" data-purecounter-end="150"
                                              data-purecounter-duration="0"
                                              class="purecounter">150</span>
                                        <p>Nhân Viên</p>
                                    </div>
                                </div><!-- End Stats Item -->

                            </div>

                        </div>

                        <div class="col-lg-5 order-1 order-lg-2 hero-img"
                             data-aos="zoom-out">
                            <img src="assets/img/baner.png"
                                 class="img-fluid mb-3 mb-lg-0"
                                 alt>
                        </div>

                    </div>
                </div>

            </section><!-- /Hero Section -->
            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <span>Vì sao chọn chúng tôi<br></span>
                <h2>Vì sao chọn chúng tôi</h2>
                <p>Sắc màu hành trình, chọn chúng tôi để khởi đầu</p>
            </div><!-- End Section Title -->
            <!-- Featured Services Section -->
            <section id="featured-services" class="featured-services section">

                <div class="container">

                    <div class="row gy-4">

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="100">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-bars"></i></div>
                            <div>
                                <h4 class="title">Lựa chọn đa dạng</h4>
                                <p class="description">Hàng trăm loại xe đa dạng ở nhiều địa
                                    điểm tại Đà Nẵng, phù hợp với mọi mục đích của bạn.</p>
                            </div>
                        </div>
                        <!-- End Service Item -->

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="200">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-motorcycle"></i></div>
                            <div>
                                <h4 class="title">Thuận lợi</h4>
                                <p class="description">Dễ dàng tìm kiếm, so sánh và đặt xe máy
                                    bạn muốn chỉ với vài cú nhấp chuột.</p>
                            </div>
                        </div><!-- End Service Item -->

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="300">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-money-bill-transfer"></i></div>
                            <div>
                                <h4 class="title">Giá cả cạnh tranh</h4>
                                <p class="description">Giá thuê được niêm yết công khai và rẻ
                                    hơn tới 10% so với giá truyền thống.</p>
                            </div>
                        </div><!-- End Service Item -->

                    </div>
                    <div class="row gy-4">

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="100">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-circle-check"></i></div>
                            <div>
                                <h4 class="title">Đáng tin cậy</h4>
                                <p class="description">Tất cả các xe đều có tuổi thọ dưới 3 năm
                                    và được bảo dưỡng định kỳ.</p>
                            </div>
                        </div>
                        <!-- End Service Item -->

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="200">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-truck"></i></div>
                            <div>
                                <h4 class="title">Dịch vụ hỗ trợ 24/7</h4>
                                <p class="description">Có nhân viên hỗ trợ khách hàng trong suốt
                                    quá trình thuê xe.</p>
                            </div>
                        </div><!-- End Service Item -->

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="300">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-calendar-days"></i></div>
                            <div>
                                <h4 class="title">Thời gian thuê linh hoạt</h4>
                                <p class="description">Bạn có thể đặt xe máy trong bất kỳ khoảng
                                    thời gian nào và gia hạn nếu muốn.</p>
                            </div>
                        </div><!-- End Service Item -->

                    </div>

                </div>

            </section><!-- /Featured Services Section -->


            <div class="container section-title" data-aos="fade-up">
                <span>TOP Sản Phẩm<br></span>
                <h2>TOP Sản Phẩm</h2>
            </div>
            <iframe src="slide.jsp" style="width: 99.1%; height: 540px; padding: 0; margin: 0;"></iframe>
               

            <!-- Call To Action Section -->
            <section id="call-to-action" class="call-to-action section">

                <img src="assets/img/cta-bg.jpg" alt>

                <div class="container">
                    <div class="row justify-content-center" data-aos="zoom-in"
                         data-aos-delay="100">
                        <div class="col-xl-10">
                            <div class="text-center">
                                <h3>Khám phá tự do với chuyến đi của bạn.</h3>
                                <p>Khám phá vào một cuộc phiêu lưu mới cùng với
                                    chúng tôi. Đặt xe của bạn ngay hôm nay và tận hưởng sự tự do
                                    không giới hạn trên mọi con đường.</p>
                                <a class="cta-btn" href="booking">THUÊ XE NGAY</a>
                            </div>
                        </div>
                    </div>
                </div>

            </section><!-- /Call To Action Section -->

            <!-- About Section -->
            <section id="about" class="about section" style="margin-top: 3%; margin-bottom: 3%;">

                <div class="container">

                    <div class="row gy-4">

                        <div
                            class="col-lg-6 position-relative align-self-start order-lg-last order-first"
                            data-aos="fade-up" data-aos-delay="200">
                            <img src="assets/img/about.jpg" class="img-fluid" alt>
                            <a href="https://www.youtube.com/watch?v=LXb3EKWsInQ"
                               class="glightbox play-btn"></a>
                        </div>

                        <div class="col-lg-6 content order-last  order-lg-first"
                             data-aos="fade-up" data-aos-delay="100">
                            <h3>Về Chúng Tôi</h3>
                            <p>
                                Chúng tôi là đối tác lý tưởng của bạn trong mọi chuyến đi bằng
                                xe máy tại Đà Nẵng. Với sứ mệnh mang đến sự thuận tiện và
                                trải nghiệm đáng nhớ, chúng tôi cung cấp dịch vụ cho thuê xe máy
                                với đội ngũ phương tiện đa dạng và chất lượng hàng đầu.
                            </p>
                            <ul>
                                <li>
                                    <i class="bi bi-diagram-3"></i>
                                    <div>
                                        <h5>Đa dạng sản phẩm</h5>
                                        <p>Từ các loại xe máy tiện dụng đến những mẫu xe cao cấp,
                                            chúng tôi luôn có sự lựa chọn phù hợp với nhu cầu của
                                            bạn.</p>
                                    </div>
                                </li>
                                <li>
                                    <i class="bi bi-fullscreen-exit"></i>
                                    <div>
                                        <h5>Dịch vụ chuyên nghiệp</h5>
                                        <p>Đội ngũ nhân viên tận tâm sẵn sàng phục vụ, từ việc tư
                                            vấn cho đến hỗ trợ kỹ thuật, để bạn có một chuyến đi suôn
                                            sẻ và an toàn.</p>
                                    </div>
                                </li>
                                <li>
                                    <i class="bi bi-broadcast"></i>
                                    <div>
                                        <h5>Tiêu chuẩn chất lượng cao</h5>
                                        <p>Tất cả các xe đều được bảo trì thường xuyên và kiểm tra
                                            kỹ lưỡng trước khi cho thuê, đảm bảo sự an toàn và tin
                                            cậy.</p>
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>

            </section><!-- /About Section -->

            <!-- Services Section -->

            <!-- Testimonials Section -->
            <section id="testimonials" class="testimonials section">

                <img src="assets/img/testimonials-bg.jpg" class="testimonials-bg" alt>

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="swiper init-swiper">
                        <script type="application/json" class="swiper-config">
                            {
                            "loop": true,
                            "speed": 600,
                            "autoplay": {
                            "delay": 5000
                            },
                            "slidesPerView": "auto",
                            "pagination": {
                            "el": ".swiper-pagination",
                            "type": "bullets",
                            "clickable": true
                            }
                            }
                        </script>
                        <div class="swiper-wrapper">
                            <c:forEach items="${listF}" var="feedback">
                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <img src="images/${feedback.customerImage}" class="testimonial-img" alt>
                                        <h3>${feedback.customerName}</h3>
                                        <h4>Rental Customer</h4>
                                        <c:forEach begin="1" end="${(feedback.productRate + feedback.serviceRate + feedback.deliveryRate) / 3}" var="star">
                                            <span style="color: #F7D000;" class="ion-ios-star"></span>
                                        </c:forEach>
                                        <c:forEach begin="${(feedback.productRate + feedback.serviceRate + feedback.deliveryRate) / 3 + 1}" end="5" var="emptyStar">
                                            <span class="ion-ios-star-outline"></span>
                                        </c:forEach>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>${feedback.content}</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div><!-- End testimonial item -->
                            </c:forEach>


                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>

            </section><!-- /Testimonials Section -->

        </main>

        <jsp:include page="/includes/footer.jsp" />

        <!-- Scroll Top -->
        <a href="#" id="scroll-top"
           class="scroll-top d-flex align-items-center justify-content-center"
           style="background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>