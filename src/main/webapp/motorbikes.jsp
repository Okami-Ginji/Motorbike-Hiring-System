<%-- 
    Document   : motorbikes
    Created on : May 25, 2024, 5:01:05 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="website icon" type="png" href="images\logo.png">
        <jsp:include page="/includes/header2.jsp" />
        <!-- thanh search -->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Righteous&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Lato:wght@300&display=swap');

            .filter-module {

                background: #EFFAF4;
                /*                margin: 20px auto;*/
                padding-bottom: 10px;
                margin: 5% 0 0 5%;
                box-sizing: border-box;
                box-shadow: 11px 10px 8px rgba(0, 0, 0, 0.1);
                border: 1px solid rgb(2, 184, 175);
                border-radius: 16px;
                padding-top: 3%;
                padding-left: 5%;
                width: 90%;
                
            }
            .xemketqua{
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%) !important;
                color: white !important;
            }
            .xemketqua:hover{
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%) !important;
                color: white !important;
            }


            .filter-container {
                display: flex;
                flex-wrap: wrap;
            }

            .filter-group {
                margin-bottom: 35px;
                position: relative;
                margin-right: 30px;
            }

            .filter-button {
                padding: 10px 20px;
                border: 1px solid rgb(2, 184, 175);
                font-weight: bold;
                background:#fff;
                color: #001973;
                cursor: pointer;
                border-radius: 5px;
                /* transition: background-color 0.5s, box-shadow 0.3s; */
            }

            .filter-button:hover {
                color: #fff;
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%);
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.5s, box-shadow 0.3s;
            }

            .filter-options {
                color: #001973;
                margin-top: 10px;
                position: absolute;
                z-index: 1;
                background-color: #fff;
                border: 1px solid #eee;
                border-radius: 8px;
                box-shadow: 0 2px 20px rgba(0, 0, 0, .5);
                background-color: #fff;
                opacity: 0;
                padding: 20px 20px;
                transition: .5s;
                width: 380px;
                display: none;
                text-align: center;
            }

            .filter-options button {
                padding: 12px;
                border: 1px solid #ddd;
                background: radial-gradient(circle at 10% 20%, rgba(216, 241, 230, 0.46) 0.1%, rgba(233, 226, 226, 0.28) 90.1%);
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s, box-shadow 0.3s;
                color: #001973;
            }
            

            .filter-options:after {
                border-bottom: 10px solid #fff;
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                content: "";
                left: 30px;
                position: absolute;
                top: -10px;
            }
            


            .filter-options button:hover {
                background-color: #e2e6ea;
            }

            .filter-options button.selected {
                background: linear-gradient#01D28E;
                color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }


            .show-options {
                display: block;
                opacity: 1;
                z-index: 100;
            }

            .filter-group .filter-button:after {
                content: ' ▼';
            }
            .filter-group .filter-button.open:after {
                content: ' ▲';
            }
            .selected-filters {
                margin-top: 20px;
            }

            .selected-filter {
                display: inline-block;
                padding: 5px 10px;
                margin: 5px;
                border: 1px solid #dc3545;
                background-color: #f1f1f1;
                color: #dc3545;
                border-radius: 5px;
                cursor: pointer;
            }


            .selected-filter:hover {
                background-color: #f5c6cb;
            }

            .filter-search {
                margin-top: 3px;
            }

            .filter-search input {
                border: 1px solid rgb(2, 184, 175);
            }

            .filter-search button:hover {
                opacity: 0.8;
            }

            .button-item-option {
                margin-bottom: 12px;
                margin-right: 12px;
                width: 40%;
            }
            /* Reset some basic styles for the pagination list */
            .pagination {
                display: flex;
                justify-content: center;
                display: inline-flex;
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            .page-item {
                margin: 0 5px;
            }

            .page-link {
                display: block;
                padding: 8px 16px;
                color: #007bff;
                text-decoration: none;
                border: 1px solid #dee2e6;
                border-radius: 4px;
                transition: background-color 0.3s, color 0.3s;
            }

            .page-link:hover {
                background-color: #007bff;
                color: white;
            }

            .page-item.active .page-link {
                background-color: #007bff;
                color: white;
                border-color: #007bff;
            }

            .page-item.disabled .page-link {
                color: #6c757d;
                pointer-events: none;
                cursor: not-allowed;
                background-color: #e9ecef;
                border-color: #dee2e6;
            }

            .container-haha {
                border-radius: 12px;
                border: 1px solid rgba(255, 255, 255, 0.125);
                padding: 38px;
                filter: drop-shadow(0 5px 10px rgba(0,0,0,0.125));
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content:center;
                text-align: center;

            }

            .wrapper {
                width: 100%;
                height: 100%;
                justify-content: center;

            }

            .banner-image {
                background-position: center;
                background-size: cover;
                height: 300px;
                width: 100%;
                border-radius: 12px;
                /*border: 1px solid rgba(255,255,255, 0.255);*/
                background-color: white;
            }
            .banner-image img {
                object-fit: contain;
            }

            h1{
                font-family: 'Righteous', sans-serif;
                color: rgba(255,255,255,0.98);
                text-transform: uppercase;
                font-size: 2.4rem;
            }

            p {
                color: #001973;
                font-family: 'Lato', sans-serif;
                text-align: center;
                font-size: 0.8rem;
                line-height: 150%;
                letter-spacing: 2px;
                text-transform: uppercase;
            }

            .button-wrapper{
                margin-top: 18px;
            }

            .btn {
                border: none;
                padding: 12px 24px;
                border-radius: 24px;
                font-size: 12px;
                font-size: 0.8rem;
                letter-spacing: 2px;
                cursor: pointer;
            }

            .btn + .btn {
                margin-left: 10px;
            }

            .outline-huhu {
                background: transparent;
                color: rgba(0, 212, 255, 0.9);
                border: 1px solid #001973;
                transition: all .3s ease;
            }

            .outline-huhu:hover{
                transform: scale(1.125);
                color: #001973;
                transition: all .3s ease;
            }

            .outline-huhu a:hover {
                transform: scale(1.125);
                border: 1px solid #001973;
                color: #001973;
                font-weight: 600;
            }

            .outline-huhu a {
                padding: 12px 12px;
                border-radius: var(--bs-border-radius);
                transform: scale(1.125);
            }



            .fill {
                background: rgba(0, 212, 255, 0.9);
                color: rgba(255,255,255,0.95);
                filter: drop-shadow(0);
                font-weight: bold;
                transition: all .3s ease;
            }

            .fill:hover{
                transform: scale(1.125);
                filter: drop-shadow(0 10px 5px rgba(0,0,0,0.125));
                transition: all .3s ease;
                border: 1px solid #fff;
                color: #fff;
            }


            .fill a:hover {
                transform: scale(1.125);
                border: 1px solid #fff;
                color: #fff;
                font-weight: 600;
            }

            .fill a {
                padding: 16px 12px;
                border-radius: var(--bs-border-radius);
                transform: scale(1.125);
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                color: #fff;
            }

            .box {
                /*-webkit-backdrop-filter: blur(16px) saturate(180%);*/
                box-shadow: 0 2px 10px rgb(185, 209, 234);
                border-radius: 12px;
                border: 1px solid rgb(2, 184, 175);
                padding: 38px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content:center;
                text-align: center;
                margin: 40px 40px;
            }



            .list h1{
                margin: 5% 0 3% 0;
            }
        </style>
    </head>

    <body>
        <jsp:include page="/includes/navbar2.jsp" />
        <div style="margin-top: 3%;">

            <!-- thanh search -->
            <section>
                <div class="filter-module">
                    <div class="filter-container" style="display: flex; justify-content: space-between">
                        <div style="display: flex">
                            <div class="filter-group">

                                <button class="filter-button price" onclick="toggleOptions('priceOptions')">Giá</button>
                                <div class="filter-options" id="priceOptions">
                                    <c:forEach items="${listPriceRange}" var="o">
                                        <input hidden name="priceRanges" value="${o.minPrice},${o.maxPrice}"/>
                                        <button data-id="${o.minPrice},${o.maxPrice}" class="button-item-option" onclick="toggleSelection(this)">
                                            <c:if test="${o.minPrice == 0}">
                                                Dưới <fmt:formatNumber value="${o.maxPrice}" pattern="#,##0.000"/>VNĐ/day
                                            </c:if>
                                            <c:if test="${o.minPrice != 0 && o.maxPrice != 0}">
                                                <fmt:formatNumber value="${o.minPrice}" pattern="#,##0.000"/> - <fmt:formatNumber value="${o.maxPrice}" pattern="#,##0.000"/>VNĐ/day
                                            </c:if>

                                            <c:if test="${o.maxPrice == 0}">
                                                <fmt:formatNumber value="${o.minPrice}" pattern="#,##0.000"/>VNĐ/day trở lên
                                            </c:if>
                                        </button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('priceOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>
                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('brandOptions')">Hãng</button>
                                <div class="filter-options" id="brandOptions">
                                    <c:forEach items="${listBrand}" var="o">
                                        <input hidden name="brands" value="${o.brandID}" id="searchBrand">
                                        <button class="button-item-option" data-id="${o.brandID}" 
                                                onclick="toggleSelection(this)">${o.brandName}</button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('brandOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('categoryOptions')">Loại</button>
                                <div class="filter-options" id="categoryOptions">
                                    <c:forEach items="${categories}" var="o">
                                        <input hidden name="categories" value="${o.categoryID}" id="searchCategory">
                                        <button class="button-item-option"  data-id="${o.categoryID}" 
                                                onclick="toggleSelection(this)">${o.categoryName}</button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('categoryOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('massOptions')">Phân khối</button>
                                <div class="filter-options" id="massOptions">
                                    <c:forEach items="${listDisplacement}" var="o">
                                        <input hidden name="displacements" value="${o}" id="searchDisplacement">
                                        <button class="button-item-option" data-id="${o}" 
                                                onclick="toggleSelection(this)">${o}</button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('massOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('needOptions')">Nhu cầu</button>
                                <div class="filter-options" id="needOptions">
                                    <c:forEach items="${listDemand}" var="o">
                                        <input hidden name="demands" value="${o.demandId}" id="searchDemand">
                                        <button class="button-item-option" data-id="${o.demandId}" onclick="toggleSelection(this)">${o.demand}</button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('needOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button class="filter-button xemketqua" onclick="showResults()">Xem kết quả</button>
                            </div>
                        </div>

                        <div class="filter-search filter-group">
                            <form action="searchMotorcycle" method="post" class="d-flex" style="width: 110%; padding-right: 10%;">
                                <input value="" name="textSearch" class="form-control me-2" type="search" placeholder="Name" aria-label="Search">
                                <button class="btn xemketqua" style="color: white; font-weight: bold; border: 1px solid #00ff6f;" type="submit">Search</button>
                            </form>
                        </div>

                    </div>

                    <div class="selected-filters" id="selectedFilters">
                        <!-- Selected filters will be displayed here -->
                    </div>
                </div>
                <div class="list">
                    <h1 class="animate__animated animate__backInDown" style="text-align: center; font-weight: bold; ">Danh Sách Xe Máy</h1>
                    <div class="container-haha animate__animated animate__zoomIn">
                        <div class="wrapper row">
                            <c:if test="${not empty noResults}">
                                <div class="text-center no-results-message">
                                    Không có mẫu xe nào phù hợp với tìm kiếm của bạn.
                                </div>
                            </c:if>

                            <c:forEach var="motorbike" items="${motorcycles}">
                                <div class="box col-md-3">
                                    <div class="banner-image">
                                        <img src="images/${motorbike.image}" width="100%" height="100%" alt="alt"/>
                                    </div>
                                    <h2 style="margin: 16px;" href="motorcycleDetail?id=${motorbike.motorcycleId}"><strong>${motorbike.model}</strong></h2>
                                    <p style="font-weight: bold;">${categoryMap[motorbike.categoryID]}<br/>${priceMap[motorbike.priceListID]}/ngày</p>
                                    <div class="button-wrapper">
                                        <button class="btn outline-huhu"><a href="motorcycleDetail?id=${motorbike.motorcycleId}">DETAILS</a></button>
                                        <button class="btn fill"><a href="booking?motorcycleid=${motorbike.motorcycleId}">BUY NOW</a></button>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="row mt-5">
                                <div class="col text-center">
                                    <div class="block-27">
                                        <ul class="pagination">
                                            <c:forEach begin="1" end="${endP}" var="i">
                                                <li class="page-item ${currentIndex == i ? 'active' : ''}">
                                                    <a class="page-link" href="motorcycle?index=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section> 

        </div>

    </div>
    <jsp:include page="/includes/footer.jsp" />



    <!-- loader -->
    


    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-migrate-3.0.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.timepicker.min.js"></script>
    <script src="js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="js/google-map.js"></script>
    <script src="js/main.js"></script>
    <script>
                                    function toggleOptions(id) {
                                        var options = document.getElementById(id);
                                        var button = options.previousElementSibling;
                                        if (currentOpenOptions && currentOpenOptions !== options) {
                                            currentOpenOptions.classList.remove('show-options');
                                            currentOpenOptions.previousElementSibling.classList.remove('open');
                                        }

                                        options.classList.toggle('show-options');
                                        button.classList.toggle('open');
                                        currentOpenOptions = options.classList.contains('show-options') ? options : null;
                                    }

                                    function closeOptions(id) {
                                        var options = document.getElementById(id);
                                        options.classList.remove('show-options');
                                    }

                                    function toggleSelection(button) {
                                        button.classList.toggle('selected');
                                        updateSelectedFilters();
                                    }

                                    function updateSelectedFilters() {
                                        var selectedButtons = document.querySelectorAll('.filter-options button.selected');
                                        var selectedFilters = Array.from(selectedButtons).map(function (button) {
                                            return {
                                                text: button.textContent,
                                                group: button.closest('.filter-group').querySelector('.filter-button').textContent.trim()
                                            };
                                        });
                                        var selectedFiltersContainer = document.getElementById('selectedFilters');
                                        selectedFiltersContainer.innerHTML = '';
                                        if (selectedFilters.length > 0) {
                                            var header = document.createElement('h2');
                                            header.textContent = 'Đang lọc theo';
                                            selectedFiltersContainer.appendChild(header);

                                            var clearAllButton = document.createElement('div');
                                            clearAllButton.className = 'selected-filter';
                                            clearAllButton.innerHTML = '<span>× Bỏ chọn tất cả</span>';
                                            clearAllButton.onclick = clearAllSelections;
                                            selectedFiltersContainer.appendChild(clearAllButton)
                                        }
                                        selectedFilters.forEach(function (filter) {
                                            var filterDiv = document.createElement('div');
                                            filterDiv.className = 'selected-filter';
                                            filterDiv.innerHTML = '<span>' + filter.group + ': ' + filter.text + '</span><span class="remove-filter" onclick="removeSelectedFilter(this.parentElement, \'' + filter.text + '\')">&#10006;</span>';
                                            selectedFiltersContainer.appendChild(filterDiv);
                                        });
                                    }

                                    function removeSelectedFilter(filterDiv, text) {
                                        var filterOptionButtons = document.querySelectorAll('.filter-options button');
                                        filterOptionButtons.forEach(function (button) {
                                            if (button.textContent === text) {
                                                button.classList.remove('selected');
                                            }
                                        });
                                        filterDiv.remove();
                                        updateSelectedFilters();
                                    }

                                    function clearAllSelections() {
                                        var selectedButtons = document.querySelectorAll('.filter-options button.selected');
                                        selectedButtons.forEach(function (button) {
                                            button.classList.remove('selected');
                                        });
                                        updateSelectedFilters();
                                    }
                                    var currentOpenOptions = null;


                                    function showResults() {
                                        var selectedBrands = [];
                                        var selectedCategories = [];
                                        var selectedDisplacements = [];
                                        var selectedDemands = [];
                                        var selectedPriceRanges = [];

                                        var selectedPriceButton = document.querySelectorAll('#priceOptions .button-item-option.selected');
                                        selectedPriceButton.forEach(function (button) {
                                            var priceRange = button.getAttribute('data-id');
                                            if (priceRange) {
                                                selectedPriceRanges.push(priceRange);
                                            }
                                        });

                                        var selectedBrandButtons = document.querySelectorAll('#brandOptions .button-item-option.selected');
                                        selectedBrandButtons.forEach(function (button) {
                                            var brandID = button.getAttribute('data-id');
                                            if (brandID) {
                                                selectedBrands.push(brandID);
                                            }
                                        });

                                        var selectedCategoryButtons = document.querySelectorAll('#categoryOptions .button-item-option.selected');
                                        selectedCategoryButtons.forEach(function (button) {
                                            var categoryID = button.getAttribute('data-id');
                                            if (categoryID) {
                                                selectedCategories.push(categoryID);
                                            }
                                        });

                                        var selectedDisplacementButtons = document.querySelectorAll('#massOptions .button-item-option.selected');
                                        selectedDisplacementButtons.forEach(function (button) {
                                            var displacement = button.getAttribute('data-id');
                                            if (displacement) {
                                                selectedDisplacements.push(displacement);
                                            }
                                        });

                                        var selectedDemandButtons = document.querySelectorAll('#needOptions .button-item-option.selected');
                                        selectedDemandButtons.forEach(function (button) {
                                            var demandID = button.getAttribute('data-id');
                                            if (demandID) {
                                                selectedDemands.push(demandID);
                                            }
                                        });

                                        var url = 'searchCriteria?';
                                        if (selectedBrands.length > 0) {
                                            url += 'brands=' + selectedBrands.join('&brands=') + '&';
                                        }
                                        if (selectedCategories.length > 0) {
                                            url += 'categories=' + selectedCategories.join('&categories=') + '&';
                                        }
                                        if (selectedDisplacements.length > 0) {
                                            url += 'displacements=' + selectedDisplacements.join('&displacements=') + '&';
                                        }
                                        if (selectedDemands.length > 0) {
                                            url += 'demands=' + selectedDemands.join('&demands=') + '&';
                                        }
                                        if (selectedPriceRanges.length > 0) {
                                            url += 'priceRanges=' + selectedPriceRanges.join('&priceRanges=') + '&';
                                        }

                                        // Remove the trailing '&'
                                        url = url.slice(0, -1);

                                        window.location.href = url;
                                    }
    </script>
</body>
</html>
