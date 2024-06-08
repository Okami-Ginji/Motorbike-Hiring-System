<%-- 
    Document   : navbar
    Created on : May 25, 2024, 5:15:55?PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/includes/header.jsp" />
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a style="font-size: 40px;" class="navbar-brand" href="index.jsp">Color<span>Bike</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a style="font-size: larger;" href="index.jsp" class="nav-link">Home</a></li>
                <li class="nav-item"><a style="font-size: larger;" href="about.jsp" class="nav-link">About</a></li>
                <li class="nav-item"><a style="font-size: larger;" href="policies.jsp" class="nav-link">Policies&Terms</a>
                </li>
                <li class="nav-item"><a style="font-size: larger;" href="pricing.jsp" class="nav-link">Pricing</a></li>
                <li class="nav-item"><a style="font-size: larger;" href="motorbikes.jsp" class="nav-link">Motorbikes</a></li>
                <li class="nav-item"><a style="font-size: larger;" href="event" class="nav-link">Events</a></li>
                <li class="nav-item"><a style="font-size: larger;" href="contact.jsp" class="nav-link">Contact</a></li>
                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item"><a style="font-size: larger;" href="login.jsp" class="nav-link">Login</a></li>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <div class="dropdown">
                        <a class="nav-item btn btn-outline-primary dropdown-toggle nav-link" href="#" role="button"
                           id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Hello ${sessionScope.account.email}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" id="myDropdown">
                            <a class="dropdown-item" href="logout">Logout</a>
                            <a class="dropdown-item" href="profileCustomer.jsp">Profile Information</a>
                        </div>
                    </div>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var dropdownMenu = document.getElementById('myDropdown');
        window.addEventListener('click', function (event) {
            if (dropdownMenu && !dropdownMenu.contains(event.target)) {
                dropdownMenu.classList.remove('show');
            }
        });
    });
</script>

<style>
    .dropdown {
        margin-top: 12px;
        color: white;
    }
    .dropdown-menu {
        background-color: #fff; 
        border: 1px solid #ddd; 
        border-radius: 5px;
        padding: 10px; 
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    }
    .dropdown-item {
        color: #333; 
        font-size: 14px;
    }
    .dropdown-item:hover {
        background-color: #f5f5f5; 
    }
    .dropdown:hover .dropdown-menu {
        display: block;
    }
    .dropdown-toggle {
        color: #007bff; 
        font-weight: bold; 
    }
    .dropdown-toggle:hover {
        text-decoration: underline; 
    }
</style>

