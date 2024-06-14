<%-- 
    Document   : sidebar
    Created on : Jun 12, 2024, 2:18:03 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    /* General Styles */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f8f8; /* Updated background color */
        margin: 0;
        padding: 0;
    }

    /* Sidebar Styles */
    .sidebar {
        background-color: #fff;
        color: #337ab7; /* Updated text color */
        height: 100%;
        position: fixed;
        width: 250px;
        overflow-y: auto;
        padding-top: 20px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        transition: width 0.3s;
    }

    .sidebar:hover {
        width: 280px;
    }

    .sidebar ul {
        list-style: none;
        padding-left: 0;
    }

    .sidebar ul li {
        background-color: #f8f8f8; /* Updated background color */
        margin-bottom: 5px;
        border-radius: 3px;
        overflow: hidden;
    }

    .sidebar ul li a {
        display: block;
        color: inherit;
        padding: 12px 20px;
        text-decoration: none;
        transition: background-color 0.3s;
    }

    .sidebar ul li a:hover {
        background-color: #e0e0e0; /* Updated hover background color */
    }

    .sidebar ul li ul {
        display: none;
        padding-left: 20px;
    }

    .sidebar ul li ul li a {
        padding: 10px 20px;
    }

    /* Active Link */
    .active {
        background-color: #e0e0e0; /* Updated active background color */
    }

    /* Arrow Icon */
    .fa.arrow:before {
        content: "\f105";
        float: right;
        margin-right: 5px;
        transition: transform 0.3s;
    }

    .fa.arrow.collapsed:before {
        transform: rotate(-90deg);
    }

    /* Sidebar Header */
    .sidebar-header {
        padding: 20px 20px;
        text-align: center;
        border-bottom: 1px solid #e0e0e0; /* Updated border color */
        background-color: #fff; /* Updated background color */
    }

    .sidebar-header h3 {
        margin-bottom: 0;
    }

    /* Sidebar Footer */
    .sidebar-footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        text-align: center;
        padding: 15px 0;
        border-top: 1px solid #e0e0e0; /* Updated border color */
        background-color: #fff; /* Updated background color */
    }

    .sidebar-footer p {
        margin-bottom: 0;
    }

    /* Xóa màu cho thanh cuộn */
    .sidebar {
        scrollbar-width: thin;
        scrollbar-color: transparent transparent; /* Màu thanh cuộn (thumb và track) */
    }

    /* Thanh cuộn trên Chrome, Safari */
    .sidebar::-webkit-scrollbar {
        width: 8px; /* Độ rộng của thanh cuộn */
    }

    .sidebar::-webkit-scrollbar-thumb {
        background-color: transparent; /* Màu của thanh cuộn */
    }

</style>
<!-- Sidebar -->
<aside class="sidebar">
    <!-- Sidebar Header -->
    <div class="sidebar-header" style="background-color: white; color: #fff;">
        <img src="images\logo.png" alt="Company Logo" style="max-width: 150px; height: auto;margin-bottom: 8%;">
        <!--<h3 style="margin-bottom: 0; font-size: 24px;">ColorBike Company</h3>-->
    </div>



    <!-- Sidebar Menu -->
    <ul>
        <li>
            <a href="homeStaff.jsp" class="active"><i class="fa fa-home fa-fw"></i>Home Page</a>
        </li>
        <li>
            <a href="manageCustomer.jsp"><i class="fa fa-dashboard fa-fw"></i>Customer Profile</a>
        </li>
        <li>
            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Motorbikes <i class="fa arrow"></i></a>
            <ul>
                <li><a href="motorManage.jsp">Motorbikes Information</a></li>
                <li><a href="#">Booking Management</a></li>
                <li><a href="transaction.jsp">History Transaction</a></li>
            </ul>
        </li>
        <li>
            <a href="#"><i class="fa fa-wrench fa-fw"></i> Services <i class="fa arrow"></i></a>
            <ul>
                <li><a href="panels-wells.html">Customer Support</a></li>
                <li><a href="buttons.html">View Feedback</a></li>
                <li><a href="faqs">FAQs Management</a></li>
                <li><a href="#">Event Management</a></li>
                <li><a href="#">Tourism Location Management</a></li>
                <li><a href="#">Accessories Management</a></li>
            </ul>
        </li>
        <li>
            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown <i class="fa arrow"></i></a>
            <ul>
                <li><a href="#">Second Level Item</a></li>
                <li><a href="#">Second Level Item</a></li>
                <li>
                    <a href="#">Third Level <i class="fa arrow"></i></a>
                    <ul>
                        <li><a href="#">Third Level Item</a></li>
                        <li><a href="#">Third Level Item</a></li>
                        <li><a href="#">Third Level Item</a></li>
                        <li><a href="#">Third Level Item</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>
            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages <i class="fa arrow"></i></a>
            <ul>
                <li><a href="blank.html">Blank Page</a></li>
                <li><a href="login.html">Login Page</a></li>
            </ul>
        </li>
    </ul>

    <!-- Sidebar Footer -->
    <div class="sidebar-footer">
        <p>&copy; 2024 My Company</p>
    </div>
</aside>
<!-- /.sidebar -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        // Toggle submenus
        $('.sidebar ul li').click(function () {
            $(this).children('ul').slideToggle();
            $(this).find('.arrow').toggleClass('collapsed');
        });

        // Smooth scroll
        $('.sidebar ul li a').click(function (e) {
//            e.preventDefault();
            var target = $(this).attr('href');
            $('html, body').animate({
                scrollTop: $(target).offset().top
            }, 800);
        });
    });
    
    
    
</script>