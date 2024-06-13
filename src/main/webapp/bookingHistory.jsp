<%-- 
    Document   : bookingHistory
    Created on : Jun 7, 2024, 12:15:49 AM
    Author     : huypd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">


        <title>bs4 account tickets - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style type="text/css">
                body {
                background: #eee;
            }

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
                background-color: #007BFF;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            .filters .filter-btn:hover {
                background-color: #0056b3;
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
        </style>
    </head>
    <body>

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
            <div class="container mt-5">
            <div class="row">
                <div class="col-lg-4 pb-5">
                    <div class="author-card pb-3">
                        <div class="author-card-cover"
                             style="background-image: url(https://bootdey.com/img/Content/flores-amarillas-wallpaper.jpeg);"><a
                                class="btn btn-style-1 btn-white btn-sm" href="#" data-toggle="tooltip" title
                                data-original-title="You currently have 290 Reward points to spend"><i
                                    class="fa fa-award text-md"></i>&nbsp;290 points</a></div>
                        <div class="author-card-profile">
                            <div class="author-card-avatar"><img src="images/${account.image}"
                                                                 alt="${account.lastName}">
                            </div>
                            <div class="author-card-details">
                                <h5 class="author-card-name text-lg">${account.firstName} ${account.lastName}</h5><span class="author-card-position">Joined February
                                    06, 2017</span>
                            </div>
                        </div>
                    </div>
                    <div class="wizard">
                        <nav class="list-group list-group-flush">
                            <a class="list-group-item active" href="bookingHistory.jsp">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div><i class="fe-icon-shopping-bag mr-1 text-muted"></i>
                                        <div class="d-inline-block font-weight-medium text-uppercase">Lịch sử thuê xe</div>
                                    </div>
                                </div>
                            </a>
                            <a class="list-group-item " href="profileCustomer.jsp"><i class="fe-icon-user text-muted"></i>Thông tin cá nhân</a>
                            <a class="list-group-item " href="#"><i class="fe-icon-map-pin text-muted"></i>Mã giảm giá</a>
                            <a class="list-group-item" href="https://www.bootdey.com/snippets/view/bs4-wishlist-profile-page" target="__blank">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div><i class="fe-icon-heart mr-1 text-muted"></i>
                                        <div class="d-inline-block font-weight-medium text-uppercase">My Wishlist</div>
                                    </div>
                                </div>
                            </a>
                            <a class="list-group-item" href="https://www.bootdey.com/snippets/view/bs4-account-tickets" target="__blank">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div><i class="fe-icon-tag mr-1 text-muted"></i>
                                        <div class="d-inline-block font-weight-medium text-uppercase">My Tickets</div>
                                    </div>
                                </div>
                            </a>
                        </nav>
                    </div>
                </div>

                <div class="col-lg-8 pb-5">
                    <div class="filters">
                        <button class="filter-btn" data-filter="all" onclick="applyFilter('all')">Tất cả</button>
                        <button class="filter-btn" data-filter="pending" onclick="applyFilter('pending')">Chờ xác nhận</button>
                        <button class="filter-btn" data-filter="confirmed" onclick="applyFilter('confirmed')">Đã xác nhận</button>
                        <button class="filter-btn" data-filter="cancelled" onclick="applyFilter('cancelled')">Đã hủy</button>
                    </div>
                    <div class="confirmed-filters" id="confirmed-filters">
                        <label for="confirmed-status">Đã xác nhận:</label>
                        <select id="confirmed-status">
                            <option value="all">Tất cả trạng thái</option>
                            <option value="not-delivered">Chưa giao</option>
                            <option value="delivered">Đã giao</option>
                            <option value="returned">Đã trả</option>
                        </select>
                    </div>
                    <div class ="table-responsive">
                        <table class="caption-top table table-hover table-borderless table-striped" id="booking-table">
                            <caption>History Booking</caption>
                            <thead>
                                <tr>
                                    <th scope="col">Mã đơn</th>
                                    <th scope="col">Ngày bắt đầu</th>
                                    <th scope="col">Ngày trả xe</th>
                                    <th scope="col">Số lượng xe</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="pending">
                                    <td >12345</td>
                                    <td>01/06/2024</td>
                                    <td>05/06/2024</td>
                                    <td>2</td>
                                    <td>Chờ xác nhận</td>
                                    <td>1,000,000 VND</td>
                                    <td class="text-center"><a class="btn btn-info" title="" data-toggle="tooltip" onclick="showBookingDetail(this)" data-original-title="View"><i class="fa fa-eye"></i></a></td>
                                </tr>
                                <tr class="confirmed not-delivered">
                                    <td>12346</td>
                                    <td>01/06/2024</td>
                                    <td>05/06/2024</td>
                                    <td>1</td>
                                    <td>Đã xác nhận</td>
                                    <td>500,000 VND</td>
                                    <td class="text-center"><a class="btn btn-info" title="" data-toggle="tooltip" onclick="showBookingDetail(this)" data-original-title="View"><i class="fa fa-eye"></i></a></td>
                                </tr>
                                <tr class="cancelled">
                                    <td>12347</td>
                                    <td>02/06/2024</td>
                                    <td>06/06/2024</td>
                                    <td>3</td>
                                    <td>Đã hủy</td>
                                    <td>1,500,000 VND</td>
                                    <td class="text-center"><a class="btn btn-info" title="" data-toggle="tooltip" onclick="showBookingDetail(this)" data-original-title="View"><i class="fa fa-eye"></i></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                        document.addEventListener("DOMContentLoaded", () => {
                                            initializeFilters();
                                            initializeDetailButtons();
                                        });

                                        //check trạng thái là đã xác nhận để hiện select
                                        function initializeFilters() {
                                            const confirmedFilters = document.getElementById("confirmed-filters");
                                            const confirmedStatusSelect = document.getElementById("confirmed-status");

                                            document.querySelectorAll(".filter-btn").forEach(button => {
                                                button.addEventListener("click", () => {
                                                    const filter = button.getAttribute("data-filter");
                                                    applyFilter(filter);

                                                    if (filter === "confirmed") {
                                                        confirmedFilters.style.display = "block";
                                                    } else {
                                                        confirmedFilters.style.display = "none";
                                                    }
                                                });
                                            });

                                            confirmedStatusSelect.addEventListener("change", () => {
                                                const filter = confirmedStatusSelect.value;
                                                applyConfirmedFilter(filter);
                                            });
                                        }
                                        //lọc theo 3 trạng thái của đã xác nhận
                                        function applyConfirmedFilter(filter) {
                                            document.querySelectorAll("#booking-table tbody tr.confirmed").forEach(row => {
                                                if (filter === "all" || row.classList.contains(filter)) {
                                                    row.style.display = "";
                                                } else {
                                                    row.style.display = "none";
                                                }
                                            });
                                        }
                                        //lọc theo status chờ xác nhận, đã xác nhận, đã hủy
                                        function applyFilter(filter) {
                                            document.querySelectorAll("#booking-table tbody tr").forEach(row => {
                                                if (filter === "all" || row.classList.contains(filter)) {
                                                    row.style.display = "";
                                                } else {
                                                    row.style.display = "none";
                                                }
                                            });
                                        }

                                        //demo thôi 
                                        function showBookingDetail(button) {
                                            const row = button.closest("tr");
                                            const bookingId = row.cells[0].textContent;
                                            window.location.href = 'bookingHistoryDetail.jsp?bookingId=' + bookingId;  //đổi link là servlet
                                        }
        </script>


    </body>
</html>
