<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>Food Review | Shop </title>
    <link rel="stylesheet" type="text/css" href="resources/css/home/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/home/font-awesome.css">
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
                    <a href="home" class="logo">
                        <img height="80px" width="120px" src="resources/images/home/logo.png">
                    </a>
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="home" class="active">Home</a></li>
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
        <form action="shop-reviewer">
            <div class="row" style="padding-left:13px;">
                <div class="col-md-3" style="padding: 0px;margin: 0px;">
                    <div class="form-group">
                        <input id="shopName" name="shopName" type="text" class="form-control" placeholder="Shop Name"
                               value="${sessionScope.shopName}">
                    </div>
                </div>
                <div class="col-md-2">
                    <button type="submit"
                            style="background-color: transparent;border-color: transparent;">
                        <img src="resources/images/search.png" alt="Search"></button>
                </div>
            </div>
        </form>

        <div class="row">
            <c:forEach items="${listShopInAPage}" var="shop" varStatus="i">
                <div class="col-md-3 col-sm-6" style="margin-bottom: 10px;">
                    <div class="product-grid">
                        <div class="product-image">
                            <a href="detail-shop?id=${shop.shopId}">
                                <img class="pic-1" src="resources/images/users/hangnt.png">
                                <img class="pic-2" src="resources/images/users/hangnt1.png">
                            </a>
                        </div>
                            <%--                        <ul class="rating">--%>
                            <%--                            <c:set var="rateShops" scope="page" value="${shop.rate}"/>--%>
                            <%--                            <%--%>
                            <%--                                List<Integer> listRates = new ArrayList<>();--%>
                            <%--                                int rate = (int) pageContext.getAttribute("rateShops");--%>
                            <%--                                for (int i = 0; i < rate; i++) {--%>
                            <%--                                    listRates.add(i + 1);--%>
                            <%--                                }--%>
                            <%--                                pageContext.setAttribute("listRates", listRates);--%>
                            <%--                            %>--%>
                            <%--                            <c:forEach items="${listRates}" var="rate">--%>
                            <%--                                <li class="fa fa-star"></li>--%>
                            <%--                            </c:forEach>--%>
                            <%--                        </ul>--%>
                        <div class="product-content">
                            <h3 class="title"><a href="#">${shop.shopName}</a></h3>
                        </div>
                    </div>
                </div>
                <br/>
            </c:forEach>
        </div>
        <ul class="pagination" style="justify-content: center;">
            <c:forEach items="${listPage}" var="page">
                <li class="page-item"><a class="page-link"
                                         href="shop-reviewer?pageId=${page}&shopName=${sessionScope.shopName}">${page}</a>
                </li>
            </c:forEach>
        </ul>
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
