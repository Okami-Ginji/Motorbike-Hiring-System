<%-- 
    Document   : manageCustomer
    Created on : May 25, 2024, 5:52:23 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>bs4 crud users - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style type="text/css">
            body {
                margin-top: 20px;
                background: #f8f8f8
            }
            .info label {
                font-style: italic;
                width: 20%;
                font-weight: 500;
            }
            .close:hover {
                opacity: 0.8;
                background: lightgray;
            }

        </style>
    </head>

    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9c87e70b87.js" crossorigin="anonymous"></script>
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="homeStaff.jsp"><i
                                            class="fa fa-fw fa-bar-chart mr-1"></i><span>Trang chủ</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col">
                   
                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Làm TỐT</span><small class="px-1">cuối tháng tăng lương</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center">
                                                            <div class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0">
                                                                <input type="checkbox" class="custom-control-input" id="all-items">
                                                            </div>
                                                            </div>
                                                        </th>
                                                        <th>ID</th>
                                                        <th class="max-width">Họ và tên</th>
                                                        <th class="max-width">Tên đăng nhập</th>
                                                        <th class="sortable">Ngày sinh</th>
                                                        <th class="max-width">Điện thoại</th>
                                                        <th> </th>
                                                        <th>Thao tác</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="account" items="${sessionScope.accountStaff}">
                                                        <tr class="m-3">    
                                                            <td style="padding: 24px" class="align-middle">
                                                                <div class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top">
                                                                    <input type="checkbox" class="custom-control-input" id="item-${account.accountId}">
                                                                </div>
                                                            </td>
                                                            <td name="accountId" class="align-middle">${account.accountId}</td>
                                                            <td name="fullname" class="text-nowrap align-middle">${account.firstName} ${account.lastName}</td>
                                                            <td name="username" class="text-nowrap align-middle">${account.userName}</td>
                                                            <td name="dob" class="text-nowrap align-middle">${account.dob}</td>
                                                            <td name="phoneNumber" class="text-nowrap align-middle">${account.phoneNumber}</td>
                                                            <td class="text-center align-middle"><i class="fa fa-fw text-secondary cursor-pointer fa-toggle-on"></i></td>
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">
                                                                    <button class="btn btn-sm btn-outline-secondary edit-btn" type="button"
                                                                            data-toggle="modal" data-target="#user-form-modal"
                                                                            data-accountId="${account.accountId}"
                                                                            data-fullName="${account.firstName} ${account.lastName}"
                                                                            data-dob="${account.dob}"
                                                                            data-email="${account.email}"
                                                                            data-address="${account.address}"
                                                                            data-gender="${account.gender}"
                                                                            data-phoneNumber="${account.phoneNumber}"
                                                                            data-image="images/${account.image}"
                                                                            data-username="${account.userName}"
                                                                            data-idCardNumber="${customerMap[account.accountId].identityCard}"
                                                                            data-idCardIssueDate="${customerMap[account.accountId].issuedOnDate}"
                                                                            data-idCardExpiryDate="${customerMap[account.accountId].expDate}"
                                                                            data-idCardType="${customerMap[account.accountId].typeCard}"
                                                                            data-bookingCount="${bookingCount[account.accountId]}"
                                                                            onclick="openUserModal(this)">
                                                                        Edit
                                                                    </button>

                                                                    <button class="btn btn-sm btn-outline-secondary" type="button"><i class="fa fa-trash"></i></button>
                                                                </div>
                                                            </td>
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
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center px-xl-3">
                                        <button class="btn btn-success btn-block" type="button" data-toggle="modal"
                                                data-target="#user-form-modal">New User</button>
                                    </div>
                                    <hr class="my-3">
                                    <div class="e-navlist e-navlist--active-bold">
                                        <ul class="nav">
                                            <li class="nav-item active"><a href
                                                                           class="nav-link"><span>All</span>&nbsp;<small>/&nbsp;32</small></a></li>
                                            <li class="nav-item"><a href
                                                                    class="nav-link"><span>Active</span>&nbsp;<small>/&nbsp;16</small></a>
                                            </li>
                                            <li class="nav-item"><a href
                                                                    class="nav-link"><span>Selected</span>&nbsp;<small>/&nbsp;0</small></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <hr class="my-3">
                                    <div>
                                        <div class="form-group">
                                            <label>Date from - to:</label>
                                            <div>
                                                <input id="dates-range" class="form-control flatpickr-input"
                                                       placeholder="01 Dec 17 - 27 Jan 18" type="text" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Search by Name:</label>
                                            <div><input class="form-control w-100" type="text" placeholder="Name" value>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="my-3">
                                    <div class>
                                        <label>Status:</label>
                                        <div class="px-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" name="user-status"
                                                       id="users-status-disabled">
                                                <label class="custom-control-label"
                                                       for="users-status-disabled">Disabled</label>
                                            </div>
                                        </div>
                                        <div class="px-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" name="user-status"
                                                       id="users-status-active">
                                                <label class="custom-control-label" for="users-status-active">Active</label>
                                            </div>
                                        </div>
                                        <div class="px-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" name="user-status"
                                                       id="users-status-any" checked>
                                                <label class="custom-control-label" for="users-status-any">Any</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div style="padding: 10px 16px;" class="modal-header">
                                    <h5 class="modal-title">Thông tin khách hàng</h5>
                                    <button style="border: 1px solid #000" onclick="closeDetail()" type="button" class="btn close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div style="padding-top: 0px" class="info modal-body">.
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="profile-image" style="position: relative; width: 150px; height: 150px;">
                                                    <img id="modal-image" alt="Profile Image" style="width: 120%; height: 120%; border-radius: 50%; object-fit: cover;">
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-12 mb-4">
                                                        <label>Họ và tên:</label>
                                                        <p style="display: inline;" id="modal-full-name"></p>
                                                    </div>
                                                    <div class="col-md-12 mb-4">
                                                        <label>Ngày sinh: </label>
                                                        <p style="display: inline;" id="modal-dob"></p>
                                                    </div>
                                                    <div class="col-md-12 mb-4">
                                                        <label>Email: </label>
                                                        <p style="display: inline;" id="modal-email"></p>
                                                    </div>
                                                    <div class="col-md-12  mb-4">
                                                        <label>Địa chỉ: </label>
                                                        <p style="display: inline;" id="modal-address"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-4 mt-3">
                                                <div class="col-md-4 text-center">
                                                    <label style="min-width: 100px;">Giới tính</label>
                                                    <p id="modal-gender"></p>
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <label style="min-width: 100px;">Số điện thoại</label>
                                                    <p id="modal-phone-number"></p>
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <label style="min-width: 120px;">Tên đăng nhập</label>
                                                    <p id="modal-username"></p>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- ID Card and Related Information - Bottom Right -->
<!--                                        <div class="row">
                                            <div class="col text-right">
                                                <div style="position: relative; width: 150px; height: auto;">
                                                    <img src="https://www.politsei.ee/thumbs/1080x1080r/Dokumentide%20naeidised/idkaart2021/uus-id-kaart-naeidis1.jpg?4e010f0460" alt="ID Card" 
                                                         style="    width: 200%;
                                                         height: auto;
                                                         object-fit: cover;
                                                         border: 1px solid #ccc;
                                                         position: absolute;
                                                         right: -389%;
                                                         top: 8px">                                                
                                                </div>
                                                <div>
                                                    <p><strong>Thông tin CMND/Bằng lái xe</strong></p>
                                                    <p>Số thẻ: <span id="modal-id-card-number"></span></p>
                                                    <p>Ngày cấp: <span id="modal-id-card-issue-date"></span></p>
                                                    <p>Ngày hết hạn: <span id="modal-id-card-expiry-date"></span></p>
                                                    <p>Loại thẻ: <span id="modal-id-card-type"></span></p>
                                                </div>
                                                <div>
                                                    <p><strong>Số lượng đơn đặt xe: &ensp;&ensp;<span id="modal-booking-count"></span></strong></p>
                                                </div>
                                            </div>
                                        </div>-->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
                                        function openUserModal(button) {
                                            var modal = $('#user-form-modal');
                                            var accountId = button.getAttribute('data-accountId');
                                            modal.find('#modal-full-name').text(button.getAttribute('data-fullName'));
                                            modal.find('#modal-dob').text(button.getAttribute('data-dob'));
                                            modal.find('#modal-email').text(button.getAttribute('data-email'));
                                            modal.find('#modal-address').text(button.getAttribute('data-address'));
                                            modal.find('#modal-gender').text(button.getAttribute('data-gender'));
                                            modal.find('#modal-image').attr('src', button.getAttribute('data-image'));
                                            modal.find('#modal-phone-number').text(button.getAttribute('data-phoneNumber'));
                                            modal.find('#modal-username').text(button.getAttribute('data-username'));
                                            modal.find('#modal-id-card-number').text(button.getAttribute('data-idCardNumber'));
                                            modal.find('#modal-id-card-issue-date').text(button.getAttribute('data-idCardIssueDate'));
                                            modal.find('#modal-id-card-expiry-date').text(button.getAttribute('data-idCardExpiryDate'));
                                            modal.find('#modal-id-card-type').text(button.getAttribute('data-idCardType'));
                                            modal.find('#modal-booking-count').text(button.getAttribute('data-bookingCount'));

                                            $('#user-form-modal').modal('show'); //boostrap jqs
                                        }

                                        function closeDetail()
                                        {
                                            $('#user-form-modal').modal('hide');
                                        }

        </script>
    </body>
    <!-- Đoạn mã JavaScript -->
</html>
