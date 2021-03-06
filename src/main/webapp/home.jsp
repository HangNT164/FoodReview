<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>Food Review - Restaurant </title>
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
                        <li class="scroll-to-section"><a href="list-topic-approved">Topic</a></li>
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
                                    <a href="account.jsp">Profile</a>
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
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4">
                <div class="left-content">
                    <div class="inner-content">
                        <h4 class="font-family: 'Dancing Script', cursive;
    font-size: 54px;
    font-weight: 700;">Food Review</h4>
                        <h6 class="font-size: 15px;
    text-transform: uppercase;
    font-weight: 600;
    color: #d63384 !important;
    letter-spacing: 3px;
    margin-top: 5px;">THE BEST EXPERIENCE</h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="main-banner header-text">
                    <div class="Modern-Slider">
                        <!-- Item -->
                        <c:forEach items="${listShop}" var="ls">
                            <div class="item">
                                <div class="img-fill">
                                    <img src="server/uploads/${ls.img}" alt="">
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ***** Main Banner Area End ***** -->

<!-- ***** About Area Starts ***** -->
<section class="section" id="about">
    <div class="container">
        <div class="row">
            <div class="col-5">
                <div class="left-text-content">
                    <div class="section-heading">
                        <h6>New Post</h6>
                        <form id="linkForm" action="topic-detail?topicId=${top1.topicId}" method="post">
                            <a href="javascript:{}" onclick="document.getElementById('linkForm').submit();"
                               style="font-family: none;"><h1 style="color:black;">${top1.title}</h1></a>
                        </form>
                    </div>
                    <span><b>Author:</b> ${top1.accountName} | <fmt:formatDate pattern="dd/MM/yyyy"
                                                                               value="${top1.createdDate}"/>. </span>

                    <br>
                    <br>
                    <h5 style="white-space: pre-line; font-weight:normal;">${top1.content}
                        <br>

                </div>
            </div>
            <div class="col-7">
                <img src="server/uploads/${top1.img}" height="400px" alt=""/>
            </div>
        </div>
    </div>
</section>
<!-- ***** About Area Ends ***** -->

<!-- ***** Menu Area Starts ***** -->
<section class="section" id="menu">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="section-heading">
                    <h6>All Post</h6>
                    <h2 style="font-family: none;">C??ng kh??m ph?? v?? v??n nh???ng b??i vi???t c???a ch??ng t??i.
                        <a href="list-topic-approved" style="font-family: none;">Xem th??m >></a>
                    </h2>
                </div>
            </div>
        </div>
    </div>

    <div class="menu-item-carousel">
        <div class="col-lg-12">
            <div class="owl-menu-item owl-carousel">
                <c:forEach items="${topicList}" var="l">
                    <div class="item">
                        <div class='card' style="background-image: url('server/uploads/${l.img}')">

                            <div class='info'>
                                <h1 class='title'>
                                    <form id="linkForm${l.topicId}" action="topic-detail?topicId=${l.topicId}"
                                          method="post">
                                        <a href="javascript:{}"
                                           onclick="document.getElementById('linkForm${l.topicId}').submit();"
                                           style="font-family: none; color:black;"><h2>${l.title}</h2></a>
                                    </form>
                                </h1>
                                <p class="description"
                                   style="overflow: hidden; text-overflow: ellipsis;-webkit-line-clamp: 2; ">${l.content}</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="#">More.. <i
                                            class="fa fa-angle-down"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>

</section>
<!-- ***** Menu Area Ends ***** -->

<!-- ***** Chefs Area Starts ***** -->
<section class="section" id="chefs">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 offset-lg-4 text-center">
                <div class="section-heading">
                    <h6>All Shop</h6>
                    <h2 style="font-family: none;">Nh???ng c???a h??ng n???i b???t</h2>
                </div>
            </div>
        </div>
        <div class="row">

            <c:forEach items="${listShop}" var="l">
                <div class="col-lg-4">
                    <div class="chef-item">
                        <div class="thumb">
                            <div class="overlay"></div>
                            <img src="server/uploads/${l.img}" alt="">
                        </div>
                        <div class="down-content">

                            <a href="detail-shop?id=${l.shopId}"
                            >
                                <h4>${l.shopName}</h4>
                            </a>
                            <span>${l.address}</span>
                        </div>
                    </div>
                </div>


            </c:forEach>


        </div>
    </div>
</section>
</section>
<!-- ***** Reservation Area Ends ***** -->

<!-- ***** Menu Area Starts ***** -->
<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 offset-lg-4 text-center">
                <div class="section-heading">
                    <h6>Food Week</h6>
                    <h2 style="font-family: none;">Nh???ng m??n ??n n???i b???t trong tu???n</h2>
                </div>
            </div>
        </div>
        <div class="row">

            <c:forEach items="${listFood}" var="ls">
                <div class="col-lg-3"></div>
                <div class="col-lg-2">
                    <img src="server/uploads/${ls.img}" alt="">
                </div>
                <div class="col-lg-4">
                    <h4>${ls.foodName}</h4>
                    <p>${ls.description}.</p>

                </div>
                <div class="col-lg-3"></div>
            </c:forEach>

        </div>
    </div>
</section>
<!-- ***** Chefs Area Ends ***** -->

<!-- ***** Footer Start ***** -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-xs-12">
                <div class="right-text-content">
                    <ul class="social-icons">
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
                    <p>?? Copyright Food Review Co.
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
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }
    // Close the dropdown if the user clicks outside of it
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    };
    $(function () {
        var selectedClass = "";
        $("p").click(function () {
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
            $("#portfolio div").not("." + selectedClass).fadeOut();
            setTimeout(function () {
                $("." + selectedClass).fadeIn();
                $("#portfolio").fadeTo(50, 1);
            }, 500);
        });
    });
</script>
</body>
</html>