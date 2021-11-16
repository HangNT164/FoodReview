<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

    <!--
    TemplateMo 558 Klassy Cafe

    https://templatemo.com/tm-558-klassy-cafe

    -->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="resources/css/home/bootstrap.min.css">
    <!--<link rel="stylesheet" type="text/css" href="resources/css/home/font-awesome.css">-->
    <script defer src="resources/plugins/fontawesome/js/all.min.js"></script>
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
            <div class="col-lg-12 col-md-12 col-xs-12">
                <div class="left-text-content">
                    <div class="section-heading">
                        <h1 style="font-family: none;">${topic.title}</h1>
                    </div>
                    <br>
                    <span><b>Author:</b> ${topic.accountName} | <fmt:formatDate pattern = "dd/MM/yyyy" value = "${topic.createdDate}" />. </span>

                    <br>
                    <br>
                    <h5 style="white-space: pre-line; font-weight:normal;">${topic.content}
                    </h5>
                    <br>
                    <div class="row">
                        <img src="server/uploads/${topic.img}" alt=""/>
                    </div>
                </div>
            </div>
            <!--<div class="col-lg-6 col-md-6 col-xs-12">
                <div class="right-content">
                    <div class="thumb">
                        <a rel="nofollow" href="http://youtube.com"><i class="fa fa-play"></i></a>
                        <img src="resources/images/home/about-video-bg.jpg" alt="">
                    </div>
                </div>
            </div>-->
        </div>
        <br>
        <hr style="height:2px;border-width:0;color:gray;background-color:gray">
        <div class="row">
            <div class = "col-9">
                <h2>Comments</h2>
            </div>
            <div class = "col-3">
                <c:if test="${checkIfCommented == 0}">
                    <a href="#" data-toggle="modal" data-target="#create">
                        <h5><i class="fas fa-plus"></i> Create new comment</h5>
                    </a>
                    <!-- add comment modal -->
                    <div class="modal fade" id="create" tabindex="-1"
                    role="dialog" aria-labelledby="create"
                    aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg"
                             role="document">
                            <div class="modal-content">
                                <div class="modal-body" style="padding-left: 9%">
                                    <h5 class="mb-3">Create comment </h5>
                                    <form action="topic-comment?topicId=${topic.topicId}&action=create"
                                     method="post" id ="create-topic-comment-form">
                                        <p style="text-align: center;color: red;">${message}</p>
                                        <textarea rows="6" cols="80" name="createContent"></textarea>
                                        <br>
                                        <br>
                                        <div style="display: flex;justify-content: space-evenly">
                                            <button type="submit"
                                                    style="border: 1px solid;"
                                                    class="btn btn-outline-success">
                                                Create
                                            </button>
                                            <button type="button"
                                                    style="border: 1px solid;"
                                                    class="btn btn-outline-success"
                                                    data-dismiss="modal">Close
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
            </div>
            <div class="col-10">
                <div class="left-text-content">
                    <c:forEach items="${topicCommentList}" var="t">
                        <br>

                        <div class="section-heading">
                            <div class="row">
                                <div class="col-10">
                                    <h5>${t.accountName}</h5>
                                </div>
                                <c:if test="${checkIfCommented == 1}">
                                    <c:if test="${t.accountId == account.accountId}">
                                        <div class="col-1">
                                           <a href="#" data-toggle="modal"
                                           data-target="#update${t.topicCommentId}">
                                                <h5><i class="fas fa-pen"></i></h5>
                                           </a>
                                        </div>
                                        <div class="col-1">
                                           <a href="#" data-toggle="modal"
                                           data-target="#delete${t.topicCommentId}">
                                                <h5><i class="fas fa-trash"></i></h5>
                                           </a>
                                        </div>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>



                        <p style="white-space: pre-line; padding-left: 5%;">${t.content}
                        </p>
                        <p> Create date: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${t.createdDate}" /></p>
                        <hr>

                        <!-- Edit comment modal -->
                        <div class="modal fade" id="update${t.topicCommentId}" tabindex="-1"
                        role="dialog" aria-labelledby="update${t.topicCommentId}"
                        aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-body" style="padding-left: 9%">
                                        <h5 class="mb-3">Edit comment </h5>
                                        <form action="topic-comment?commentId=${t.topicCommentId}&topicId=${topic.topicId}&action=edit" method="post"
                                        id ="edit-topic-comment-form">
                                            <p style="text-align: center;color: red;">${message}</p>
                                            <textarea rows="6" cols="80" name="updateContent">${t.content}</textarea>
                                            <br>
                                            <br>
                                            <div style="display: flex;justify-content: space-evenly">
                                                <button type="submit"
                                                        style="border: 1px solid;"
                                                        class="btn btn-outline-success">
                                                    Change
                                                </button>
                                                <button type="button"
                                                        style="border: 1px solid;"
                                                        class="btn btn-outline-success"
                                                        data-dismiss="modal">Close
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- delete comment modal -->
                        <div class="modal fade" id="delete${t.topicCommentId}" tabindex="-1" role="dialog" aria-labelledby="delete${t.topicCommentId}" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-md"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-body" style="padding-left: 10%">
                                            <h5 class="mb-3">Are you sure to delete your comment ?</h5>
                                            <form action="topic-comment?commentId=${t.topicCommentId}&topicId=${topic.topicId}&action=delete"
                                             method="post" id ="delete-topic-comment-form">
                                                <p style="text-align: center;color: red;">${message}</p>
                                                <br>
                                                <br>
                                                <div style="display: flex;justify-content: space-evenly">
                                                    <button type="submit"
                                                            style="border: 1px solid;"
                                                            class="btn btn-outline-success">
                                                        Delete
                                                    </button>
                                                    <button type="button"
                                                            style="border: 1px solid;"
                                                            class="btn btn-outline-success"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
                    <h2 style="font-family: none;">Cùng khám phá vô vàn những bài viết của chúng tôi.
                        <a href="list-topic-approved" style="font-family: none;">Xem thêm >></a>
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
                    <a href="home.jsp"><img src="resources/images/home/logo.png" alt=""></a>
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
    window.onclick = function(event) {
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
    $('.modal').on('shown.bs.modal', function() {
      //Make sure the modal and backdrop are siblings (changes the DOM)
      $(this).before($('.modal-backdrop'));
      //Make sure the z-index is higher than the backdrop
      $(this).css("z-index", parseInt($('.modal-backdrop').css('z-index')) + 1);
    });

</script>
</body>
</html>
