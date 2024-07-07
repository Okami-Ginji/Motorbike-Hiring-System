<%-- 
    Document   : sidebar2
    Created on : Jun 29, 2024, 2:00:00 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Favicons -->
<!--<link href="staffAssets/img/favicon.png" rel="icon">-->
<!--<link href="staffAssets/img/apple-touch-icon.png" rel="apple-touch-icon">-->
<link rel="website icon" type="png" href="images/logo.png">
<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"><!--
-->        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"><!--
-->        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="staffAssets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="staffAssets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="staffAssets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Main CSS File -->
<link href="staffAssets/css/style.css" rel="stylesheet">
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between flex-row-reverse">
        <a href="homeStaff.jsp" class="logo d-flex align-items-center">
            <img src="images/logo.png" alt="">
            <span class="d-none d-lg-block">ColorBike</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">
            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    
                    <img src="images/${account.image}" alt="Profile" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2">${account.lastName}</span>
                </a><!-- End Profile Image Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>${account.firstName} ${account.lastName}</h6>
                        <span>${account.userName}</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="profileStaff.jsp">
                            <i class="bi bi-person"></i>
                            <span>Thông tin cá nhân</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                            <i class="bi bi-gear"></i>
                            <span>Cài đặt tài khoản</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="logout">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Đăng xuất</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->


<script src="staffAssets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="staffAssets/vendor/chart.js/chart.umd.js"></script>
<script src="staffAssets/vendor/echarts/echarts.min.js"></script>
<script src="staffAssets/vendor/quill/quill.js"></script>
<script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="staffAssets/vendor/tinymce/tinymce.min.js"></script>
<script src="staffAssets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="staffAssets/js/main.js"></script>
