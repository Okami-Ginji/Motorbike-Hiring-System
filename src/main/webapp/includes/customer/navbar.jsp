<%-- 
    Document   : navbar2
    Created on : Jun 24, 2024, 3:26:58 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/includes/customer/header.jsp"/>

<header id="header" class="header d-flex align- items-center fixed-top" style="background-color: #EFFAF4">
    <div
        class="container-fluid container-xl position-relative d-flex align-items-center">

        <a href="home" class="logo d-flex align-items-center me-auto">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <!-- <img src="assets/img/logo.png" alt=""> -->
            <h1 class="sitename">COLORBIKE</h1>
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="home">Trang Chủ<br></a></li>
                <li><a href="about.jsp">Về Chúng Tôi</a></li>
                <li><a href="motorcycle">Xe Máy</a></li>
                <li><a href="pricing">Bảng Giá</a></li>
                <li class="dropdown"><a><span>Dịch Vụ</span> <i
                            class="bi bi-chevron-down toggle-dropdown"></i></a>
                    <ul>
                        <li><a href="FAQ">FAQs</a></li>
                        <li><a href="event">Sự Kiện</a></li>
                        <li><a href="touristLocation">Địa Điểm Du Lịch</a></li>
                        <!-- <li><a href="#">Dropdown 4</a></li> -->
                    </ul>
                </li>
                <li><a href="contact.jsp">Liên Hệ</a></li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <c:if test="${sessionScope.account == null}">
            <a class="btn login" href="login.jsp" style="color: white;">Đăng Nhập</a>
        </c:if>
        <c:if test="${sessionScope.account != null}">

            <div class="user-menu-wrap">

                <a class="mini-photo-wrapper"><img class="mini-photo object-fit-cover" src="images/${account.image}" width="36" height="36"/></a>


                <div class="menu-container">
                    <ul class="user-menu">
                        <div class="profile-highlight align-items-center">
                            <img src="images/${account.image}" alt="profile-img" width=56 height=56>
                            <div class="details">
                                <div class="sitename" id="profile-name">COLORBIKE</div>
                                <div id="profile-footer">Xin chào ${sessionScope.account.email}</div>
                            </div>
                        </div>
                        <!--                        <li class="user-menu__item">
                                                    <a class="user-menu-link" href="#">
                                                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1604623/trophy.png" alt="trophy_icon" width=20 height=20>
                                                        <div>Achievements</div>
                                                    </a>
                                                </li>-->
                        <li class="user-menu__item">
                            <a class="user-menu-link" href="profileCustomer.jsp">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1604623/team.png" alt="team_icon" width=20 height=20 >
                                <div>Thông tin cá nhân</div>
                            </a>
                        </li>
                        <li class="user-menu__item">
                            <a class="user-menu-link" href="bookingHistory?status=all">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1604623/book.png" alt="team_icon" width=20 height=20 >
                                <div>Quản lý đặt hàng</div>
                            </a>
                        </li>
                        <div class="footer">
                            <li class="user-menu__item"><a class="user-menu-link" href="logout" style="background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);background-clip: text;
                                                           color: transparent !important; font-weight: bold; font-size: large; display: flex; justify-content: center;">Đăng xuất</a></li>
                            <!--<li class="user-menu__item"><a class="user-menu-link" href="#">Settings</a></li>-->
                        </div>
                    </ul>
                </div>
            </div>
        </c:if>
    </div>

</header>

<style>

    * {
        box-sizing: border-box;
        /*        margin: 0;
                padding: 0;*/
    }

    body {
        background-color: #FFFFFF;
        font-family: sans-serif;
    }

    ul {
        list-style: none;
    }
    ol, ul {
        padding-left: 0rem !important;
    }

    /* User Menu */
    .user-menu-wrap {
        margin-left: 60px;
        /*        position: relative;
                width: 36px;*/
        /*margin: 50px auto;*/
    }

    .menu-container {
        visibility: hidden;
        opacity: 0;
    }

    .menu-container.active {
        visibility: visible;
        opacity: 1;
        transition: all .2s ease-in-out;
    }

    .user-menu {

        position: absolute;
        left: 87.5%;
        background-color: #FFFFFF;
        width: 256px;
        border-radius: 2px;
        border: 1px solid rgba(0,0,0,0.15);
        padding-top: 5px;
        padding-bottom: 5px;
        margin-top: 20px;
        margin-right: 30px;
    }

    .user-menu .profile-highlight {
        display: flex;
        border-bottom: 1px solid #E0E0E0;
        padding: 12px 16px;
        margin-bottom: 6px;
    }

    .user-menu .profile-highlight img {
        width: 48px;
        height: 48px;
        border-radius: 25px;
        object-fit: cover;
    }

    .user-menu .profile-highlight .details {
        display: flex;
        flex-direction: column;
        margin: auto 12px;
    }

    .user-menu .profile-highlight #profile-name {
        font-weight: 600;
        font-size: 16px;
    }

    .user-menu .profile-highlight #profile-footer {
        font-weight: 300;
        font-size: 14px;
        margin-top: 4px;
    }

    .user-menu .footer {
        border-top: 1px solid #E0E0E0;
        padding-top: 6px;
        margin-top: 6px;
    }

    .user-menu .footer .user-menu-link {
        font-size: 13px;
    }

    .user-menu .user-menu-link {
        display: flex;
        text-decoration: none;
        /*color: #333333;*/
        font-weight: 400;
        font-size: 14px;
        padding: 12px 16px;
    }

    .user-menu .user-menu-link div {
        margin: auto 10px;
    }

    .user-menu .user-menu-link:hover {
        background-color: #F5F5F5;
        color: #333333;
    }

    .user-menu:before {
        position: absolute;
        top: -16px;
        left: 120px;
        display: inline-block;
        content: "";
        border: 8px solid transparent;
        border-bottom-color: #E0E0E0;
    }

    .user-menu:after {
        position: absolute;
        top: -14px;
        left: 121px;
        display: inline-block;
        content: "";
        border: 7px solid transparent;
        border-bottom-color: #FFFFFF;
    }
    .mini-photo{
        width: 45px;
        height: 45px;
        border-radius: 10px;
        box-shadow: #0d82a2 0 0 5px;
    }

    /*cu*/
    .rental{
        width: 50%;
        padding: 2.5% 0%;
        background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
        font-size: 24px;
        font-weight: 800;
        color: white;
        transition: transform .2s;
    }
    .rental:hover{
        background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%);
    }
    .rentalbutton:hover {
        transform: scale(1.1);
        margin-left: 5%;
    }

    .login{
        background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
        margin-left: 3%;
        color: white;
    }
    .login:hover{
        color: black;
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


</style>
<script>
    document.querySelector('.mini-photo-wrapper').addEventListener('click', function () {
        document.querySelector('.menu-container').classList.toggle('active');
    });
</script>