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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <title>Food Review | List Food </title>
    <link rel="stylesheet" type="text/css" href="resources/css/home/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/home/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="resources/css/home/home.css">
    <link rel="stylesheet" href="resources/css/home/templatemo-klassy-cafe.css">
    <link rel="stylesheet" href="resources/css/home/owl-carousel.css">
    <link rel="stylesheet" href="resources/css/home/lightbox.css">
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
<header class="header-area header-sticky" style="box-shadow: 0 0 10px rgba(0, 0, 0, .15) !important;">
    <div class="container">
        <section class='tabs-content'>
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <a href="#" class="logo">
                            <img height="80px" width="120px" src="resources/images/home/logo.png">
                        </a>
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="home">Home</a></li>
                            <li class="scroll-to-section"><a href="add-topic-reviewer">Topic</a></li>
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
        </section>
    </div>
</header>
<!-- ***** Header Area End ***** -->
<!-- ***** Main Banner Area Start ***** -->
<div id="top">
    <div class="container">
        <h3 style="margin-left: -40px; margin-top: 15px; color: #fb5849!important;"><a
                style="cursor: pointer; color: #fb5849!important;"
                href="shop?shopId=1">Shop 1</a>
            <span>/ List foods</span></h3>
        <c:forEach begin="0" end="3">
            <div class="row" style="margin-top: 20px; margin-left: 10px">
                <div class="col-lg-6">
                    <div class="row">
                        <div class="left-list">
                            <div class="col-lg-12 foodBox moreBox">
                                <div class="tab-item">
                                    <a href="detail-food?foodId=${food.id}">
                                        <img src="https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png"
                                             alt="" style="width: 150px; height: 150px"><br>
                                        <span style="color: #fb5849; font-size: 26px; font-weight: bold;">Fresh Chicken Salad</span>
                                    </a>
                                    <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                        sed do.</p>
                                    <div class="price">
                                        <h6 style="color: #fb5849">10 <i class="far fa-heart"></i></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <div class="right-list">
                            <div class="col-lg-12">
                                <div class="tab-item foodBox moreBox">
                                    <a href="detail-food?foodId=${food.id}">
                                        <img src="https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png"
                                             alt="" style="width: 150px; height: 150px"><br>
                                        <span style="color: #fb5849; font-size: 26px; font-weight: bold;">Eggs Omelette</span>
                                    </a>
                                    <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                        sed do.</p>
                                    <div class="price">
                                        <h6 style="color: #fb5849">10 <i class="far fa-heart"></i></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div id="loadMore" style="text-align: center; margin: 30px;">
            <a href="#"
               style="padding: 10px; border-radius: 3px; color: #fff!important; background-color: #ec7211; border-color: #ec7211;">Load
                More</a>
        </div>
    </div>
</div>
<!-- ***** Main Banner Area End ***** -->

<!-- ***** Footer Start ***** -->
<footer>
    <div class="container">
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
<script>
    $(document).ready(function () {
        $(".moreBox").slice(0, 3).show();
        if ($(".foodBox:hidden").length != 0) {
            $("#loadMore").show();
        }
        $("#loadMore").on('click', function (e) {
            e.preventDefault();
            $(".moreBox:hidden").slice(0, 6).slideDown();
            if ($(".moreBox:hidden").length == 0) {
                $("#loadMore").fadeOut('slow');
            }
        });
    });
</script>
</body>
</html>
