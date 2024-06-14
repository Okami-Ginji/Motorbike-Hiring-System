<%-- 
    Document   : motorManage
    Created on : Jun 13, 2024, 7:48:13 AM
    Author     : DiepTCNN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vertical Tabs with Right Navigation</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <link rel="stylesheet" href="css/showMoreItems-theme.min.css">

        <link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <style>
            body,
            html {
                height: 100%;
                margin: 0;
                font-family: 'Montserrat', sans-serif;
            }

            .vertical-tab-container {
                display: flex;
                height: 100vh;
            }

            /* Nội dung tab bên trái */
            .tab-content {
                flex: 1;
                padding: 20px;
                overflow-y: auto;
                background: rgba(30, 151, 191, 0.1);
            }

            .tab-content h3 {
                color: #1e97bf;
                font-size: 20px;
                font-weight: 700;
                text-transform: uppercase;
                margin: 0 0 7px;
            }

            /* Danh sách tab bên phải dưới dạng khung */
            .vertical-tab {
                width: 20%;
                min-width: 20%;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                margin: 15% 20px 0 20px;/* Khoảng cách xung quanh khung */
            }

            .vertical-tab .nav-tabs {
                width: 100%;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                border: 1px solid #ddd; /* Thêm viền chỉ cho phần tab */
                border-radius: 8px; /* Tạo góc bo cho viền tab */
                background-color: #f9f9f9; /* Màu nền cho phần tab */
                padding: 10px; /* Khoảng cách bên trong viền */
            }

            .vertical-tab .nav-tabs li {
                width: 100%;
                margin-bottom: 10px; /* Khoảng cách giữa các tab */
            }

            .vertical-tab .nav-tabs li a {
                color: #222;
                background: transparent;
                font-size: 17px;
                font-weight: 800;
                letter-spacing: 1px;
                text-align: center;
                text-transform: uppercase;
                padding: 12px 15px;
                margin: 0;
                border: none; /* Loại bỏ viền xung quanh từng tab */
                border-radius: 4px; /* Góc bo nhẹ cho từng tab */
                overflow: hidden;
                position: relative;
                z-index: 1;
                transition: all 0.3s ease 0.3s;
            }

            .vertical-tab .nav-tabs li a:hover,
            .vertical-tab .nav-tabs li.active a {
                color: #1e97bf;
                background: rgba(30, 151, 191, 0.1);
            }

            @media only screen and (max-width: 767px) {
                .vertical-tab-container {
                    flex-direction: column;
                }

                .vertical-tab {
                    width: 100%;
                    height: auto;
                    margin: 10px 0; /* Reset khoảng cách trên cho màn hình nhỏ */
                }

                .vertical-tab .nav-tabs {
                    flex-direction: row;
                    justify-content: flex-start;
                    overflow-x: auto;
                    white-space: nowrap;
                }

                .vertical-tab .nav-tabs li {
                    width: auto;
                    flex: 1;
                    margin-bottom: 0; /* Bỏ khoảng cách giữa các tab trên màn hình nhỏ */
                }

                .tab-content {
                    height: auto;
                    border-left: none;
                    border-top: none;
                }
            }

            body {
                background-color: #f8f9fa;
            }

            .container-fluid {
                padding: 2rem 0;
            }

            .tableview {
/*                width: 80%;*/
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

            /* .table-image img {
                max-width: 100px;
            } */

            .table thead th {
                border: none;
                background-color: #007bff;
                color: #fff;
                text-align: center;
            }

            .table tbody tr:hover {
                background-color: #f1f1f1;
            }

            .action-buttons {
                /* display: flex;
                justify-content: center; */
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
            
            .card-body{
                padding: 0 240px;
                width: 100%;
            }
            .form-control {
                padding: 5px;
            }
        </style>
    </head>

    <body>
        <div class="vertical-tab-container">
            <!-- Nội dung tab bên trái -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Section1">


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
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${listM}" var="m">
                                        <tbody id="table-body">
                                            <tr>
                                                <th scope="row">${m.motorcycleId}</th>
                                                <td class="w-25">
                                                    <img src="images/${m.image}"
                                                         class="img-fluid img-thumbnail" alt="Sheep">
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
                                                <td class="action-buttons">
                                                    <div class="buttons">
                                                        <button class="btn btn-primary btn-sm" onclick="editRow(this)">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-danger btn-sm" onclick="deleteRow(this)">
                                                            <i class="fas fa-trash"></i>
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

                    <!-- Add Product -->
                    <section>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-8 ml-auto">
                                    <div
                                        class="row align-items-center">
                                        <div class="col-8">
                                            <div class="card">
                                                <div
                                                    class="card-title text-center mt-3">
                                                    <h3>Thêm xe máy mới</h3>
                                                </div>
                                                <div class="card-body">
                                                    <form action>
                                                        <div class="form-group">
                                                            <label
                                                                for="productname">Product
                                                                Name:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productname"
                                                                   placeholder="Enter Product Name">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                Name Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productprice">Product
                                                                Price:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productprice"
                                                                   placeholder="Enter Product Price">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                Price Can't Be
                                                                Empty</div>

                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <p>Product Image:</p>
                                                        <div
                                                            class="custom-file">

                                                            <input type="file"
                                                                   class="custom-file-input"
                                                                   id="productimage"
                                                                   required>
                                                            <label
                                                                class="custom-file-label"
                                                                for="productimage">Choose
                                                                file...</label>
                                                            <div
                                                                class="invalid-feedback">File
                                                                Format Not
                                                                Supported</div>
                                                        </div>
                                                        <button
                                                            class="btn btn-dark mt-5 mx-auto d-block"
                                                            type="submit">Thêm xe máy</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Section3">
                    <!-- Add Product -->
                    <section>
                        <div class="container-fluid">
                            <div class="row ">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div
                                        class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-10">
                                            <div class="card">
                                                <div
                                                    class="card-title text-center mt-3">
                                                    <h3>Cập nhập xe máy</h3>
                                                </div>
                                                <div class="card-body">
                                                    <form action>
                                                        <div class="form-group">
                                                            <label
                                                                for="productname">Product
                                                                Name:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productname"
                                                                   placeholder="Enter Product Name">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                Name Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productprice">Product
                                                                Price:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productprice"
                                                                   placeholder="Enter Product Price">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                Price Can't Be
                                                                Empty</div>

                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label
                                                                for="productid">Product
                                                                Id:</label>
                                                            <input type="text"
                                                                   class="form-control"
                                                                   id="productid"
                                                                   placeholder="Enter Product Id">
                                                            <div
                                                                class="invalid-feedback">Product
                                                                ID Can't Be
                                                                Empty</div>
                                                        </div>
                                                        <p>Product Image:</p>
                                                        <div
                                                            class="custom-file">

                                                            <input type="file"
                                                                   class="custom-file-input"
                                                                   id="productimage"
                                                                   required>
                                                            <label
                                                                class="custom-file-label"
                                                                for="productimage">Choose
                                                                file...</label>
                                                            <div
                                                                class="invalid-feedback">File
                                                                Format Not
                                                                Supported</div>
                                                        </div>
                                                        <button
                                                            class="btn btn-dark mt-5 mx-auto d-block"
                                                            type="submit">Cập nhập
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>

            </div>

            <!-- Danh sách tab bên phải -->
            <div class="vertical-tab">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#Section1"
                                                              aria-controls="home" role="tab"
                                                              data-toggle="tab">Dislay All Motorbikes</a></li>
                    <li role="presentation"><a href="#Section2"
                                               aria-controls="profile" role="tab"
                                               data-toggle="tab">Add New Motorbike</a></li>
                    <!-- <li role="presentation"><a href="#Section3"
                            aria-controls="messages" role="tab"
                            data-toggle="tab">Update Motorbike</a></li> -->

                </ul>
            </div>
        </div>



        <script>
            function editRow(button) {
                // Lấy hàng chứa nút 'edit' được nhấn
                var row = button.closest('tr');

                // Lấy dữ liệu từ hàng được chọn
                var id = row.cells[0].textContent.trim();
                var imageSrc = row.cells[1].querySelector('img').src;
                var model = row.cells[2].textContent.trim();
                var displacement = row.cells[3].textContent.trim();
                var description = row.cells[4].textContent.trim();
                var minAge = row.cells[5].textContent.trim();
                var brand = row.cells[6].textContent.trim();
                var category = row.cells[7].textContent.trim();
                var price = row.cells[8].textContent.trim();

                // Tạo tab "Update Motorbike" nếu chưa tồn tại
                if (!document.querySelector('#update-tab')) {
                    var updateTab = document.createElement('li');
                    updateTab.setAttribute('role', 'presentation');
                    updateTab.id = 'update-tab';
                    updateTab.innerHTML = '<a href="#Section3" aria-controls="messages" role="tab" data-toggle="tab">Update Motorbike</a>';

                    // Thêm tab "Update Motorbike" vào danh sách tab
                    var tabsList = document.querySelector('.nav-tabs');
                    tabsList.appendChild(updateTab);
                }

                // Chuyển sang tab "Update Motorbike"
                document.querySelector('#update-tab a').click();

                // Điền thông tin vào form "Update Motorbike"
                document.querySelector('#productname').value = model;
                document.querySelector('#productid').value = id;
                document.querySelector('#productprice').value = price;

                // Nếu bạn có thêm các trường khác, hãy điền chúng ở đây
                // Ví dụ:
                // document.querySelector('#displacement').value = displacement;
                // document.querySelector('#description').value = description;
                // document.querySelector('#minage').value = minAge;
                // document.querySelector('#brand').value = brand;
                // document.querySelector('#category').value = category;

                // Đặt hình ảnh (nếu có trường này trong form)
                // document.querySelector('#productimage').src = imageSrc;
            }

            // Hàm xóa tab "Update Motorbike" khi không cần thiết
            function removeUpdateTab() {
                var updateTab = document.querySelector('#update-tab');
                if (updateTab) {
                    updateTab.remove();
                }
            }
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', (event) => {
                // Lấy tất cả các tab trừ tab "Update Motorbike"
                var tabs = document.querySelectorAll('.nav-tabs li:not(#update-tab) a');

                // Thêm sự kiện cho các tab
                tabs.forEach(tab => {
                    tab.addEventListener('click', (e) => {
                        removeUpdateTab();
                    });
                });
            });
        </script>

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

