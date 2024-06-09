<%-- 
    Document   : navbar
    Created on : May 25, 2024, 5:15:55?PM
    Author     : DiepTCNN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/includes/header.jsp" />
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a style="font-size: 40px;" class="navbar-brand" href="index.jsp">Color<span>Bike</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a style="font-size: larger;" href="index.jsp" class="nav-link">Home</a></li>
                <li class="nav-item"><a style="font-size: larger;" href="about.jsp" class="nav-link">About</a></li>
                <li class="nav-item"><a style="font-size: larger;" href="policies.jsp" class="nav-link">Policies&Terms</a>
                </li>
                <li class="nav-item"><a style="font-size: larger;" href="pricing.jsp" class="nav-link">Pricing</a></li>

                <li class="nav-item"><a style="font-size: larger;" href="motorcycle" class="nav-link">Motorbikes</a></li>
                <li class="nav-item"><a style="font-size: larger;" href="touristLocation" class="nav-link">Location</a></li>

                <li class="nav-item"><a style="font-size: larger;" href="contact.jsp" class="nav-link">Contact</a></li>
                    <c:if test="${sessionScope.account == null}">
                    <li class="nav-item"><a style="font-size: larger;" href="login.jsp" class="nav-link">Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                    <div class="dropdown">

                        <a class="nav-item btn btn-outline-primary dropdown-toggle nav-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Hello ${sessionScope.account.email}

                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" id="myDropdown">

                            <a class="dropdown-item" href="profileCustomer.jsp">Thông tin cá nhân</a>
                            <a class="dropdown-item" href="">Quản lý đặt hàng</a>
                            <a class="dropdown-item" href="logout">Đăng xuất</a>
                        </div>

                    </div>
                </c:if>
            </ul>
        </div>
    </div>

    <style>
        .emaildrop{
            width: 90%;
        }
        .dropdown{
            margin-top: 12px;
            color: white;
        }
        .dropdown-menu {
            background-color: #fff; /* ??i m?u n?n c?a dropdown menu */
            border: 1px solid #ddd; /* Th?m border ?? ph?n bi?t v?i background */
            border-radius: 5px; /* L?m tr?n c?c g?c */
            padding: 10px; /* Th?m padding ?? c?c m?c trong dropdown menu kh?ng qu? g?n nhau */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Th?m shadow ?? t?o hi?u ?ng n?i b?t */
        }
        .dropdown-item {
            color: #333; /* ??i m?u ch? */
            font-size: 14px; /* ??i k?ch c? font ch? */
        }
        .dropdown-item:hover {
            background-color: #f5f5f5; /* ??i m?u n?n khi di chu?t qua m?c */
        }
        .dropdown:hover .dropdown-menu {
            display: block; /* Hi?n th? dropdown menu khi di chu?t qua dropdown */
        }
        .dropdown-toggle {
            color: #007bff; /* ??i m?u ch? c?a n?t m? dropdown */
            font-weight: bold; /* In ??m ch? */
        }
        .dropdown-toggle:hover {
            text-decoration: underline; /* G?ch ch?n khi di chu?t qua */
        }
    </style>
</nav>
<script>
    var dropdownMenu = document.getElementById('myDropdown');
    window.addEventListener('click', function (event) {
        if (!dropdownMenu.contains(event.target)) {
            dropdownMenu.classList.remove('show');
        }
    });
</script>
<!-- END nav -->