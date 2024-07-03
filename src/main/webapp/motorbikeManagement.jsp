<%-- 
    Document   : motorbikeManagement
    Created on : Jun 13, 2024, 7:58:19 AM
    Author     : DiepTCNN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vertical Tabs with Right Navigation</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
            rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- OWL Car -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!-- Showmore css -->
        <link rel="stylesheet" href="css/showMoreItems-theme.min.css">
        <!-- Data Table -->
        <link rel="stylesheet"
              href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">

        <link rel="stylesheet"
              href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <style>
            body,
            html {
                height: 100%;
                margin: 0;
                font-family: 'Montserrat', sans-serif;
            }

            .tab-container {
                display: flex;
                flex-direction: column;
                height: 100vh;
                margin-top: 60px;
            }

            /* Nội dung tab */
            .tab-content {
                flex: 1;
                padding: 20px;
                overflow-y: auto;
                /*background: rgba(30, 151, 191, 0.1);*/
            }

            .tab-content h3 {
                color: #1e97bf;
                font-size: 20px;
                font-weight: 700;
                text-transform: uppercase;
                margin: 0 0 7px;
            }

            /* Danh sách tab ngang */
            .nav-tabs {
                display: flex;
                margin-top: 0; /* Xóa khoảng trống phía trên */
                padding-left: 50px; /* Xóa padding bên trái */
                margin-left: 3%;
                border-bottom: 2px solid #ddd;

            }


            .nav-tabs li {
                margin-right: 10px;
            }

            .nav-tabs li a {
                color: #222;
                background: transparent;
                font-size: 17px;
                font-weight: 800;
                letter-spacing: 1px;
                text-align: center;
                text-transform: uppercase;
                padding: 12px 15px;
                margin: 0;
                border: none;
                border-radius: 4px;
                transition: all 0.3s ease;
            }

            .nav-tabs li a:hover,
            .nav-tabs li.active a {
                color: #1e97bf;
                background: rgba(30, 151, 191, 0.1);
                border-block-end: solid;
                writing-mode: horizontal-tb;
            }

            /* Thiết kế phản hồi cho màn hình nhỏ */
            @media only screen and (max-width: 767px) {
                .nav-tabs {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .nav-tabs li {
                    margin-right: 0;
                    margin-bottom: 10px;
                }

                .tab-content {
                    padding: 10px;
                }
            }

            .container-fluid {
                padding: 2rem 0;
            }

            .tableview {
                width: 80%;
                margin: 0 auto;
            }

            .table-image {
                border-collapse: separate;
                border-spacing: 0 15px;
            }

            .table-image td,
            .table-image th {
                vertical-align: middle;
                background: #fff;
                border: none;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .table thead th {
                border: none;
                background-color: #6E9DC5;
                color: #fff;
                text-align: center;
            }

            .table tbody tr:hover {
                background-color: #f1f1f1;
            }

            .action-buttons .btn {
                margin: 0 5px;
                transition: all 0.3s ease;
            }

            .action-buttons .btn:hover {
                transform: scale(1.1);
            }

            .action-buttons .btn:focus {
                outline: none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            td input.form-control {
                animation: fadeIn 0.5s;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }

                to {
                    opacity: 1;
                }
            }

            .buttons {
                display: flex;
                justify-content: center;
            }

            .container-fluid {
                background: #E1EDF2;
            }

            .addnew,
            .editmotor {
                margin-left: 15%;
            }

            .alert {
                margin-top: 10px; /* Khoảng cách từng thông báo */
                display: none; /* Ẩn thông báo mặc định */
            }

        </style>
<!--        <link href="staffAssets/css/style.css" rel="stylesheet">-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!--<link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
    </head>
 
    <body>
        <!-- ======= Header ======= -->
      
        <div class="col-md-2">
       
            
        </div>
        <div class="container-fluid tab-container col-md-10">
            <!-- Danh sách tab ngang -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#Section1"
                                                          aria-controls="home" role="tab"
                                                          data-toggle="tab">Display All Motorbikes</a></li>
                <li role="presentation"><a href="#Section2"
                                           aria-controls="profile" role="tab"
                                           data-toggle="tab">Add New Model</a></li>
                <li role="presentation">
                    <a href="#Section3" aria-controls="update" role="tab" data-toggle="tab">Add New Motorbike</a>
                </li>
                <li role="presentation">
                    <a href="#Section4" aria-controls="update" role="tab" data-toggle="tab">Update </a>
                </li>
            </ul>
            <!-- Nội dung tab -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                    <!-- Nội dung phần tab Display All Motorbikes -->
                    <div class="container-fluid">
                        <div class="row tableview">
                            <div class="col-12">
                                <table class="table table-image">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Model</th>
                                            <th scope="col">Displacement</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Min Age</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Detail</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${listM}" var="m">
                                        <tbody id="table-body">
                                            <tr>
                                                <th scope="row">${m.motorcycleId}</th>
                                                <td class="w-25">
                                                    <img src="images/${m.image}"
                                                         class="img-fluid img-thumbnail" alt="motor">
                                                </td>
                                                <td>${m.model}</td>
                                                <td>${m.displacement}</td>
                                                <td>${m.description}</td>
                                                <td>${m.minAge}</td>
                                                <c:forEach items="${listB}" var="b">
                                                    <c:if test="${m.brandID == b.brandID}">
                                                        <td>${b.brandName}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listC}" var="c">
                                                    <c:if test="${m.categoryID == c.categoryID}">
                                                        <td>${c.categoryName}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listP}" var="p">
                                                    <c:if test="${m.priceListID == p.priceListId}">
                                                        <td>${p.dailyPriceForDay}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <td>
                                                    <button type="button" class="btn btn-primary" id="launchModalBtn"
                                                            data-toggle="modal" data-target="#user-form-modal" onclick="OneClick(this)"
                                                            data-motorcycleId="${m.motorcycleId}" 
                                                            data-motorcycleName="${m.model}"
                                                            data-license="<c:forEach items="${m.listMotorcycleDetails}" var="listmd">
                                                                ${listmd.licensePlate},
                                                            </c:forEach>"                                        
                                                            <span class="bold">Detail</span>
                                                    </button>

                                                </td>
                                                <td class="action-buttons">
                                                    <div class="buttons">
                                                        <button class="btn btn-primary btn-sm" onclick="">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-danger btn-sm" onclick="confirmDelete('${m.motorcycleId}')">

                                                            <a style="color: white" href="deleteMotor?id=${m.motorcycleId}"><i class="fas fa-trash"></i></a>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Section2">
                    <!-- Nội dung phần tab Add New Motorbike -->
                    <section>
                        <div class="container-fluid">
                            <div class="row ">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <form class="addnew-motorbike-form" method="post" action="addMotorbike" enctype="multipart/form-data">
                                                    <h3>Add New Model</h3>
                                                    <div class="form-group">
                                                        <input type="file" class="form-control-file" id="motorbikeImage" name="image">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Enter Motorbike ID" name="id">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Enter model" name="model">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control"
                                                               placeholder="Enter displacement" name="displacement">
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea class="form-control" rows="3"
                                                                  placeholder="Enter description" name="description"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="number" class="form-control" placeholder="Enter min age" name="minAge">
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" id="bid" name="brandID">
                                                            <c:forEach items="${listB}" var="b" varStatus="loop">
                                                                <option value="${b.brandID}">${b.brandName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" id="cid" name="categoryID">
                                                            <c:forEach items="${listC}" var="c" varStatus="loop">
                                                                <option value="${c.categoryID}">${c.categoryName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" id="pid" name="priceListID">
                                                            <c:forEach items="${listP}" var="p" varStatus="loop">
                                                                <option value="${p.priceListId}">Day: ${p.dailyPriceForDay} - Week: ${p.dailyPriceForWeek} - Month: ${p.dailyPriceForMonth}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <button type="submit" class="btn btn-dark">Thêm xe máy</button>
                                                    <div class="feedback mt-3">
                                                        <div id="success-message" class="alert alert-success" style="display: none;">
                                                            Motorbike added successfully!
                                                        </div>
                                                        <div id="error-message" class="alert alert-danger" style="display: none;">
                                                            File Format Not Supported
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- Nội dung của Section 3 -->
                <div role="tabpanel" class="tab-pane fade" id="Section3">
                    <!-- Nội dung phần tab Add New Motorbike -->
                    <section>
                        <div class="container-fluid">
                            <div class="row ">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <!-- <form class="addnew-motorbike-form" method="post" action="addMotorDetail">-->
                                                <h3>Add New Motorbike</h3>
                                                <div class="form-group">
                                                    <select class="form-control" id="model" name="model">
                                                        <c:forEach items="${listM}" var="m" varStatus="loop">
                                                            <option value="${m.motorcycleId}">${m.model}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="License Plate" name="licensePlate" id="licensePlate">
                                                </div>
                                                <div style="color: red;" id="msg"></div> <br>
                                                <button type="submit" class="btn btn-dark" onclick="addMotorbikeDetail()">Thêm xe máy</button>
                                                <div class="feedback mt-3">
                                                    <div id="success-message" class="alert alert-success" style="display: none;">
                                                        Motorbike added successfully!
                                                    </div>
                                                    <div id="error-message" class="alert alert-danger" style="display: none;">
                                                        File Format Not Supported
                                                    </div>

                                                </div>
                                                <!--                                                </form>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <!-- Nội dung của Section 4 -->
                <div role="tabpanel" class="tab-pane fade" id="Section4">
                    <section>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <form class="edit-location-form" id="editLocationForm" action="UpdateTourismLoctionServletStaff" method="post" enctype="multipart/form-data">
                                                    <h3>Update Tourist Location</h3>
                                                    <div class="form-group">
                                                        <input type="file" class="form-control-file" id="motorbikeImage" name="image">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Enter Motorbike ID" name="id">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Enter model" name="model">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control"
                                                               placeholder="Enter displacement" name="displacement">
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea class="form-control" rows="3"
                                                                  placeholder="Enter description" name="description"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="number" class="form-control" placeholder="Enter min age" name="minAge">
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" id="bid" name="brandID">
                                                            <c:forEach items="${listB}" var="b" varStatus="loop">
                                                                <option value="${b.brandID}">${b.brandName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" id="cid" name="categoryID">
                                                            <c:forEach items="${listC}" var="c" varStatus="loop">
                                                                <option value="${c.categoryID}">${c.categoryName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" id="pid" name="priceListID">
                                                            <c:forEach items="${listP}" var="p" varStatus="loop">
                                                                <option value="${p.priceListId}">Day: ${p.dailyPriceForDay} - Week: ${p.dailyPriceForWeek} - Month: ${p.dailyPriceForMonth}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <button type="submit" class="btn btn-dark">Cập nhật xe máy</button>

                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div style="padding: 10px 16px;" class="modal-header">
                                <h5 class="modal-title">Thông tin chi tiết</h5>
                                <button style="border: 1px solid #000" onclick="closeDetail()" type="button" class="btn close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div style="padding-top: 0px" class="info modal-body">
                                <div class="container-fluid">
                                    <div class="row">                                       
                                        <div class="col-md-8">
                                            <div class="row" style="padding-left: 20px;">
                                                <div class="col-md-12 mb-4">
                                                    <label>ID: </label>
                                                    <p style="display: inline;" id="modal-motorcycleID"></p>
                                                </div>
                                                <div class="col-md-12 mb-4">
                                                    <label>Model: </label>
                                                    <p style="display: inline;" id="modal-motorcycleName"></p>
                                                </div>
                                                <div class="col-md-12 mb-4" style="display: flex;">
                                                    <label>License Plate: </label>
                                                    <div style="display: inline;" id="modal-license"></div>
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
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script type="text/javascript">
             // Sử dụng fetch để tải sidebar2.jsp
//            fetch('includes/sidebar.jsp')
//            .then(response => response.text())
//            .then(data => {
//                const sidebar = document.createElement('div');
//                const shadow = sidebar.attachShadow({ mode: 'open' });
//                shadow.innerHTML = data;
//                document.getElementById('sidebar').appendChild(sidebar);
//            })
//            .catch(error => console.error('Error loading sidebar:', error));
    
            function confirmDelete(motorcycleId) {
                Swal.fire({
                    title: 'Bạn có chắc chắn?',
                    text: "Bạn sẽ không thể khôi phục hành động này!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#1089FF',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Vâng, xóa nó!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'motorManage?motorcycleId=' + motorcycleId;
                    }
                });
            }

            function addMotorbikeDetail() {
                const motorcycleId = document.getElementById('model').value;
                const licensePlate = document.getElementById('licensePlate').value;
                var data = {
                    motorcycleId: motorcycleId,
                    licensePlate: licensePlate
                };
                $.ajax({
                    type: "POST",
                    url: "addMotorDetail", // Thay đổi URL tới servlet của bạn
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    success: function (response) {
                        // Nếu thành công, hiển thị thông báo thành công
                        document.getElementById('msg').style.color = 'green';
                        document.getElementById('msg').textContent = "Đã nhập dữ liệu thành công!";
                        window.location.href = 'motorManage';
                    },
                    error: function (xhr, status, error) {
                        document.getElementById('msg').style.color = 'red';
                        document.getElementById('msg').textContent = xhr.responseText || "Biển số xe đã có! Vui lòng nhập lại!";
                    }
                });
            }
            function OneClick(button) {
                var modal = $('#user-form-modal');
                modal.find('#modal-motorcycleID').text(button.getAttribute('data-motorcycleId'));
                modal.find('#modal-motorcycleName').text(button.getAttribute('data-motorcycleName'));
                modal.find('#modal-license').text(button.getAttribute('data-license'));


                const licenseData = button.getAttribute('data-license');

                // Đảm bảo licenseData là một chuỗi, nếu null thì gán giá trị mặc định là ''
                //licenseData = licenseData.trim() || '';
                var newData = licenseData.toString().trim();
                //alert(newData);
                // Chuyển đổi ký tự đặc biệt '|' thành ký tự xuống dòng hoặc thẻ <br> nếu cần thiết
                const licenseArray = newData.split(',');
                // Gán lại dữ liệu đã định dạng vào thuộc tính của nút (nếu cần thiết)
                //button.setAttribute('data-license', licenseArray.join(','));

                // Hiển thị dữ liệu đã định dạng (ví dụ, trong console hoặc một phần tử HTML khác)
                console.log(licenseArray); // Hiển thị mảng trong console

                // Nếu bạn muốn hiển thị từng phần tử trong một phần tử HTML khác:
                const licenseDisplayElement = document.getElementById('modal-license');
                if (licenseDisplayElement) {
                    // Xóa nội dung cũ của phần tử
                    licenseDisplayElement.innerHTML = '';

                    // Duyệt qua mảng và hiển thị từng phần tử
                    for (let i = 0; i < licenseArray.length; i++) {
                        const item = licenseArray[i].trim();
                        const p = document.createElement('p'); // Tạo một phần tử <p>
                        p.innerHTML = item; // Gán nội dung của phần tử
                        p.style.marginLeft = '5px';
                        p.style.textAlign = 'left';
                        licenseDisplayElement.appendChild(p); // Thêm phần tử vào phần tử hiển thị
                    }
                }
            }
        </script>

        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Bootstrap js -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/popper.js"></script>
        <!-- OWL Car -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Show More js -->
        <script src="js/showMoreItems.min.js"></script>
        <!-- Data TAble -->
        <script
        src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <!-- Bootstrap -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- Theme js -->
        <script type="text/javascript" src="js/main.js"></script>
        
       
    </body>
</html>

