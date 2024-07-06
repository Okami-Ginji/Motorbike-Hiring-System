<%-- 
    Document   : profileCus
    Created on : 30 thg 5, 2024, 21:04:50
    Author     : MINH TUAN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Thông tin cá nhân</title>
        <!-- Tailwind CSS -->
        <link href="https://www.loopple.com/css/vendor/tailwind.min.css" rel="stylesheet">
        <link href="https://www.loopple.com/css/tailwind/app.css?v=1.0.0" rel="stylesheet">
        <link href="" id="google-font-url" rel="stylesheet">
        <!-- CSS Links -->
        <link href="css/sidebarProfile.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/css/nucleo-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/css/soft-ui-dashboard-tailwind.css">
        
<!--         <style>
         #cropImageModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        #cropImageModal .modal-content {
            width: 500px;
            height: 500px;
            background: white;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #crop-image {
            max-width: 100%;
            max-height: 100%;
        }
    </style>-->
    </head>
    <style>
        .red {
            color: red;
        }

        .orange {
            color: orange;
        }

        .green {
            color: green;
        }
        .text-error {
            font-style: italic;
        }
    </style>
    <jsp:include page="/includes/customer/navbar.jsp" />
    <body class="  font-body " data-framework="tailwind">
        <div class="builder-container builder-container-preview  font-body ">
            <aside class="max-w-62.5 ease-nav-brand z-990 absolute inset-y-0 my-4 ml-4 block w-full -translate-x-full flex-wrap items-center justify-between overflow-y-auto rounded-2xl border-0 p-0 antialiased shadow-none transition-transform duration-200 xl:left-0 xl:translate-x-0 xl:bg-transparent text-slate-500"
                   id="sidenav-main">
                <hr class="h-px mt-0 bg-transparent bg-gradient-horizontal-dark">

                <div style="margin-top: 6rem" class="items-center block w-auto max-h-screen overflow-auto grow basis-full">
                    <ul class="flex flex-col pl-0 mb-0">
                        <li class="w-full mt-4">
                            <h6 class="pl-6 ml-2 font-bold leading-tight uppercase text-xs opacity-60">Quản lý thuê xe</h6>
                        </li>
                        <li class="mt-0.5 w-full"> 
                            <a class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
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
                                </div> <span
                                    class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Giao dịch gần đây</span>
                            </a> </li>
                        <li class="mt-0.5 w-full"> <a
                                class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                                href="bookingHistory?status=all">
                                <div
                                    class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
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
                                </div> <span class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Lịch sử thuê xe</span>
                            </a> </li>
                        <li class="w-full mt-4">
                            <h6 class="pl-6 ml-2 font-bold leading-tight uppercase text-xs opacity-60">Quản lý tài khoản</h6>
                        </li>
                        <li class="mt-0.5 w-full"> 
                            <a  style="background: #fff;" class="py-2.7 shadow-soft-xl text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap rounded-lg px-4 font-semibold text-slate-700 transition-colors" href="javascript:;">
                                <div  style="background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);"
                                      class="bg-gradient-to-tl from-purple-700 shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
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
                                    class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Thông tin cá nhân</span>
                            </a> </li>
                        <li class="mt-0.5 w-full"> 
                            <a class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                               href="manageProfile.jsp">
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
                                </div> <span class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Mật khẩu và bảo mật</span>
                            </a> 
                        </li>
                    </ul>
                </div>
            </aside>
            <div class="ease-soft-in-out xl:ml-68.5 relative h-full max-h-screen rounded-xl transition-all duration-200"
                 id="panel">
                <div class="w-full px-6 py-6 mx-auto drop-zone loopple-min-height-78vh text-slate-500">
                    <div style="padding-top: 8%; width: 96%;" class="pt-8 mx-auto removable">
                        <div class="flex flex-wrap -mx-3 drop-zone">
                            <div class="w-full max-w-full px-3 mb-4 draggable" draggable="true">
                                <div class="relative flex flex-col h-full min-w-0 break-words bg-white border-0 shadow-soft-xl rounded-2xl bg-clip-border">
                                    <div class="p-4 pb-0 mb-0 bg-white border-b-0 rounded-t-2xl">
                                        <div class="flex flex-wrap -mx-3">
                                            <div class="flex items-center w-full max-w-full px-3 shrink-0 md:w-8/12 md:flex-none">
                                                <h4 style="background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                                                    background-clip: text;
                                                    color: transparent !important;" class="mb-0"><strong>Thông tin cá nhân &nbsp</strong>
                                                    <c:if test="${not empty requestScope.mess}">
                                                        <h6 style="color: green;font-style: italic; margin-bottom: 0">(${mess})</h6>
                                                    </c:if>
                                                    <c:if test="${not empty requestScope.errorProfile}">
                                                        <h6 id="invalid" style="color: red; font-style: italic; margin-bottom: 0">(${requestScope.errorProfile})</h6>
                                                    </c:if>
                                                </h4>
                                            </div>
                                            <div class="w-full max-w-full px-3 text-right shrink-0 md:w-4/12 md:flex-none">
                                                <a href="javascript:;" id="editProfileBtn" data-target="tooltip_trigger" data-placement="top">
                                                    <i class="leading-normal fas fa-user-edit text-sm text-slate-400" aria-hidden="true"></i>
                                                </a>
                                                <div data-target="tooltip" class="px-2 py-1 text-center text-white bg-black rounded-lg text-sm hidden" role="tooltip">
                                                    Edit Profile
                                                    <div class="invisible absolute h-2 w-2 bg-inherit before:visible before:absolute before:h-2 before:w-2 before:rotate-45 before:bg-inherit before:content-['']" data-popper-arrow="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="flex-auto pl-8">
                                        <hr class="bg-transparent bg-gradient-to-r from-transparent via-black/40 to-transparent">
                                        <div style="justify-content: space-between" class="flex">
                                            <ul class="flex flex-col pl-0 mb-0 rounded-lg">
                                                <li class="relative block px-4 py-3 pt-0 pl-0 leading-normal bg-white border-0 rounded-t-lg text-sm text-inherit">
                                                    <strong class="text-slate-700">Họ và tên:</strong> &nbsp; ${account.firstName} ${account.lastName} &nbsp (${account.userName})
                                                </li>
                                                <li class="relative block px-4 py-3 pl-0 leading-normal bg-white border-0 border-t-0 text-sm text-inherit">
                                                    <strong class="text-slate-700">Giới tính: </strong> &nbsp; ${account.gender}
                                                </li>
                                                <li class="relative block px-4 py-3 pl-0 leading-normal bg-white border-0 border-t-0 text-sm text-inherit">
                                                    <strong class="text-slate-700">Số điện thoại:</strong> &nbsp; ${account.phoneNumber}
                                                </li>
                                                <li class="relative block px-4 py-3 pl-0 leading-normal bg-white border-0 border-t-0 text-sm text-inherit">
                                                    <strong class="text-slate-700">Email:</strong> &nbsp; ${account.email}
                                                </li>
                                                <li class="relative block px-4 py-3 pl-0 leading-normal bg-white border-0 border-t-0 text-sm text-inherit">
                                                    <strong class="text-slate-700">Ngày sinh: </strong> &nbsp; ${account.dob}
                                                </li>
                                                <li class="relative block px-4 py-3 pl-0 leading-normal bg-white border-0 border-t-0 text-sm text-inherit">
                                                    <strong class="text-slate-700">Địa chỉ: </strong> &nbsp; ${account.address}
                                                </li>
                                            </ul>

                                            <div style="margin-right: 12%;" class="flex pr-3 items-center w-1/4 h-auto">
                                                <img style="width: 100%" id="profile-image" class="h-auto rounded-lg shadow-soft-xl cursor-pointer" src="images/${account.image}?${now.time}" alt="Profile Image">
                                                <input type="file" id="image-upload" class="hidden" accept="image/png, image/jpeg">
                                            </div>

                                        </div>
                                        <hr class="bg-transparent bg-gradient-to-r from-transparent via-black/40 to-transparent">

                                    </div>
                                    <!-- Modal -->
                                    <div id="editProfileModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden z-30">
                                        <div style="width: 56%; margin-top: 5rem" class="bg-white p-8 rounded-lg shadow-lg">
                                            <h2 class="text-2xl mb-4">Chỉnh sửa thông tin</h2>
                                            <form action="updateprofile" method="post" id="form-update" class="space-y-4">
                                                <input hidden id="accountID" name="accountID" value="${account.accountId}">
                                                <input hidden name="roleID" value="${account.roleID}">

                                                <div class="flex flex-wrap mb-3">
                                                    <div class="w-full md:w-1/2 pr-2 mb-3 md:mb-0">
                                                        <label for="account-firstname">Họ</label>
                                                        <input value="${account.firstName}" type="text" id="account-firstname" name="firstname" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                                                    </div>
                                                    <div class="w-full md:w-1/2 pl-2">
                                                        <label for="account-lastname">Tên</label>
                                                        <input value="${account.lastName}" type="text" id="account-lastname" name="lastname" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                                                    </div>
                                                </div>
                                                <div class="flex flex-wrap mb-3">
                                                    <div class="w-full md:w-1/2 pr-2 mb-3 md:mb-0">
                                                        <label for="account-email">Email <span class="text-red-500">*</span></label>
                                                        <input require value="${account.email}" type="email" id="account-email" name="email" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                                                        <span class="text-error" id="email-text"></span>

                                                    </div>
                                                    <div class="w-full md:w-1/2 pl-2">
                                                        <label for="account-address">Địa chỉ</label>
                                                        <input value="${account.address}" type="text" id="account-address" name="address" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                                                    </div>
                                                </div>

                                                <div class="flex flex-wrap mb-3">
                                                    <div class="w-full md:w-1/2 pr-2 mb-3 md:mb-0">
                                                        <label for="account-gender">Giới tính</label>
                                                        <select style="border: 1px solid #000;" class="form-control w-full mt-1 p-2 border border-gray-300 rounded-md" name="gender" id="account-gender">
                                                            <option value='Nam' ${account.gender == "Nam" ? 'selected' : ''}>Nam</option>
                                                            <option value='Nữ' ${account.gender == "Nữ" ? 'selected' : ''}>Nữ</option>
                                                            <option value='Không muốn tiết lộ' ${account.gender == "Không muốn tiết lộ" ? 'selected' : ''}>Không muốn tiết lộ</option>
                                                        </select>
                                                    </div>
                                                    <div class="w-full md:w-1/2 pl-2">
                                                        <label for="account-phone">Số điện thoại</label>
                                                        <input require value="${account.phoneNumber}" type="text" id="account-phone" name="phonenumber" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                                                        <span class="text-error" id="phone-text"></span>

                                                    </div>
                                                </div>
                                                <div class="flex flex-wrap mb-3">
                                                    <div class="w-full md:w-1/2 pr-2 mb-3 md:mb-0">
                                                        <label for="account-dob">Ngày sinh</label>
                                                        <input value="${account.dob}" type="date" id="account-dob" name="dob" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                                                    </div>
                                                    <div class="w-full md:w-1/2 pl-2">
                                                        <label for="account-username">Tên đăng nhập <span class="text-red-500">*</span></label>
                                                        <input style="background-color: #e9e9e9;" readonly value="${account.userName}" type="text" id="account-username" name="username" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">

                                                    </div>
                                                </div>
                                                <div class="flex justify-end">
                                                    <button type="button" id="closeModalBtn" class="mr-4 px-4 py-2 bg-gray-300 rounded-md">Quay về</button>
                                                    <button type="submit" class="px-4 py-2 bg-blue-600 rounded-md">Lưu thay đổi</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!--End Modal-->

                                    <!-- Modal Chỉnh Sửa Ảnh -->
                                    <div id="cropImageModal" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-75 hidden z-40">
                                        <div class="bg-white p-4 rounded-lg shadow-lg w-1/3">
                                            <form action="${pageContext.request.contextPath}/uploadimage" method="post" enctype="multipart/form-data" id="form-upload">
                                                <div>
                                                    <img id="crop-image" src="" alt="Image to crop">
                                                    <input type="file" name="file" id="image-upload" hidden>
<!--                                                    <input type="text" name="name" size="100">-->
                                                </div>
                                                <div class="flex justify-end mt-4">
                                                    <button type="button" id="crop-save" class="bg-blue-500 px-4 py-2 rounded-lg">Save</button>
                                                    <button type="button" id="crop-cancel" class="ml-2 bg-red-500 px-4 py-2 rounded-lg">Cancel</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- End Modal Chỉnh Sửa Ảnh -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- Footer -->
            </div>
        </div>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/chartjs.min.js"></script>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/perfect-scrollbar.min.js"
        async=""></script>
        <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
        <script
            src="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/js/soft-ui-dashboard-tailwind.js"
        async=""></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const editProfileBtn = document.getElementById('editProfileBtn');
            const editProfileModal = document.getElementById('editProfileModal');
            const closeModalBtn = document.getElementById('closeModalBtn');
            const toast = document.getElementById('toast');

            editProfileBtn.addEventListener('click', () => {
                editProfileModal.classList.remove('hidden');
            });

            closeModalBtn.addEventListener('click', () => {
                editProfileModal.classList.add('hidden');
            });

            window.addEventListener('click', (event) => {
                if (event.target == editProfileModal) {
                    editProfileModal.classList.add('hidden');
                }
            });

        });

        const emailInput = document.getElementById("account-email");
        const emailText = document.getElementById("email-text");
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        const phoneInput = document.getElementById("account-phone");
        const phoneText = document.getElementById("phone-text");
        const phoneRegex = /^0\d{9}$/;

        //check email, ussername
        const validEmail = () => {
            if (emailInput.value.trim() !== "") {
                if (emailRegex.test(emailInput.value)) {
                    emailText.textContent = "";
                    emailText.className = "";
                } else {
                    emailText.textContent = "Email chưa đúng format.";
                    emailText.className = "text-error red";
                }
            } else {
                if (emailInput.value.trim() === "") {
                    emailText.textContent = "Không được để trống email.";
                    emailText.className = "text-error red";
                } else {
                    emailText.textContent = "";
                    emailText.className = "";
                }
            }
        };

        //check sdt
        const validPhone = () => {
            if (phoneRegex.test(phoneInput.value)) {
                phoneText.textContent = "";
                phoneText.className = "";
            } else {
                phoneText.textContent = "Số điện thoại phải có 10 số, và bắt đầu bằng số 0.";
                phoneText.className = "text-error red";
            }
        };
        emailInput.addEventListener("input", validEmail);
        phoneInput.addEventListener("input", validPhone);
    </script>
    <!-- Include Cropper.js library -->
    <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/chartjs.min.js"></script>
    <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/perfect-scrollbar.min.js" async=""></script>
    <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/js/soft-ui-dashboard-tailwind.js" async=""></script>
    <script src="https://unpkg.com/cropperjs"></script>
    <link href="https://unpkg.com/cropperjs/dist/cropper.min.css" rel="stylesheet">
    <style>
        #cropImageModal {
            z-index: 40;
        }

        #editProfileModal {
            z-index: 30;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById('profile-image').addEventListener('click', function () {
                document.getElementById('image-upload').click();
            });

            document.getElementById('image-upload').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const modal = document.getElementById('cropImageModal');
                        const cropImage = document.getElementById('crop-image');
                        cropImage.src = e.target.result;
                        modal.classList.remove('hidden');

                        const cropper = new Cropper(cropImage, {
                            aspectRatio: 1,
                            viewMode: 1,
                        });

                        document.getElementById('crop-save').addEventListener('click', function () {
                            const id = document.getElementById("accountID").value;                       
                            cropper.getCroppedCanvas().toBlob((blob) => {
                                console.log(blob);
                                const formData = new FormData();
                                formData.append('file', blob, 'profile.png');
                                formData.append('id',id);
                                uploadImage(formData);
                                modal.classList.add('hidden');
                            });
                        });

                        document.getElementById('crop-cancel').addEventListener('click', function () {
                            modal.classList.add('hidden');
                        });
                    };
                    reader.readAsDataURL(file);
                }
            });

           
        });
         function uploadImage(formData) {
             console.log(formData);
                // Gửi dữ liệu tới servlet bằng AJAX
                $.ajax({
                    type: "POST",
                    url: "uploadimage", // Thay đổi URL tới servlet của bạn
    //                data: JSON.stringify(data),              
    //                contentType: "application/json",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        alert("Cập nhật ảnh thành công");
                        console.log("Data sent successfully:", response);
                    },
                    error: function(xhr, status, error) {
                        console.error("Error sending data:", error);
                    }
                });
//                fetch('uploadimage', {
//                    method: 'POST',
//                    body: formData
//                })
//                        .then(response => response.json())
//                        .then(data => {
//                            if (data.success) {
//                                document.getElementById('profile-image').src = data.filePath;
//                            }
//                        })
//                        .catch(error => console.error('Error:', error));
            }
    </script>
   
</html>