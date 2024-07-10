<%-- 
    Document   : policies
    Created on : May 25, 2024, 4:59:04 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Chính sách & Điều Khoản</title>
        <link rel="website icon" type="png" href="images\logo.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"> 

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        
        <style>
            body {
                font-family: 'Varela Round', sans-serif;
            }
            .nav-tabs {
                position: fixed;
                top: 0;
                left: 10px;
                width: 300px;
                height: 82%;
                background: radial-gradient(circle at 10% 20%, rgb(226, 240, 254) 0%, rgb(255, 247, 228) 90%);
                border-radius: 30px;
                border: 2px solid #001973 !important;
                padding: 25px;
                margin-top: 122px;

            }
            .nav-tabs li {
                margin-bottom: 5px;
                width: 280px;
                margin-left: 22px;
            }

            .nav-tabs a {
                border-radius: 30px;
            }
            .content-wrapper {
                margin-left: 316px;
                padding-top: 20px;
                margin-top: 8%;
            }
            .content-section {
                margin-bottom: 30px;
                padding: 15px;
                border: 1px solid #001973;
                border-radius: 5px;
                background-color: #EFFAF4;
            }
            .content-section h3 {
                font-size: 24px;
                color: #001973;
                font-weight: bold;
            }

            .nav-tabs li a {
                color: #001973;
                background-color: #fff;
                font-size: 16px;
                text-align: center;
                text-transform: uppercase;
                padding: 10px;
                margin-bottom: 5px;
                display: block;
                border: 3px solid transparent;
                transition: all 0.3s ease;
            }
            .nav-tabs li.active a,
            .nav-tabs li a:hover {
                color: #fff;
                background-color: #001973;
                border-color: #001973;
            }

            @media only screen and (max-width: 767px) {
                .nav-tabs {
                    position: static;
                    width: 100%;
                    border-right: none;
                    padding-top: 0;
                }
                .content-wrapper {
                    margin-left: 0;
                    padding-top: 70px; /* Adjusted for top navbar height */
                }
            }
        </style>
    </head>

    <body>
        <div>
            <jsp:include page="/includes/customer/navbar.jsp" />
        </div>
        <div class="container-fluid">
            <div class="vertical-tab">
                <div>
                    <ul class="nav nav-tabs animate__animated animate__fadeInUp">
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#Section1">Đăng ký và Tài khoản</a></li>
                        <li><a href="#Section2">Điều khoản Thuê xe</a></li>
                        <li><a href="#Section3">Sử dụng Xe</a></li>
                        <li><a href="#Section4">Bảo hiểm và Trách nhiệm</a></li>
                        <li><a href="#Section5">Hủy Bỏ và Hoàn Tiền</a></li>
                        <li><a href="#Section6">Quyền riêng tư</a></li>
                        <li><a href="#Section7">Thay đổi Điều khoản</a></li>
                        <li><a href="#Section8">Liên hệ</a></li>
                    </ul>
                </div>
                <div class="content-wrapper animate__animated animate__fadeInUp">
                    <div id="Section1" class="content-section">
                        <h3>Giới thiệu</h3>
                        <p>Chào mừng bạn đến với ColorBike! Trang web của chúng
                            tôi cung cấp dịch vụ cho thuê xe máy nhằm giúp bạn
                            dễ dàng di chuyển và khám phá. Vui lòng đọc kỹ các
                            điều khoản và điều kiện dưới đây trước khi sử dụng
                            dịch vụ của chúng tôi.</p>
                    </div>
                    <div id="Section2" class="content-section">
                        <h3>Đăng ký và Tài khoản</h3>
                        <p>
                            <b>Đăng ký Tài khoản:</b> Người dùng phải đăng ký
                            một tài khoản hợp lệ trên trang web ColorBike để sử
                            dụng dịch vụ cho thuê xe.<br>
                            <b>Bảo mật Tài khoản:</b> Người dùng có trách nhiệm
                            bảo mật thông tin tài khoản của mình. ColorBike
                            không chịu trách nhiệm cho bất kỳ thiệt hại nào phát
                            sinh do việc lạm dụng tài khoản.
                        </p>
                    </div>
                    <div id="Section3" class="content-section">
                        <h3>Điều khoản Thuê xe</h3>
                        <p>
                            <b>Điều kiện Thuê xe:</b> Người thuê xe phải có bằng
                            lái xe hợp lệ và đủ 18 tuổi trở lên.<br>
                            <b>Quá trình Thuê xe:</b> Người dùng có thể đặt xe
                            trực tuyến thông qua trang web của chúng tôi. Một
                            khi đặt xe, người dùng sẽ nhận được xác nhận qua
                            email với thông tin chi tiết về xe và thời gian
                            thuê.<br>
                            <b>Thanh toán:</b> Thanh toán phải được thực hiện
                            trước khi nhận xe. Chúng tôi chấp nhận các phương
                            thức thanh toán qua thẻ tín dụng, thẻ ghi nợ, và các
                            ví điện tử hợp lệ.
                        </p>
                    </div>
                    <div id="Section4" class="content-section">
                        <h3>Sử dụng Xe</h3>
                        <p>
                            <b>Sử dụng An toàn:</b> Người dùng phải tuân thủ tất
                            cả các luật giao thông hiện hành và đảm bảo an toàn
                            khi sử dụng xe.<br>
                            <b>Bảo quản Xe:</b> Người dùng có trách nhiệm bảo
                            quản xe trong suốt thời gian thuê. Mọi hư hại hoặc
                            mất mát phải được báo cáo ngay lập tức cho
                            ColorBike.<br>
                            <b>Trả Xe:</b> Xe phải được trả đúng giờ và đúng địa
                            điểm quy định. Trả xe muộn sẽ bị tính phí thêm theo
                            quy định của ColorBike.
                        </p>
                    </div>
                    <div id="Section5" class="content-section">
                        <h3>Bảo hiểm và Trách nhiệm</h3>
                        <p>
                            <b>Bảo hiểm:</b> ColorBike cung cấp bảo hiểm cơ bản
                            cho xe thuê. Người dùng có thể mua thêm các gói bảo
                            hiểm mở rộng nếu cần.<br>
                            <b>Trách nhiệm:</b> Người dùng chịu trách nhiệm pháp
                            lý cho mọi hành động và hậu quả phát sinh từ việc
                            sử dụng xe thuê.
                        </p>
                    </div>
                    <div id="Section6" class="content-section">
                        <h3>Hủy Bỏ và Hoàn Tiền</h3>
                        <p>
                            <b>Chính sách Hủy bỏ:</b> Người dùng có thể hủy đơn
                            hàng mà không mất phí trước 24 giờ so với thời gian
                            nhận xe.<br>
                            <b>Hoàn Tiền:</b> Hoàn tiền sẽ được xử lý trong vòng
                            7 ngày làm việc sau khi yêu cầu hủy bỏ được xác
                            nhận.
                        </p>
                    </div>
                    <div id="Section7" class="content-section">
                        <h3>Quyền riêng tư</h3>
                        <p>
                            <b>Bảo vệ Thông tin:</b> Chúng tôi cam kết bảo vệ
                            thông tin cá nhân của người dùng và chỉ sử dụng thông
                            tin này theo các mục đích hợp pháp liên quan đến dịch
                            vụ của chúng tôi.<br>
                            <b>Chia sẻ Thông tin:</b> Chúng tôi không bán, cho thuê
                            hoặc chia sẻ thông tin cá nhân của người dùng cho bên
                            thứ ba ngoài các mục đích được quy định trong chính
                            sách bảo vệ thông tin.
                        </p>
                    </div>
                    <div id="Section8" class="content-section">
                        <h3>Thay đổi Điều khoản</h3>
                        <p>
                            <b>Cập nhật Điều khoản:</b> Chúng tôi có quyền điều chỉnh
                            và cập nhật Điều khoản và Điều kiện này vào bất kỳ lúc
                            nào. Người dùng nên xem lại các điều khoản này thường
                            xuyên để cập nhật thông tin mới nhất.
                        </p>
                    </div>
                    <div id="Section9" class="content-section">
                        <h3>Liên hệ</h3>
                        <p>
                            <b>Hỗ trợ Khách hàng:</b> Nếu có bất kỳ câu hỏi hoặc thắc
                            mắc nào về các điều khoản và điều kiện này, vui lòng liên
                            hệ với chúng tôi qua email hoặc số điện thoại được cung
                            cấp trên trang web của chúng tôi.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <%--<jsp:include page="/includes/customer/footer.jsp" />--%>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
