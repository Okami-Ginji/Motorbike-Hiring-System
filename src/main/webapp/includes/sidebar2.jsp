<%-- 
    Document   : sidebar2
    Created on : Jun 29, 2024, 2:00:00 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Favicons -->
<link href="staffAssets/img/favicon.png" rel="icon">
<link href="staffAssets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

<!-- Vendor CSS Files -->
<!-- <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
-->        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"><!--
        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="staffAssets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    .custom-icon:before {
            content: "\f444"; /* Mã Unicode của biểu tượng */
            font-family: "Font Awesome 5 Free";
            font-weight: 900; /* Dùng font-weight 900 cho các biểu tượng Solid */
            display: inline-block;
    font-family: bootstrap-icons !important;
    font-style: normal;
    font-weight: normal !important;
    font-variant: normal;
    text-transform: none;
    line-height: 1;
    vertical-align: -.125em;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale
        }
</style>
<!-- Template Main CSS File -->
<link href="staffAssets/css/style.css" rel="stylesheet">
<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="staff2.jsp">
                <i class="bi bi-grid"></i>
                <span>Trang chủ</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="manageCustomer">
                <i class="bi bi-grid"></i>
                <span>Thông tin khách hàng</span>
            </a>
        </li><!-- End Dashboard Nav -->



        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>Xe Máy</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a onclick="CallSideBar('motorManage')">
                        <i class="bi bi-circle"></i><span>Thông tin xe máy</span>
                    </a>
                </li>
                <li>
                    <a href="manageBooking">
                        <i class="bi bi-circle"></i><span>Quản lí thuê xe</span>
                    </a>
                </li>
                <li>
                    <a href="pricingManage">
                        <i class="bi bi-circle"></i><span>Quản lí bảng giá</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Forms Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>Dịch vụ</span><i
                    class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a onclick="CallSideBar('feedbackManage')">
                        <i class="bi bi-circle"></i><span>Quản lí Đánh giá</span>
                    </a>
                </li>
                <li>
                    <a onclick="CallSideBar('eventStaffServlet')">
                        <i class="bi bi-circle"></i><span>Quản lí sự kiện</span>
                    </a>
                </li>
                <li>
                    <a onclick="CallSideBar('TourismLocationServletStaff')" >
                        <i class="bi bi-circle"></i><span>Quản lí địa điểm du lịch</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->

        <li class="nav-heading">Pages</li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Profile</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="faqs">
                <i class="bi bi-question-circle"></i>
                <span>F.A.Q</span>
            </a>
        </li><!-- End F.A.Q Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="contactManage">
                <i class="bi bi-envelope"></i>
                <span>Liên hệ</span>
            </a>
        </li><!-- End Contact Page Nav -->


        <li class="nav-item">
            <a class="nav-link collapsed" href="pages-login.html">
                <i class="bi bi-box-arrow-in-right"></i>
                <span>Login</span>
            </a>
        </li><!-- End Login Page Nav -->

    </ul>

</aside><!-- End Sidebar-->
<!-- Vendor JS Files -->
<script src="staffAssets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="staffAssets/vendor/chart.js/chart.umd.js"></script>
<script src="staffAssets/vendor/echarts/echarts.min.js"></script>
<script src="staffAssets/vendor/quill/quill.js"></script>
<script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="staffAssets/vendor/tinymce/tinymce.min.js"></script>
<script src="staffAssets/vendor/php-email-form/validate.js"></script>

<script>
    function CallSideBar(iframeSrc){
        var url = "manageColorBike.jsp?iframeSrc=" + iframeSrc;
            
            // Chuyển hướng đến URL mới
            window.location.href = url;
    }
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--<script>
    $(document).ready(function () {
        // Toggle submenus
        $('.sidebar ul li').click(function () {
            $(this).children('ul').slideToggle();
            $(this).find('.arrow').toggleClass('collapsed');
        });

        // Smooth scroll
        $('.sidebar ul li a').click(function (e) {
//            e.preventDefault();
            var target = $(this).attr('href');
            $('html, body').animate({
                scrollTop: $(target).offset().top
            }, 800);
        });
    });
    
    
    
</script>-->
<!-- Template Main JS File -->
<!--<script src="staffAssets/js/main.js"></script>-->
