<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap"
          rel="stylesheet">
    <title>Food Review | Detail Food </title>
    <link rel="stylesheet" type="text/css" href="resources/css/home/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/home/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="resources/css/custom/detail.css">
    <link rel="stylesheet" type="text/css" href="resources/css/custom/star.css">
    <link rel="stylesheet" type="text/css" href="resources/css/home/home.css">
    <link rel="stylesheet" href="resources/css/home/templatemo-klassy-cafe.css">
    <link rel="stylesheet" href="resources/css/home/owl-carousel.css">
    <link rel="stylesheet" href="resources/css/home/lightbox.css">
    <link href="resources/css/home/custom-css.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<!-- ***** Preloader Start ***** -->
<div id="preloader">
    <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<!-- ***** Preloader End ***** -->
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <a href="#" class="logo">
                        <img height="80px" width="120px" src="resources/images/home/logo.png">
                    </a>
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                        <li class="scroll-to-section"><a href="add-topic-reviewer">Topic</a></li>
                        <li class="scroll-to-section"><a href="shop-reviewer">Shop</a></li>
                        <li class="scroll-to-section"><a href="#about">About</a></li>
                        <li class="scroll-to-section"><a href="#menu">Menu</a></li>
                        <li class="scroll-to-section"><a href="#">Contact Us</a></li>
                        <li class="scroll-to-section">
                            <% if (session.getAttribute("account") == null) {%>
                            <a href="login">Login</a>
                            <%
                                }
                                if (session.getAttribute("account") != null) {
                            %>
                            <div class="dropdown">
                                <a onclick="myFunction()" class="dropbtn">${account.name}</a>
                                <div id="myDropdown" class="dropdown-content" style="padding-bottom: 15px">
                                    <a href="#">Profile</a>
                                    <a href="logout">Log out</a>
                                </div>
                            </div>
                            <%}%>
                        </li>
                        <li class="scroll-to-section">
                            <% if (session.getAttribute("account") == null) {%>
                            <a href="register">Sign up</a>
                            <%}%>
                        </li>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->
<!-- ***** Main Banner Area Start ***** -->
<div id="top">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="pro-img-details">
                    <img src="https://png.pngtree.com/png-vector/20190830/ourlarge/pngtree-food-icon-design-vector-png-image_1708316.jpg" alt="" style="width: 500px; height: 370px">
                </div>
                <div class="pro-img-list" style="display: flex;justify-content: center;">
                    <a href="#">
                        <img src="https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png" alt="" style="width: 150px; height: 150px">
                    </a>
                    <a href="#">
                        <img src="https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png" alt="" style="width: 150px; height: 150px">
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <h2 style="color: #fb5849">
                        ${food.foodName}
                </h2>
                <p style="font-size: 20px">
                    ${food.description}
                </p>
            </div>
        </div>
    </div>
</div>

<!-- ***** Main Banner Area End ***** -->

<!-- ***** Footer Start ***** -->
<footer>
    <div class=" container">
        <div class="row">
            <div class="col-lg-4 col-xs-12">
                <div class="right-text-content">
                    <ul class="social-icons">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="logo">
                    <a href="home"><img src="resources/images/home/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-4 col-xs-12">
                <div class="left-text-content">
                    <p>© Copyright Food Review Co.
                    </p>
                </div>
            </div>
        </div>
        <!-- /.Row 1 -->
    </div>
</footer>

<!-- jQuery -->
<script src="resources/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="resources/js/popper.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="resources/js/owl-carousel.js"></script>
<script src="resources/js/accordions.js"></script>
<script src="resources/js/datepicker.js"></script>
<script src="resources/js/scrollreveal.min.js"></script>
<script src="resources/js/waypoints.min.js"></script>
<script src="resources/js/jquery.counterup.min.js"></script>
<script src="resources/js/imgfix.min.js"></script>
<script src="resources/js/slick.js"></script>
<script src="resources/js/lightbox.js"></script>
<script src="resources/js/isotope.js"></script>
<!-- Global Init -->
<script src="resources/js/custom.js"></script>
</body>
</html>
