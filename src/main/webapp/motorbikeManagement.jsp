<%-- 
    Document   : motorbikeManagement
    Created on : Jun 12, 2024, 7:51:37 PM
    Author     : DiepTCNN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Property Table</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">


        <style>
            body {
                background-color: #f8f9fa;
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
        </style>
    </head>

    <body>
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

        <script>
            function editRow(button) {
                let row = button.closest('tr');
                let cells = row.querySelectorAll('td:not(.action-buttons)');
                cells.forEach(cell => {
                    let input = document.createElement('input');
                    input.value = cell.innerText.trim();
                    input.classList.add('form-control');
                    cell.innerHTML = '';
                    cell.appendChild(input);
                });
                button.innerHTML = '<i class="fas fa-save"></i>';
                button.classList.remove('btn-primary');
                button.classList.add('btn-success');
                button.onclick = () => saveRow(button);
            }

            function saveRow(button) {
                let row = button.closest('tr');
                let inputs = row.querySelectorAll('td:not(.action-buttons) input');
                inputs.forEach(input => {
                    let cell = input.closest('td');
                    cell.innerHTML = input.value;
                });
                button.innerHTML = '<i class="fas fa-edit"></i>';
                button.classList.remove('btn-success');
                button.classList.add('btn-primary');
                button.onclick = () => editRow(button);
            }

            function deleteRow(button) {
                let row = button.closest('tr');
                row.remove();
            }
        </script>

        <!-- jQuery -->
        <script src="js/jsstaff/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/jsstaff/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/jsstaff/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="js/jsstaff/raphael.min.js"></script>
        <script src="js/jsstaff/morris.min.js"></script>
        <script src="js/jsstaff/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/jsstaff/startmin.js"></script>
    </body>

</html>
