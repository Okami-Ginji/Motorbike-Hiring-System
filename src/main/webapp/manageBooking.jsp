<%-- 
    Document   : manageBooking
    Created on : 23 thg 6, 2024, 09:12:35
    Author     : MINH TUAN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/9c87e70b87.js" crossorigin="anonymous"></script>
        <style>
            .booking-item {
                transition: transform 0.3s;
            }

            .booking-item:hover {
                transform: scale(1.05);
            }

            body {
                margin-top: 20px;
                background: #f8f8f8
            }

            .info label {
                font-style: italic;
                font-weight: 500;
            }

            .close:hover {
                opacity: 0.8;
                background: lightgray;
            }

            .fa-toggle-on:before {
                color: blue;
            }

            .nav-link {
                cursor: pointer;
            }

            .custom-control-label {
                cursor: pointer;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".sidebar-link").forEach(function (sidebarLink) {
                    sidebarLink.addEventListener("click", function () {
                        var targetTab = sidebarLink.getAttribute("data-target-tab");
                        document.querySelector(targetTab).click();
                    });
                });

                // Add event listeners for radio buttons
                document.querySelectorAll(".custom-control-input").forEach(function (radio) {
                    radio.addEventListener("change", function () {
                        var value = radio.value;
                        document.querySelector('[data-target-tab="#tab-' + value + '"]').click();
                    });
                });
            });
        </script>
    </head>

    <body>
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="homeStaff.jsp"><i
                                            class="fa fa-fw fa-bar-chart mr-1"></i><span>Trang chủ</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div>
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" id="tab-booking" data-bs-toggle="tab" href="#booking">Đặt đơn</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab-cancelling" data-bs-toggle="tab" href="#cancelling">Hủy
                                    đơn</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab-extending" data-bs-toggle="tab" href="#extending">Gia
                                    hạn</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content mt-3">
                        <div id="booking" class="tab-pane fade show active">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Làm TỐT</span><small class="px-1">cuối tháng tăng
                                                lương</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Ngày đặt</th>
                                                        <th scope="col">Số xe</th>
                                                        <th scope="col">Trạng thái giao</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Thao tác</th>
                                                        <th> </th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.bookings}" var="listB">
                                                    <form action="manageBooking" method="post" id="form-update-${listB.bookingID}" class="row">
                                                        <input type="hidden" name="bookingID" value="${listB.bookingID}">
                                                        <tr>
                                                            <th scope="row">${listB.bookingID}</th>
                                                            <td>${listB.bookingDate}</td>
                                                            <td>${fn:length(listB.listBookingDetails)}</td>
                                                            <td>
                                                                <select name="delistatus_${listB.bookingID}" id="status-${listB.bookingID}" class="form-select form-select-sm" aria-label="Trạng thái" disabled>
                                                                    <option value="Chưa giao" ${listB.deliveryStatus == 'Chưa giao' ? 'selected' : ''}>Chưa giao</option>
                                                                    <option value="Đã giao" ${listB.deliveryStatus == 'Đã giao' ? 'selected' : ''}>Đã giao</option>
                                                                    <option value="Đã trả" ${listB.deliveryStatus == 'Đã trả' ? 'selected' : ''}>Đã trả</option>
                                                                </select>
                                                            </td>                                                        <td>
                                                                <c:set var="total" value="0"/>
                                                                <c:forEach items="${listB.listBookingDetails}" var="detail">
                                                                    <c:set var="total" value="${total + detail.totalPrice}"/>
                                                                </c:forEach>
                                                                <fmt:formatNumber value="${total*1000}" type="currency" currencySymbol="VNĐ" />
                                                            </td>                                                        
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">
                                                                    <button class="btn btn-sm btn-outline-secondary edit-btn" type="button"
                                                                            data-toggle="modal" data-target="#user-form-modal"
                                                                            data-bookingId="${listB.bookingID}"
                                                                            data-bookingDate="${listB.bookingDate}"
                                                                            data-startDate="${listB.startDate}"
                                                                            data-endDate="${listB.endDate}"
                                                                            data-statusBooking="${listB.statusBooking}"
                                                                            data-deliveryLocation="${listB.deliveryLocation}"
                                                                            data-returnedLocation="${listB.returnedLocation}"
                                                                            data-deliveryStatus="${listB.deliveryStatus}"
                                                                            data-countMotorcycle="${fn:length(listB.listBookingDetails)}"
                                                                            data-nameMotorcycle=" 
                                                                            <c:set var="motorcycleDetails" value="${motorcycleDetailsMap[listB.bookingID]}" />
                                                                            <c:forEach var="entry" items="${motorcycleDetails}" varStatus="loop">
                                                                                ${entry.key} (x${entry.value})
                                                                                <c:if test="${not loop.last}">,</c:if>
                                                                            </c:forEach>"
                                                                            data-Price="
                                                                            <c:set var="total" value="0"/>
                                                                            <c:forEach items="${listB.listBookingDetails}" var="detail">
                                                                                <c:set var="total" value="${total + detail.totalPrice}"/>
                                                                            </c:forEach>
                                                                            <fmt:formatNumber value="${total*1000}" type="currency" currencySymbol="VNĐ" />"
                                                                            data-customerId="searchCustomer?id=${listB.customerID}"
                                                                            onclick="openUserModal(this)">
                                                                        Kiểm tra
                                                                    </button>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <button type="button" onclick="changeType('${listB.bookingID}', this)" id="update-${listB.bookingID}" class="btn btn-sm btn-outline-secondary edit-btn">
                                                                    Cập nhật
                                                                </button>
                                                                <button type="submit" style="display:none;" id="save-${listB.bookingID}" class="btn btn-sm btn-outline-secondary">Lưu</button>
                                                            </td>
                                                        </tr>
                                                    </form>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <li class="disabled page-item"><a href="#" class="page-link">‹</a></li>
                                                <li class="active page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">›</a></li>
                                                <li class="page-item"><a href="#" class="page-link">»</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="cancelling" class="tab-pane fade">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Làm TỐT</span><small class="px-1">cuối tháng tăng
                                                lương</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Mã đơn</th>
                                                        <th scope="col">Ngày hủy đơn</th>
                                                        <th scope="col">Ghi chú (Lý do)</th>
                                                        <th scope="col">Thao tác</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.cancels}" var="listC">
                                                        <tr>
                                                            <th scope="row">${listC.cancellationID}</th>
                                                            <td>${listC.bookingID}</td>
                                                            <td>${listC.cancellationDate}</td>
                                                            <td>${listC.note}</td>
                                                            <td><button style="border: none">Xác nhận</button></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <li class="disabled page-item"><a href="#" class="page-link">‹</a></li>
                                                <li class="active page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">›</a></li>
                                                <li class="page-item"><a href="#" class="page-link">»</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="extending" class="tab-pane fade">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Làm TỐT</span><small class="px-1">cuối tháng tăng
                                                lương</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Mã đơn</th>
                                                        <th scope="col">Ngày gia hạn</th>
                                                        <th scope="col">Ngày hạn trước</th>
                                                        <th scope="col">Ngày hạn mới</th>
                                                        <th scope="col">Phí gia hạn</th>
                                                        <th scope="col">Thao tác</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.extend}" var="extend">
                                                        <tr>
                                                            <th scope="row">${extend.extensionID}</th>
                                                            <td>${extend.bookingID}</td>
                                                            <td>${extend.extensionDate}</td>
                                                            <td>${extend.previousEndDate}</td>
                                                            <td>${extend.newEndDate}</td>
                                                            <td>
                                                                <fmt:formatNumber value="${extend.extensionFee * 1000}" type="currency" currencySymbol="VNĐ" />
                                                            </td>                        
                                                            <td><button style="border: none">Xác nhận</button></td>
                                                        </tr>
                                                    </tbody>
                                                </c:forEach>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <li class="disabled page-item"><a href="#" class="page-link">‹</a></li>
                                                <li class="active page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">›</a></li>
                                                <li class="page-item"><a href="#" class="page-link">»</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div style="width: 18%" class="col-12 col-lg-3 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <hr class="my-4">
                            <div class="e-navlist e-navlist--active-bold">
                                <ul class="nav" id="navList">
                                    <li class="nav-item">
                                        <a class="nav-link sidebar-link" data-target-tab="#tab-booking">
                                            <span>Đặt đơn</span>&nbsp;<small>/&nbsp;<span>${bookings.size()}</span></small>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link sidebar-link" data-target-tab="#tab-cancelling">
                                            <span>Hủy đơn</span>&nbsp;<small>/&nbsp;<span>${cancels.size()}</span></small>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link sidebar-link" data-target-tab="#tab-extending">
                                            <span>Gia hạn</span>&nbsp;<small>/&nbsp;<span>${extend.size()}</span></small>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <hr class="my-3">
                            <div>
                                <label>Trạng thái: </label>
                                <div class="px-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="user-status"
                                               id="users-status-booking" value="booking">
                                        <label class="custom-control-label sidebar-radio" for="users-status-booking"
                                               data-target-tab="#tab-booking">Đặt đơn</label>
                                    </div>
                                </div>
                                <div class="px-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="user-status"
                                               id="users-status-cancelling" value="cancelling">
                                        <label class="custom-control-label sidebar-radio" for="users-status-cancelling"
                                               data-target-tab="#tab-cancelling">Hủy đơn</label>
                                    </div>
                                </div>
                                <div class="px-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="user-status"
                                               id="users-status-extending" value="extending">
                                        <label class="custom-control-label sidebar-radio" for="users-status-extending"
                                               data-target-tab="#tab-extending">Gia hạn</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-3">
                    <form action="searchCustomer" method="post">
                        <div>
                            <div class="form-group fst-italic">
                                <label>Tìm kiếm qua mã đơn hàng: </label>
                                <div><input name="username" class="form-control w-100" type="text" placeholder="Mã đơn..."
                                            value></div>
                            </div>

                            <div class="mt-2">
                                <button class="btn btn-secondary w-100" type="submit" value="Search">Tìm kiếm</button>
                            </div>
                        </div>
                    </form>
                    <div class="mt-2 d-flex flex-column align-items-center"></div>
                </div>
                <!-- modal để hiển thị thông tin chi tiết -->
                <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div style="padding: 10px 16px;" class="modal-header">
                                <h5 class="modal-title">Thông tin Đơn hàng</h5>
                                <button style="border: 1px solid #000" onclick="closeDetail()" type="button" class="btn close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div style="padding-top: 0px" class="info modal-body">.
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="col-md-12 mb-4">
                                                <label>Mã đơn: </label>
                                                <p style="display: inline;" id="modal-bookingId"></p>
                                            </div>
                                            <div class="col-md-12 mb-4">
                                                <label>Tên các xe: </label>
                                                <p style="display: inline;" id="modal-nameMotorcycle"></p>
                                            </div>
                                            <div class="col-md-12 mb-4">
                                                <label>Thời gian đặt xe: </label>
                                                <p style="display: inline;" id="modal-bookingDate"></p>
                                            </div>
                                            <div class="col-md-12  mb-4">
                                                <label>Thời gian bắt đầu: </label>
                                                <p style="display: inline;" id="modal-startDate"></p>
                                            </div>
                                            <div class="col-md-12  mb-4">
                                                <label>Thời gian trả xe: </label>
                                                <p style="display: inline;" id="modal-endDate"></p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">

                                            <div class="col-md-12  mb-4">
                                                <label>Số lượng xe: </label>
                                                <p style="display: inline;" id="modal-countMotorcycle"></p>
                                            </div>
                                            <div class="col-md-12  mb-4">
                                                <label>Địa chỉ giao: </label>
                                                <p style="display: inline;" id="modal-deliveryLocation"></p>
                                            </div>
                                            <div class="col-md-12  mb-4">
                                                <label>Địa chỉ trả: </label>
                                                <p style="display: inline;" id="modal-returnedLocation"></p>
                                            </div>
                                        </div>
                                        <div style="font-weight: bold;" class="col-md-12">
                                            <p style="font-size: 20px"><strong>Trạng thái: </strong></p>
                                            <div class="col-md-12 mb-4">
                                                <label style="width: 22%">Trạng thái đơn hàng: </label>
                                                <p style="display: inline;" id="modal-statusBooking"></p>
                                            </div>
                                            <div class="col-md-12 mb-4">
                                                <label style="width: 22%">Trạng thái giao xe: </label>
                                                <p style="display: inline;" id="modal-deliveryStatus"></p>
                                            </div>

                                            <div class="col-md-12 mb-4">
                                                <a  id="modal-customerId" style="display: inline; font-style: italic" id="modal-address">Thông tin khách hàng</a>
                                            </div>


                                        </div>
                                        <div style="color: red;" class="col-md-12 text-center">
                                            <p style="font-size: 30px" id="modal-Price"><strong></strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>                 
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</div>
</body>
<script>
    function openUserModal(button) {
        var modal = $('#user-form-modal');
        modal.find('#modal-bookingId').text(button.getAttribute('data-bookingId'));
        modal.find('#modal-bookingDate').text(button.getAttribute('data-bookingDate'));
        modal.find('#modal-startDate').text(button.getAttribute('data-startDate'));
        modal.find('#modal-endDate').text(button.getAttribute('data-endDate'));
        modal.find('#modal-statusBooking').text(button.getAttribute('data-statusBooking'));
        modal.find('#modal-deliveryLocation').text(button.getAttribute('data-deliveryLocation'));
        modal.find('#modal-returnedLocation').text(button.getAttribute('data-returnedLocation'));
        modal.find('#modal-deliveryStatus').text(button.getAttribute('data-deliveryStatus'));
        modal.find('#modal-countMotorcycle').text(button.getAttribute('data-countMotorcycle'));
        modal.find('#modal-nameMotorcycle').text(button.getAttribute('data-nameMotorcycle'));
        modal.find('#modal-Price').text(button.getAttribute('data-Price'));
        modal.find('#modal-customerId').attr('href', button.getAttribute('data-customerId'));
        $('#user-form-modal').modal('show');
    }
    function closeDetail()
    {
        $('#user-form-modal').modal('hide');
    }

    function changeType(bookingID, button) {
        var statusSelect = document.getElementById('status-' + bookingID);
        var updateButton = document.getElementById('update-' + bookingID);
        var saveButton = document.getElementById('save-' + bookingID);

        if (button.id === updateButton.id) {
            updateButton.style.display = 'none';
            saveButton.style.display = 'inline';
            statusSelect.disabled = false;
        } else {
            document.getElementById("form-update-" + bookingID).submit();
            saveButton.style.display = 'none';
            updateButton.style.display = 'inline';
            statusSelect.disabled = true;
        }
    }

</script>
</html>
