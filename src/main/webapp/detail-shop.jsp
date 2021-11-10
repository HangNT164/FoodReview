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
    <title>Food Review | Detail Shop </title>
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
                    <img src="server/uploads/${shop.img}" alt="">
                </div>
                <div class="pro-img-list" style="display: flex;justify-content: center;">
                </div>
            </div>
            <div class="col-md-6">
                <h4 class="pro-d-title">
                    <a href="shop-reviewer" class="">
                        ${shop.shopName}
                    </a>
                </h4>
                <p>
                    ${shop.description}
                </p>
                <div class="product_meta">
                    <span class="posted_in"> <strong>Address:</strong> <a rel="tag" href="#">${shop.address}</a>.</span>
                </div>
                <div class="product_meta">
                    <span class="posted_in"> <strong>Comment:</strong>
                       <form action="add-your-comment" method="post"
                             onchange="return validateAddForm()">
                           <div class="row">
                               <div class="form-group">
                                   <div class="col-md-10">
                                       <input style="margin-left: 60px" type="text"
                                              id="add-your-comment"
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
                <div class="product_meta">
                    <c:forEach items="${listCommentShop}" var="lcm">
                        <span class="posted_in">
                            <strong>${lcm.accountName} :</strong>
                        </span>
                        <p>${lcm.content}</p>
                    </c:forEach>
                </div>
                <div class="product_meta">
                    <c:forEach items="${yourComment}" var="yc">
                        <span class="posted_in">
                            <strong>Your Comment:</strong>
                        <a href="#" class="edit mr-1" data-toggle="modal"
                           data-target="#remove${yc.shopCommentId}" title="Update">
                            Xoá</a>
                        </span>
                        <p>${yc.content}</p>
                        <%--  Su kien remove--%>
                        <div class="modal fade" id="remove${yc.shopCommentId}" tabindex="-1"
                             role="dialog1" aria-labelledby="remove${yc.shopCommentId}"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-sm"
                                 role="document">
                                <div class="modal-content">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="mb-3">Remove Comment </h5>
                                            <form action="remove-your-comment?shopCommentId=${yc.shopCommentId}"
                                                  method="post">
                                                <p>Bạn có muốn xóa comment này không?</p>
                                                <br/>
                                                <div style="display: flex;justify-content: space-between">
                                                    <button type="submit"
                                                            style="border: 1px solid;"
                                                            class="btn btn-outline-success">
                                                        Có
                                                    </button>
                                                    <button type="button"
                                                            style="border: 1px solid;"
                                                            class="btn btn-outline-success"
                                                            data-bs-dismiss="modal"
                                                            data-dismiss="modal">Không
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div>
            <h3 style="margin-left: -40px; margin-top: 15px; color: #fb5849!important; height: fit-content"><span>List foods</span>
            </h3>

            <div class="row" style="margin-top: 30px; margin-left: 10px">
                <div class="col-lg-6">
                    <div class="row">
                        <ul id="left-list" class="left-list">
                            <c:forEach items="${listFoodByShopAndOddId}" var="food">
                                <li class="col-lg-12 left-food" style="display: none">
                                    <div class="tab-item">
                                        <a href="#" data-toggle="modal" data-target="#detail${food.foodId}">
                                            <img src="https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png"
                                                 alt="" style="width: 150px; height: 150px"><br>
                                            <span style="color: #fb5849; font-size: 26px; font-weight: bold;">${food.foodName}</span>
                                        </a>
                                        <p>${food.description}</p>
                                        <div class="price">
                                            <h6 style="color: #fb5849">${food.rate} <i class="fa fa-heart-o"></i></h6>
                                        </div>
                                    </div>
                                </li>
                                <div class="modal fade" id="detail${food.foodId}" tabindex="-1"
                                     role="dialog" aria-labelledby="detail${food.foodId}"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-lg"
                                         role="document">
                                        <div class="modal-content">
                                            <div class="card" style="margin: 0;">
                                                <div class="card-body" style="padding-bottom: 0 !important;">
                                                    <h5 class="mb-3">Detail Food</h5>
                                                    <div class="col-6 pr-4">
                                                        <div class="form-group row">
                                                            <div class="col-sm-12">
                                                                <img src="https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png"
                                                                     alt="" style="width: 150px; height: 150px"><br>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-sm-12">
                                                                <label>Food name</label>
                                                                <span class="form-control">${food.foodName}</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-sm-12">
                                                                <label>Description </label>
                                                                <span class="form-control">${food.description}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button"
                                                                style="border: 1px solid;"
                                                                class="btn btn-outline-success"
                                                                data-dismiss="modal">Close
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <ul id="right-list" class="right-list">
                            <c:forEach items="${listFoodByShopAndEvenId}" var="f">
                                <li class="col-lg-12 right-food" style="display: none">
                                    <div class="tab-item">
                                        <a href="detail-food?foodId=${f.foodId}">
                                            <img src="https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png"
                                                 alt="" style="width: 150px; height: 150px"><br>
                                            <span style="color: #fb5849; font-size: 26px; font-weight: bold;">${f.foodName}</span>
                                        </a>
                                        <p>${f.description}</p>
                                        <div class="price">
                                            <h6 style="color: #fb5849">${f.rate} <i class="fa fa-heart-o"></i></h6>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: center; margin-top: 30px">
                <div id="loadMore" style="margin-left: -50px; margin-right: 20px;">
                    <a href="#"
                       style="padding: 10px; border-radius: 3px; color: #fff!important; background-color: #ec7211; border-color: #ec7211;">Load
                        More</a>
                </div>
                <div id="showLess" style="display: none;">
                    <a href="#"
                       style="padding: 10px; border-radius: 3px; color: #fff!important; background-color: #ec7211; border-color: #ec7211;">Show
                        Less</a>
                </div>
            </div>
        </div>
    </div>
    <br/><br/>
    <%--    <div class="container">--%>
    <%--        <form action="detail-shop?id=${shop.shopId}" method="post">--%>
    <%--            <div style="display: flex;justify-content: flex-start;">--%>
    <%--                <p>You reviewer: </p>--%>
    <%--                <div class="rate">--%>
    <%--                    <input type="radio" id="star5" name="rate" value="5"/>--%>
    <%--                    <label for="star5" title="text">5 stars</label>--%>
    <%--                    <input type="radio" id="star4" name="rate" value="4"/>--%>
    <%--                    <label for="star4" title="text">4 stars</label>--%>
    <%--                    <input type="radio" id="star3" name="rate" value="3"/>--%>
    <%--                    <label for="star3" title="text">3 stars</label>--%>
    <%--                    <input type="radio" id="star2" name="rate" value="2"/>--%>
    <%--                    <label for="star2" title="text">2 stars</label>--%>
    <%--                    <input type="radio" id="star1" name="rate" value="1"/>--%>
    <%--                    <label for="star1" title="text">1 star</label>--%>
    <%--                </div>--%>
    <%--                <button type="submit" class="btn btn-outline-secondary">Send</button>--%>
    <%--            </div>--%>
    <%--        </form>--%>
    <%--    </div>--%>
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
<script>
    $(document).ready(function () {
        const leftSize = document.getElementsByClassName("left-food").length;
        const rightSize = document.getElementsByClassName("right-food").length;
        let defaultSize = 2;
        $('#left-list li:lt(' + defaultSize + ')').show();
        $('#right-list li:lt(' + defaultSize + ')').show();
        if (leftSize <= defaultSize && rightSize <= defaultSize) {
            $("#loadMore").hide();
        }
        $("#loadMore").on('click', function (e) {
            e.preventDefault();
            defaultSize = (defaultSize + 2 <= leftSize) ? defaultSize + 2 : leftSize;
            $('#left-list li:lt(' + defaultSize + ')').slideDown();
            $('#right-list li:lt(' + defaultSize + ')').slideDown();
            if (leftSize <= defaultSize && rightSize <= defaultSize) {
                $("#loadMore").hide();
            }
            if (leftSize > defaultSize && rightSize > defaultSize) {
                $("#showLess").show();
            }
        });
        $("#showLess").on('click', function (e) {
            e.preventDefault();
            defaultSize = (defaultSize - 2 < 0) ? 2 : defaultSize - 2;
            $('#left-list li').not(':lt(' + defaultSize + ')').slideUp();
            $('#right-list li').not(':lt(' + defaultSize + ')').slideUp();
            if (defaultSize <= 2 && defaultSize <= 2) {
                $("#loadMore").show();
                $("#showLess").hide();
            }
        });
    });
</script>
</body>
</html>
