<%-- 
    Document   : bookingHistory
    Created on : Jun 7, 2024, 12:15:49 AM
    Author     : huypd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Lịch sử thuê xe</title>
        <link href="css/sidebarProfile.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style type="text/css">
            .widget-author {
                margin-bottom: 58px;
            }

            .author-card {
                position: relative;
                padding-bottom: 48px;
                background-color: #fff;
                box-shadow: 0 12px 20px 1px rgba(64, 64, 64, .09);
            }

            .author-card .author-card-cover {
                position: relative;
                width: 100%;
                height: 100px;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }

            .author-card .author-card-cover::after {
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                content: '';
                opacity: 0.5;
            }

            .author-card .author-card-cover>.btn {
                position: absolute;
                top: 12px;
                right: 12px;
                padding: 0 10px;
            }

            .author-card .author-card-profile {
                display: table;
                position: relative;
                margin-top: -22px;
                padding-right: 15px;
                padding-bottom: 16px;
                padding-left: 20px;
                z-index: 5;
            }

            .author-card .author-card-profile .author-card-avatar,
            .author-card .author-card-profile .author-card-details {
                display: table-cell;
                vertical-align: middle;
            }

            .author-card .author-card-profile .author-card-avatar {
                width: 85px;
                border-radius: 50%;
                box-shadow: 0 8px 20px 0 rgba(0, 0, 0, .15);
                overflow: hidden;
            }

            .author-card .author-card-profile .author-card-avatar>img {
                display: block;
                width: 100%;
            }

            .author-card .author-card-profile .author-card-details {
                padding-top: 20px;
                padding-left: 15px;
            }

            .author-card .author-card-profile .author-card-name {
                margin-bottom: 2px;
                font-size: 14px;
                font-weight: bold;
            }

            .author-card .author-card-profile .author-card-position {
                display: block;
                color: #8c8c8c;
                font-size: 12px;
                font-weight: 600;
            }

            .author-card .author-card-info {
                margin-bottom: 0;
                padding: 0 25px;
                font-size: 13px;
            }

            .author-card .author-card-social-bar-wrap {
                position: absolute;
                bottom: -18px;
                left: 0;
                width: 100%;
            }

            .author-card .author-card-social-bar-wrap .author-card-social-bar {
                display: table;
                margin: auto;
                background-color: #fff;
                box-shadow: 0 12px 20px 1px rgba(64, 64, 64, .11);
            }

            .btn-style-1.btn-white {
                background-color: #fff;
            }

            .list-group-item i {
                display: inline-block;
                margin-top: -1px;
                margin-right: 8px;
                font-size: 1.2em;
                vertical-align: middle;
            }

            .mr-1,
            .mx-1 {
                margin-right: .25rem !important;
            }

            .list-group-item.active:not(.disabled) {
                border-color: #e7e7e7;
                background: #fff;
                color: #ac32e4;
                cursor: default;
                pointer-events: none;
            }

            .list-group-flush:last-child .list-group-item:last-child {
                border-bottom: 0;
            }

            .list-group-flush .list-group-item {
                border-right: 0 !important;
                border-left: 0 !important;
            }

            .list-group-flush .list-group-item {
                border-right: 0;
                border-left: 0;
                border-radius: 0;
            }

            .list-group-item.active {
                z-index: 2;
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }

            .list-group-item:last-child {
                margin-bottom: 0;
                border-bottom-right-radius: .25rem;
                border-bottom-left-radius: .25rem;
            }

            a.list-group-item,
            .list-group-item-action {
                color: #404040;
                font-weight: 600;
            }

            .list-group-item {
                padding-top: 16px;
                padding-bottom: 16px;
                -webkit-transition: all .3s;
                transition: all .3s;
                border: 1px solid #e7e7e7 !important;
                border-radius: 0 !important;
                color: #404040;
                font-size: 12px;
                font-weight: 600;
                letter-spacing: .08em;
                text-transform: uppercase;
                text-decoration: none;
            }

            .list-group-item {
                position: relative;
                display: block;
                padding: .75rem 1.25rem;
                margin-bottom: -1px;
                background-color: #fff;
                border: 1px solid rgba(0, 0, 0, 0.125);
            }

            .list-group-item.active:not(.disabled)::before {
                background-color: #ac32e4;
            }

            .list-group-item::before {
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                width: 3px;
                height: 100%;
                background-color: transparent;
                content: '';
            }

            .input-with-button {
                position: relative;
                display: flex;
                align-items: center;
            }

            .input-with-button input {
                padding-right: 80px;
            }

            .input-with-button button {
                position: absolute;
                right: 10px;
                padding: 5px 10px;
                font-size: 12px;
                height: calc(100% - 10px);
                top: 5px;
            }
            .tabs-container {
                background-color: #f8f9fa; /* Màu nền của thanh chọn */
                border: 1px solid #ddd; /* Đường viền của thanh chọn */
            }

            .tab {
                padding: 10px 20px;
                cursor: pointer;
                background-color: #ffffff; /* Màu nền của từng tab */
                border-right: 1px solid #ddd; /* Đường viền giữa các tab */
                text-align: center;
                flex: 1; /* Đảm bảo các tab có kích thước đều nhau */
            }

            .tab:last-child {
                border-right: none; /* Loại bỏ đường viền phải của tab cuối cùng */
            }

            .tab:hover {
                background-color: #e9ecef; /* Màu nền khi hover */
            }

            .tab.active {
                background-color: #007bff; /* Màu nền của tab đang hoạt động */
                color: #ffffff; /* Màu chữ của tab đang hoạt động */
            }

            .booking-history h1 {
                margin-bottom: 1rem;
            }

            .filters {
                margin-bottom: 1rem;
            }

            .filters .filter-btn {
                padding: 0.5rem 1rem;
                margin-right: 0.5rem;
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                color: #fff;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }

            .filters .filter-btn:hover {
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%) !important;
            }

            .confirmed-filters {
                display: none;
                margin-bottom: 1rem;
            }

            .confirmed-filters label {
                margin-right: 0.5rem;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table thead th {
                background-color: #007BFF;
                color: #fff;
                padding: 0.75rem;
                text-align: left;
            }

            table tbody tr {
                background-color: #fff;
                border-bottom: 1px solid #ccc;
            }

            table tbody tr:nth-child(even) {
                background-color: #f4f4f9;
            }

            table tbody td {
                padding: 0.75rem;
            }

            .detail-btn {
                padding: 0.5rem 1rem;
                background-color: #28a745;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            .detail-btn:hover {
                background-color: #218838;
            }
            .col-table {
                background: #fff;
                color: #000;
            }
            .filter-btn.active {
                opacity: 0.7; /* hoặc bất kỳ thuộc tính CSS nào bạn muốn áp dụng */
                border: 5px solid #333; /* ví dụ cho border */
            }

        </style>
    </head>
    <jsp:include page="/includes/customer/navbar.jsp" />
    <body class="  font-body " data-framework="tailwind">
        <link href="https://www.loopple.com/css/vendor/tailwind.min.css" rel="stylesheet">
        <link href="https://www.loopple.com/css/tailwind/app.css?v=1.0.0" rel="stylesheet">
        <link href="" id="google-font-url" rel="stylesheet">
        <!-- CSS Links -->
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/sidebarProfile.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/css/nucleo-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/css/soft-ui-dashboard-tailwind.css">
        <div class="builder-container builder-container-preview  font-body ">
            <div class="container mt-5">
                <div class="row" style="justify-content: flex-end; margin-top: 9%;">
                    <aside class="max-w-62.5 ease-nav-brand z-990 absolute inset-y-0 my-4 ml-4 block w-full -translate-x-full flex-wrap items-center justify-between overflow-y-auto rounded-2xl border-0 p-0 antialiased shadow-none transition-transform duration-200 xl:left-0 xl:translate-x-0 xl:bg-transparent text-slate-500"
                           id="sidenav-main">
                        <hr class="h-px mt-0 bg-transparent bg-gradient-horizontal-dark">
                        <div style="margin-top: 6rem" class="items-center block w-auto max-h-screen overflow-auto grow basis-full">
                            <ul class="flex flex-col pl-0 mb-0">
                                <li class="w-full mt-4">
                                    <h6 class="pl-6 ml-2 font-bold leading-tight uppercase text-xs opacity-60">Quản lý thuê xe</h6>
                                </li>
                                <li class="mt-0.5 w-full"> 
                                    <a class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap rounded-lg px-4 text-slate-700 transition-colors"     
                                       href="transaction">
                                        <div class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center fill-current stroke-0 text-center xl:p-2.5">
                                            <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1"
                                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                            <title>credit-card</title>
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF"
                                               fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                            <g transform="translate(453.000000, 454.000000)">
                                            <path class="fill-slate-800 opacity-60"
                                                  d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z">
                                            </path>
                                            <path class="fill-slate-800"
                                                  d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z">
                                            </path>
                                            </g>
                                            </g>
                                            </g>
                                            </g>
                                            </svg>
                                        </div> <span style="color: #001973;"
                                                     class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Giao dịch gần đây</span>
                                    </a> </li>

                                <li class="mt-0.5 w-full">            
                                    <a style="background: #fff" class="py-2.7 shadow-soft-xl text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap rounded-lg px-4 font-semibold text-slate-700 transition-colors" href="javascript:;">
                                        <div style="background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);"
                                             class="bg-gradient-to-tl from-purple-700 shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                            <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1"
                                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                            <title>box-3d-50</title>
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <g transform="translate(-2319.000000, -291.000000)" fill="#FFFFFF"
                                               fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                            <g transform="translate(603.000000, 0.000000)">
                                            <path class="fill-slate-800"
                                                  d="M22.7597136,19.3090182 L38.8987031,11.2395234 C39.3926816,10.9925342 39.592906,10.3918611 39.3459167,9.89788265 C39.249157,9.70436312 39.0922432,9.5474453 38.8987261,9.45068056 L20.2741875,0.1378125 L20.2741875,0.1378125 C19.905375,-0.04725 19.469625,-0.04725 19.0995,0.1378125 L3.1011696,8.13815822 C2.60720568,8.38517662 2.40701679,8.98586148 2.6540352,9.4798254 C2.75080129,9.67332903 2.90771305,9.83023153 3.10122239,9.9269862 L21.8652864,19.3090182 C22.1468139,19.4497819 22.4781861,19.4497819 22.7597136,19.3090182 Z">
                                            </path>
                                            <path class="fill-slate-800 opacity-60"
                                                  d="M23.625,22.429159 L23.625,39.8805372 C23.625,40.4328219 24.0727153,40.8805372 24.625,40.8805372 C24.7802551,40.8805372 24.9333778,40.8443874 25.0722402,40.7749511 L41.2741875,32.673375 L41.2741875,32.673375 C41.719125,32.4515625 42,31.9974375 42,31.5 L42,14.241659 C42,13.6893742 41.5522847,13.241659 41,13.241659 C40.8447549,13.241659 40.6916418,13.2778041 40.5527864,13.3472318 L24.1777864,21.5347318 C23.8390024,21.7041238 23.625,22.0503869 23.625,22.429159 Z">
                                            </path>
                                            <path class="fill-slate-800 opacity-60"
                                                  d="M20.4472136,21.5347318 L1.4472136,12.0347318 C0.953235098,11.7877425 0.352562058,11.9879669 0.105572809,12.4819454 C0.0361450918,12.6208008 6.47121774e-16,12.7739139 0,12.929159 L0,30.1875 L0,30.1875 C0,30.6849375 0.280875,31.1390625 0.7258125,31.3621875 L19.5528096,40.7750766 C20.0467945,41.0220531 20.6474623,40.8218132 20.8944388,40.3278283 C20.963859,40.1889789 21,40.0358742 21,39.8806379 L21,22.429159 C21,22.0503869 20.7859976,21.7041238 20.4472136,21.5347318 Z">
                                            </path>
                                            </g>
                                            </g>
                                            </g>
                                            </g>
                                            </svg>
                                        </div> <span style="color: #001973;" class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Lịch sử thuê xe</span>
                                    </a> </li>

                                <li class="w-full mt-4">
                                    <h6 class="pl-6 ml-2 font-bold leading-tight uppercase text-xs opacity-60">Quản lý tài khoản</h6>
                                </li>
                                <li class="mt-0.5 w-full"> 
                                    <a class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap rounded-lg px-4 text-slate-700 transition-colors" href="profileCustomer.jsp">
                                        <div class="bg-gradient-to-tl shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                            <svg width="12px" height="12px" viewBox="0 0 46 42" version="1.1"
                                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                            <title>customer-support</title>
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <g transform="translate(-1717.000000, -291.000000)" fill="#FFFFFF"
                                               fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                            <g transform="translate(1.000000, 0.000000)">
                                            <path class="fill-slate-800 opacity-60"
                                                  d="M45,0 L26,0 C25.447,0 25,0.447 25,1 L25,20 C25,20.379 25.214,20.725 25.553,20.895 C25.694,20.965 25.848,21 26,21 C26.212,21 26.424,20.933 26.6,20.8 L34.333,15 L45,15 C45.553,15 46,14.553 46,14 L46,1 C46,0.447 45.553,0 45,0 Z">
                                            </path>
                                            <path class="fill-slate-800"
                                                  d="M22.883,32.86 C20.761,32.012 17.324,31 13,31 C8.676,31 5.239,32.012 3.116,32.86 C1.224,33.619 0,35.438 0,37.494 L0,41 C0,41.553 0.447,42 1,42 L25,42 C25.553,42 26,41.553 26,41 L26,37.494 C26,35.438 24.776,33.619 22.883,32.86 Z">
                                            </path>
                                            <path class="fill-slate-800"
                                                  d="M13,28 C17.432,28 21,22.529 21,18 C21,13.589 17.411,10 13,10 C8.589,10 5,13.589 5,18 C5,22.529 8.568,28 13,28 Z">
                                            </path>
                                            </g>
                                            </g>
                                            </g>
                                            </g>
                                            </svg>
                                        </div> <span
                                            style="color: #001973;" class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Thông tin cá nhân</span>
                                    </a> </li>
                                <li class="mt-0.5 w-full"> 
                                    <a class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                                       href="settingsProfile.jsp">
                                        <div
                                            class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                            <svg width="12px" height="20px" viewBox="0 0 40 40" version="1.1"
                                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                            <title>spaceship</title>
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <g transform="translate(-1720.000000, -592.000000)" fill="#FFFFFF"
                                               fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                            <g transform="translate(4.000000, 301.000000)">
                                            <path class="fill-slate-800"
                                                  d="M39.3,0.706666667 C38.9660984,0.370464027 38.5048767,0.192278529 38.0316667,0.216666667 C14.6516667,1.43666667 6.015,22.2633333 5.93166667,22.4733333 C5.68236407,23.0926189 5.82664679,23.8009159 6.29833333,24.2733333 L15.7266667,33.7016667 C16.2013871,34.1756798 16.9140329,34.3188658 17.535,34.065 C17.7433333,33.98 38.4583333,25.2466667 39.7816667,1.97666667 C39.8087196,1.50414529 39.6335979,1.04240574 39.3,0.706666667 Z M25.69,19.0233333 C24.7367525,19.9768687 23.3029475,20.2622391 22.0572426,19.7463614 C20.8115377,19.2304837 19.9992882,18.0149658 19.9992882,16.6666667 C19.9992882,15.3183676 20.8115377,14.1028496 22.0572426,13.5869719 C23.3029475,13.0710943 24.7367525,13.3564646 25.69,14.31 C26.9912731,15.6116662 26.9912731,17.7216672 25.69,19.0233333 L25.69,19.0233333 Z">
                                            </path>
                                            <path class="fill-slate-800 opacity-60"
                                                  d="M1.855,31.4066667 C3.05106558,30.2024182 4.79973884,29.7296005 6.43969145,30.1670277 C8.07964407,30.6044549 9.36054508,31.8853559 9.7979723,33.5253085 C10.2353995,35.1652612 9.76258177,36.9139344 8.55833333,38.11 C6.70666667,39.9616667 0,40 0,40 C0,40 0,33.2566667 1.855,31.4066667 Z">
                                            </path>
                                            <path class="fill-slate-800 opacity-60"
                                                  d="M17.2616667,3.90166667 C12.4943643,3.07192755 7.62174065,4.61673894 4.20333333,8.04166667 C3.31200265,8.94126033 2.53706177,9.94913142 1.89666667,11.0416667 C1.5109569,11.6966059 1.61721591,12.5295394 2.155,13.0666667 L5.47,16.3833333 C8.55036617,11.4946947 12.5559074,7.25476565 17.2616667,3.90166667 L17.2616667,3.90166667 Z">
                                            </path>
                                            <path class="fill-slate-800 opacity-60"
                                                  d="M36.0983333,22.7383333 C36.9280725,27.5056357 35.3832611,32.3782594 31.9583333,35.7966667 C31.0587397,36.6879974 30.0508686,37.4629382 28.9583333,38.1033333 C28.3033941,38.4890431 27.4704606,38.3827841 26.9333333,37.845 L23.6166667,34.53 C28.5053053,31.4496338 32.7452344,27.4440926 36.0983333,22.7383333 L36.0983333,22.7383333 Z">
                                            </path>
                                            </g>
                                            </g>
                                            </g>
                                            </g>
                                            </svg>
                                        </div> <span style="color: #001973;" class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Mật khẩu và bảo mật</span>
                                    </a> 
                                </li>
                            </ul>
                        </div>
                    </aside>
                    <div style="width: 83.666667%;" class="col-lg-8 pb-5">
                        <div class="filters flex gap-2"> 
                            <button class="filter-btn" data-filter="all" onclick="applyFilter('all')">Tất cả</button>
                            <button class="filter-btn" data-filter="pending" onclick="applyFilter('pending')">Chờ xác nhận</button>
                            <button class="filter-btn" data-filter="confirmed" onclick="applyFilter('confirmed')">Đã xác nhận</button>
                            <button class="filter-btn" data-filter="cancelled" onclick="applyFilter('cancelled')">Đã hủy</button>
                        </div>
                        <div class="confirmed-filters" id="confirmed-filters">
                            <label for="confirmed-status">Đã xác nhận:</label>
                            <select id="confirmed-status" class="ml-2">
                                <option value="all" <c:if test="${empty deliveryStatus || 'all' eq deliveryStatus}">selected</c:if>>Tất cả trạng thái</option>
                                <option value="notDelivered" <c:if test="${'notDelivered' eq deliveryStatus}">selected</c:if>>Chưa giao</option>
                                <option value="delivered" <c:if test="${'delivered' eq deliveryStatus}">selected</c:if>>Đã giao</option>
                                <option value="returned" <c:if test="${'returned' eq deliveryStatus}">selected</c:if>>Đã trả</option>
                                </select>
                            </div>
                            <div class="flex flex-wrap -mx-3 drop-zone">
                                <div style="position: relative;" class="table-responsive">
                                    <table class="caption-top min-w-full table-auto table-hover table-borderless table-striped" id="booking-table">
                                        <caption class="caption-top">Lịch sử thuê xe</caption>
                                        <thead style="border: 1px solid">
                                            <tr>
                                                <th scope="col" class="col-table px-8 py-2">Mã đơn</th>
                                                <th scope="col" class="col-table px-6 py-2">Ngày bắt đầu</th>
                                                <th scope="col" class="col-table px-10 py-2">Ngày trả xe</th>
                                                <th scope="col" class="col-table px-6 py-2">Số lượng xe</th>
                                                <th scope="col" class="col-table px-8 py-2">Trạng thái</th>
                                                <th scope="col" class="col-table px-10 py-2">Giá</th>
                                                <th scope="col" class="col-table px-6 py-2"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${empty listB}">
                                            <tr>
                                                <td colspan="7" class="text-center italic py-4 text-lg">Không có thông tin Booking nào ở đây</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach items="${listB}" var="o">
                                            <tr class="${status}">
                                                <td class="px-8 py-2">${o.bookingID}</td>
                                                <td class="px-6 py-2">
                                                    <c:set var="startDate" value="${o.startDate}" />
                                                    <c:set var="startYear" value="${fn:substring(startDate, 0, 4)}" />
                                                    <c:set var="startMonth" value="${fn:substring(startDate, 5, 7)}" />
                                                    <c:set var="startDay" value="${fn:substring(startDate, 8, 10)}" />
                                                    ${startDay}-${startMonth}-${startYear}
                                                </td>

                                                <td class="px-10 py-2">
                                                    <c:set var="endDate" value="${o.endDate}" />
                                                    <c:set var="endYear" value="${fn:substring(endDate, 0, 4)}" />
                                                    <c:set var="endMonth" value="${fn:substring(endDate, 5, 7)}" />
                                                    <c:set var="endDay" value="${fn:substring(endDate, 8, 10)}" />
                                                    ${endDay}-${endMonth}-${endYear}
                                                </td>
                                                <td class="px-6 py-2">${fn:length(o.listBookingDetails)}</td>
                                                <td class="px-8 py-2">${o.statusBooking}</td>
                                                <td class="px-10 py-2">
                                                    <c:set var="total" value="0"/>
                                                    <c:forEach items="${o.listBookingDetails}" var="detail">
                                                        <c:set var="total" value="${total + detail.totalPrice}"/>
                                                    </c:forEach>
                                                    <fmt:formatNumber value="${total*1000}" type="currency" currencySymbol="VNĐ" />
                                                </td>
                                                <td class="px-6 py-2 text-center">
                                                    <a href="bookingHistoryDetail?bookingId=${o.bookingID}" class="btn btn-info" title="View" data-toggle="tooltip" onclick="showBookingDetail(this)" data-original-title="View">
                                                        <i class="fa fa-eye"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr class="text-right">
                                                <td colspan="7" class="px-4 py-2">
                                                    <input type="hidden" name="bookingId" value="${o.bookingID}" />
                                                    <c:set var="feedback" value="${feedbackMap[o.bookingID]}"/>
                                                    <c:choose>
                                                        <c:when test="${not empty feedback}">
                                                            <c:if test="${(status == 'all' && o.statusBooking == 'Đã xác nhận' && o.deliveryStatus == 'Đã trả') || ((status == 'confirmed') && (o.deliveryStatus == 'Đã trả'))}">
                                                                <a style="color: green" id="view-review-button" class="text-decoration-none italic" href="feedback?bookingId=${o.bookingID}">Xem đánh giá</a>
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${(status == 'all' && o.statusBooking == 'Đã xác nhận' && o.deliveryStatus == 'Đã trả') || ((status == 'confirmed') && (o.deliveryStatus == 'Đã trả'))}">
                                                                <a style="color: red" id="write-review-button" class="text-decoration-none italic" href="feedback?bookingId=${o.bookingID}">Viết đánh giá</a>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/chartjs.min.js"></script>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/perfect-scrollbar.min.js"
        async=""></script>
        <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
        <script
            src="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/js/soft-ui-dashboard-tailwind.js"
        async=""></script>
        <script>
                                                        document.addEventListener("DOMContentLoaded", () => {
                                                            initializeFilters();
                                                        });

                                                        // Initialize filters and add event listeners
                                                        function initializeFilters()
                                                        {
                                                            const confirmedFilters = document.getElementById("confirmed-filters");
                                                            const confirmedStatusSelect = document.getElementById("confirmed-status");

                                                            // Add event listeners to filter buttons
                                                            document.querySelectorAll(".filter-btn").forEach(button => {
                                                                button.addEventListener("click", () => {
                                                                    const filter = button.getAttribute("data-filter");
                                                                    applyFilter(filter);
                                                                    confirmedFilters.style.display = "none";
                                                                    window.location.href = "bookingHistory?status=" + filter;


                                                                });
                                                            });
                                                            checkURL();
 

                                                            // Add event listener to confirmed status select
                                                            confirmedStatusSelect.addEventListener("change", () => {
                                                                const filter = confirmedStatusSelect.value;
                                                                applyConfirmedFilter(filter);
                                                                window.location.href = "bookingHistory?status=confirmed&deliveryStatus=" + filter;
                                                            });
                                                        }

                                                        function checkURL() {
                                                            const currentURL = window.location.href;
                                                            if (currentURL.includes('bookingHistory?status=confirmed')) {
                                                                document.getElementById("confirmed-filters").style.display = 'block';
                                                            }
                                                        }

                                                        // Apply filter for confirmed status
                                                        function applyConfirmedFilter(filter) {
                                                            document.querySelectorAll("#booking-table tbody tr.confirmed").forEach(row => {
                                                                if (filter === "all" || row.classList.contains(filter)) {
                                                                    row.style.display = "";
                                                                } else {
                                                                    row.style.display = "none";
                                                                }
                                                            });
                                                        }
                                                        // Apply filter based on the status (all, pending, confirmed, cancelled)
                                                        function applyFilter(filter) {
                                                            document.querySelectorAll("#booking-table tbody tr").forEach(row => {
                                                                if (filter === "all" || row.classList.contains(filter)) {
                                                                    row.style.display = "";
                                                                } else {
                                                                    row.style.display = "none";
                                                                }
                                                            });

                                                        }
        </script>
    </body>
</html>