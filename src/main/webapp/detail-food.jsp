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
    <script defer src="resources/plugins/fontawesome/js/all.min.js"></script>
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

                <!-- Food Comment Area-->
                <div class="product_meta">
                    <span class="posted_in"> <strong>Comment:</strong>
                       <form action="add-food-comment?foodId=${food.foodId}" method="post"
                             onchange="return validateAddForm()">
                           <div class="row">
                               <div class="form-group">
                                   <div class="col-md-10">
                                       <input style="margin-left: 60px" type="text"
                                              id="add-food-comment"
                                              name="content"
                                              class="form-control"/>
                                   </div>
                               </div>
                           </div>
                           <br/>
                           <div style="display: flex;justify-content: space-evenly">
                               <button type="submit"
                                       onclick="return validateAddForm()"
                                       style="border: 1px solid;"
                                       class="btn btn-success collapsed">
                                   Add
                               </button>
                           </div>
                       </form>
                    </span>
                </div>

                <!-- List Food Comment Area-->
                <div class="product_meta">
                    <c:forEach items="${foodCommentList}" var="fcl">
                        <br>
                        <div class="row">
                            <span class="posted_in">
                                <strong>${fcl.accountName} :</strong>
                                <p>${fcl.content}</p>
                            </span>
                            <c:if test="${fcl.accountId == account.accountId}">
                                <div class="col-1">
                                    <a href="#" data-toggle="modal"
                                       data-target="#update${fcl.foodCommentId}">
                                        <h5><i class="fas fa-pen"></i></h5>
                                    </a>
                                </div>
                                <div class="col-1">
                                    <a href="#" data-toggle="modal"
                                       data-target="#remove${fcl.foodCommentId}">
                                        <h5><i class="fas fa-trash"></i></h5>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                        <p> Created date: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${fcl.createdDate}" /></p>
                        <p> Updated date: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${fcl.updatedDate}" /></p>
                        <hr>
                        <!-- Edit comment modal -->
                        <div class="modal fade" id="update${fcl.foodCommentId}" tabindex="-1"
                             role="dialog" aria-labelledby="update${fcl.foodCommentId}"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-body" style="padding-left: 9%">
                                        <h5 class="mb-3">Edit comment </h5>
                                        <form action="update-food-comment?foodId=${food.foodId}&foodCommentId=${fcl.foodCommentId}" method="post"
                                              id ="update-food-comment">
                                            <p style="text-align: center;color: red;">${message}</p>
                                            <textarea rows="6" cols="80" name="updateContent">${fcl.content}</textarea>
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
                        <!-- remove comment modal -->
                        <div class="modal fade" id="remove${fcl.foodCommentId}" tabindex="-1" role="dialog" aria-labelledby="remove${fcl.foodCommentId}" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-md"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-body" style="padding-left: 10%">
                                        <h5 class="mb-3">Are you sure to remove your comment?</h5>
                                        <form action="remove-food-comment?foodId=${food.foodId}&foodCommentId=${fcl.foodCommentId}"
                                              method="post" id ="remove-topic-comment">
                                            <p style="text-align: center;color: red;">${message}</p>
                                            <br>
                                            <br>
                                            <div style="display: flex;justify-content: space-evenly">
                                                <button type="submit"
                                                        style="border: 1px solid;"
                                                        class="btn btn-outline-success">
                                                    Remove
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
