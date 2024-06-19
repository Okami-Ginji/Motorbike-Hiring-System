<%-- 
    Document   : event
    Created on : May 25, 2024, 9:43:36 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ColorBike Tourism Location</title>
        <link rel="website icon" type="png" href="images\logo.png">
        <style>
            /* breadcrumb */

            /* Style the list */
            ul.breadcrumb {
                padding: 10px 16px;
                list-style: none;
                background-color: #eee;
            }

            /* Display list items side by side */
            ul.breadcrumb li {
                display: inline;
                font-size: 18px;
            }

            /* Add a slash symbol (/) before/behind each list item */
            ul.breadcrumb li+li:before {
                padding: 8px;
                color: black;
                content: "/\00a0";
            }

            /* Add a color to all links inside the list */
            ul.breadcrumb li a {
                color: #0275d8;
                text-decoration: none;
            }

            /* Add a color on mouse-over */
            ul.breadcrumb li a:hover {
                color: #01447e;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <!-- breadcrumb -->
        <div>
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Events</a></li>
            </ul>
        </div>
        <!-- end breadcrumbs -->
        <section
            class="feature-grid2-5331c43e-593a-4933-bcf2-96beb7ea5e25 sw-background-color-f4f2f1 sw-padding-top-l sw-padding-bottom-2xl sw-border-top-style-none sw-border-top-width-xs sw-border-top-color-000000 sw-border-bottom-style-none sw-border-bottom-width-xs sw-border-bottom-color-000000 sw-background-repeat-no-repeat sw-background-size-cover sw-background-position-center sw-background-attachment-scroll MuiBox-root css-0"
            data-block-version="3.1.0"
            data-block-id="5331c43e-593a-4933-bcf2-96beb7ea5e25"
            data-block-updated
            style="position: relative;">
            <div class="container MuiBox-root css-0">

                <div class="event-container">
                    <h2>ColorBike Events</h2>
                    <p>Plan Your Perfect Event with Our User-Friendly App</p>
                </div>
                <div
                    class="MuiGrid-root MuiGrid-container MuiGrid-spacing-xs-2 features-container css-1ajnodb row">
                    <c:forEach var="touristLocations" items="${touristLocation}">
                        <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-md-4 css-1ay72je event">
                            <div class="MuiGrid-root MuiGrid-container MuiGrid-direction-xs-column css-1o5yux1 image-container">
                                <img style="width: 90%;" class="sw-width-xs sw-height-xs sw-margin-bottom-2xs MuiBox-root css-0" src="images/${touristLocations.locationImage}" alt="Shedule">
                                <h3 class="colorWord sw-font-size-xl sw-text-color-default sw-font-family-arvo sw-font-weight-medium sw-letter-spacing-normal sw-margin-top-6xs sw-margin-bottom-6xs">
                                    ${touristLocations.locationName}
                                </h3>
                                <p class="sw-font-size-m sw-text-color-default sw-font-family-default sw-font-weight-default sw-line-height-normal sw-letter-spacing-normal">
                                    ${touristLocations.description}
                                </p>
                                <a href="${touristLocations.urlArticle}" target="_blank" class="sw-font-size-m sw-text-color-f2501b sw-font-family-default sw-font-weight-normal sw-margin-top-6xs sw-margin-bottom-none sw-letter-spacing-normal sw-text-decoration-no-underline hover:sw-text-decoration-no-underline sw-display-inline-block event-link no-border">

                                    <span>Go to article</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 256 256">
                                    <rect width="256" height="256" fill="none"></rect>
                                    <line x1="40" y1="128" x2="216" y2="128" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></line>
                                    <polyline points="144 56 216 128 144 200" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></polyline>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

    </body>

    <style>
        /* CSS for full-page fade-in effect */
        body {
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

        .event-container {
            max-width: 100%;
            margin: auto;
            margin-bottom: 15px;
            padding: 20px;
            background: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .event-container h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .event-container p {
            font-size: 1.25rem;
            color: #666;
        }

        .event {
            padding: 15px;
            text-align: justify;
            position: relative;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 30%;
            margin: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center; /* Căn giữa các phần tử trong .event */
        }


        .image-container {
            width: 100%;
            text-align: center; /* Căn chỉnh hình ảnh trong container */
        }

        .image-container img {
            max-width: 100%; /* Đảm bảo hình ảnh không vượt quá kích thước container */
            border-radius: 8px;
        }

        .event:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .event p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 15px;
            height: 1.0em; /* Giới hạn chiều cao ban đầu */
            overflow: hidden; /* Ẩn phần nội dung tràn */
            text-overflow: ellipsis; /* Thêm dấu chấm lửng */
            white-space: nowrap; /* Ngăn không cho ngắt dòng */
            transition: height 0.5s ease-in-out, opacity 0.5s ease-in-out; /* Thêm hiệu ứng chuyển đổi */
            cursor: pointer; /* Thêm con trỏ chỉ tay */
            position: relative; /* Giữ vị trí tương đối */
            opacity: 1; /* Mặc định hiện đầy đủ */
        }

        .event p:hover {
            height: auto; /* Thay đổi chiều cao để hiển thị toàn bộ nội dung */
            max-height: none; /* Loại bỏ giới hạn chiều cao */
            white-space: normal; /* Cho phép nội dung ngắt dòng */
            overflow: visible; /* Hiển thị phần nội dung bị ẩn */
            opacity: 1; /* Đảm bảo đoạn văn bản luôn trong suốt 100% khi hover */
            background-color: rgba(255, 255, 255, 0.9); /* Tùy chọn: Thêm nền để dễ đọc hơn */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Tùy chọn: Thêm đổ bóng để nổi bật */
            position: relative; /* Giữ vị trí tương đối để đảm bảo hiệu ứng đúng */
            z-index: 1; /* Đảm bảo rằng đoạn văn được hiển thị trên các phần tử khác */
            transition: height 0.5s ease-in-out, opacity 0.5s ease-in-out; /* Đảm bảo hiệu ứng chuyển đổi cũng áp dụng cho hover */
        }

        .event p::before {
            content: ""; /* Thêm một phần tử giả */
            display: block; /* Hiển thị như một khối */
            height: 0; /* Đảm bảo chiều cao ban đầu là 0 */
            transition: height 0.5s ease-in-out; /* Hiệu ứng chuyển đổi mượt mà cho chiều cao */
        }

        .event p:hover::before {
            height: auto; /* Thay đổi chiều cao khi hover để hiển thị toàn bộ nội dung */
        }

        @keyframes fadeIn {
            from {
                opacity: 0; /* Bắt đầu với độ trong suốt 0 */
                transform: translateY(-10px); /* Dịch chuyển lên trên 10px */
            }
            to {
                opacity: 1; /* Kết thúc với độ trong suốt 100% */
                transform: translateY(0); /* Trở về vị trí ban đầu */
            }
        }

        .event p:hover {
            animation: fadeIn 0.5s ease-in-out; /* Thêm animation fade-in khi hover */
        }


        .event a {
            font-size: 1rem;
            color: #007bff;
            text-decoration: none;
            margin-top: auto; /* Đẩy liên kết xuống đáy */
            position: relative;
            bottom: 0;
            transition: color 0.3s ease;
            white-space: nowrap; /* Ngăn ngắt dòng */
            margin-top: 10px; /* Tạo khoảng cách phía trên liên kết */
            display: inline-block; /* Đảm bảo liên kết nằm trên một dòng */
        }


        .event a:hover {
            color: red;
        }

        .row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
    </style>
    <script>
        document.querySelectorAll('.event').forEach(item => {
            item.addEventListener('click', event => {
                const link = event.currentTarget.querySelector('.event-link');
                window.open(link.getAttribute('href'), '_blank');
            });
        });
    </script>
</html>

