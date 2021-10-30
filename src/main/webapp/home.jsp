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
                    <a href="#" class="logo">
                        <img height="80px" width="120px" src="resources/images/home/logo.png">
                    </a>
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
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
                        <h4>Food Review</h4>
                        <h6>THE BEST EXPERIENCE</h6>
                        <div class="main-white-button scroll-to-section">
                            <a href="#"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="main-banner header-text">
                    <div class="Modern-Slider">
                        <!-- Item -->
                        <div class="item">
                            <div class="img-fill">
                                <img src="resources/images/home/slide-01.jpg" alt="">
                            </div>
                        </div>
                        <!-- // Item -->
                        <!-- Item -->
                        <div class="item">
                            <div class="img-fill">
                                <img src="resources/images/home/slide-02.jpg" alt="">
                            </div>
                        </div>
                        <!-- // Item -->
                        <!-- Item -->
                        <div class="item">
                            <div class="img-fill">
                                <img src="resources/images/home/slide-03.jpg" alt="">
                            </div>
                        </div>
                        <!-- // Item -->
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
            <div class="col-lg-6 col-md-6 col-xs-12">
                <div class="left-text-content">
                    <div class="section-heading">
                        <h6>New Post</h6>
                        <a href="#" style="font-family: none;"><h2>${top1.title}</h2>
                        </a>
                    </div>
                    <p>${top1.content}
                    </p>
                    <i>Địa chỉ: 459-461 Lê Đại Hành, Quận 11
                        <br>Giờ mở cửa: 9.00-19.00
                        <br>Giá: 35.000VND</i>
                    <div class="row">
                        <div class="col-4">
                            <img src="resources/images/home/about-thumb-01.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img src="resources/images/home/about-thumb-02.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img src="resources/images/home/about-thumb-03.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-xs-12">
                <div class="right-content">
                    <div class="thumb">
                        <a rel="nofollow" href="http://youtube.com"><i class="fa fa-play"></i></a>
                        <img src="resources/images/home/about-video-bg.jpg" alt="">
                    </div>
                </div>
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
                    <h2 style="font-family: none;">Cùng khám phá vô vàn những bài viết của chúng tôi</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="menu-item-carousel">
        <div class="col-lg-12">
            <div class="owl-menu-item owl-carousel">
                <c:forEach items="${topicList}" var="l">
                    <div class="item">
                        <div class='card card1'>
                            <div class="price"><h6>${l.rate} <i class="fas fa-heart fw"></i></h6></div>
                            <div class='info'>
                                <h1 class='title'>${l.title}</h1>
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
                    <h2 style="font-family: none;">Những cửa hàng nổi bật</h2>
                </div>
            </div>
        </div>
        <div class="row">

            <c:forEach items="${listShop}" var="l">
                <div class="col-lg-4">
                    <div class="chef-item">
                        <div class="thumb">
                            <div class="overlay"></div>
                            <ul class="social-icons">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                            <img src="resources/images/home/chefs-01.jpg" alt="Chef #1">
                        </div>
                        <div class="down-content">
                            <h4>${l.shopName}</h4>
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
<section class="section" id="offers">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 offset-lg-4 text-center">
                <div class="section-heading">
                    <h6>Food Week</h6>
                    <h2 style="font-family: none;">Những món ăn nổi bật trong tuần</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="row" id="tabs">
                    <div class="col-lg-12">
                        <div class="heading-tabs">
                            <div class="row">
                                <div class="col-lg-6 offset-lg-3">
                                    <ul>
                                        <li><a href='#tabs-1'><img src="resources/images/home/tab-icon-01.png" alt="">Breakfast</a>
                                        </li>
                                        <li><a href='#tabs-2'><img src="resources/images/home/tab-icon-02.png"
                                                                   alt="">Lunch</a></li>
                                        <li><a href='#tabs-3'><img src="resources/images/home/tab-icon-03.png"
                                                                   alt="">Dinner</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <section class='tabs-content'>
                            <article id='tabs-1'>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="left-list">
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-01.png" alt="">
                                                        <h4>Fresh Chicken Salad</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-02.png" alt="">
                                                        <h4>Orange Juice</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-03.png" alt="">
                                                        <h4>Fruit Salad</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
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
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-04.png" alt="">
                                                        <h4>Eggs Omelette</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-05.png" alt="">
                                                        <h4>Dollma Pire</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-06.png" alt="">
                                                        <h4>Omelette & Cheese</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <article id='tabs-2'>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="left-list">
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-04.png" alt="">
                                                        <h4>Eggs Omelette</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-05.png" alt="">
                                                        <h4>Dollma Pire</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-06.png" alt="">
                                                        <h4>Omelette & Cheese</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
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
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-01.png" alt="">
                                                        <h4>Fresh Chicken Salad</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-02.png" alt="">
                                                        <h4>Orange Juice</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-03.png" alt="">
                                                        <h4>Fruit Salad</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <article id='tabs-3'>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="left-list">
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-05.png" alt="">
                                                        <h4>Eggs Omelette</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-03.png" alt="">
                                                        <h4>Orange Juice</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-02.png" alt="">
                                                        <h4>Fruit Salad</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
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
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-06.png" alt="">
                                                        <h4>Fresh Chicken Salad</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-01.png" alt="">
                                                        <h4>Dollma Pire</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="tab-item">
                                                        <img src="resources/images/home/tab-item-04.png" alt="">
                                                        <h4>Omelette & Cheese</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur koit adipiscing elit,
                                                            sed do.</p>
                                                        <div class="price">
                                                            <h6>10 <i class="fa fa-heart"></i></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </section>
                    </div>
                </div>
            </div>
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
