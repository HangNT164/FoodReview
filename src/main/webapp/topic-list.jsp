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

    <!--
    TemplateMo 558 Klassy Cafe

    https://templatemo.com/tm-558-klassy-cafe

    -->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="resources/css/home/bootstrap.min.css">
    <!-- <link rel="stylesheet" type="text/css" href="resources/css/home/font-awesome.css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
</header>r
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

<!-- ***** Topic List Area Starts ***** -->
<section class="section" id="about">
    <div class="container">
        <form form id="linkForm" action="topic-detail" method="post">
            <input type="text" id="topicId" name="topicId" hidden="true" value=""/>
        </form>
        <form id="listTopicForm" action="list-topic-approved" method="post">
            <div class = "row">
                <input class="form-control col-4" type="text"  name="search" placeholder="search..." value="${search}" onfocus="document.getElementById('type').value = 'search';"/>
                <input hidden="true" id="type" name="type" value="move"/>
                <button type="submit" class="btn btn-primary col-1" onclick="document.getElementById('type').value = 'search';"><i class="fa fa-search"></i></button>
                <input hidden="true" id="sortType" name="sortType" value="${sortType}"/>
                <button type="submit" class="btn" onclick="document.getElementById('sortType').value = 'name';">Order By Name</button>
                <button type="submit" class="btn" onclick="document.getElementById('sortType').value = 'rate';">Order By Rate</button>
            </div>

            <div class="row">
                <c:forEach items="${topicList}" var="l" varStatus="loop">
                    <div class="col-6 border-bottom rounded">
                        <br>
                        <br>
                        <h2><a href="javascript:{}" onclick="document.getElementById('topicId').value = ${l.topicId}; document.getElementById('linkForm').submit();" style="color: black;">${l.title}</a></h2>
                        <hr>
                        <div class="row">
                            <div class="col-6">
                                <img src="resources/images/home/about-thumb-01.jpg" alt="">
                            </div>
                            <div class="col-6 border-right rounded">
                                <p style="white-space: pre-line;">${l.content}</p>
                                <br>
                                <br>
                                <h6>Author: ${l.accountName}</h6>
                                <h6>Rate: ${l.rate}</h6>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <br>
            <br>
            <input type="text" id="topicListIndex" name="topicListIndex" hidden="true" value="${currentTopicListIndex}"/>
            <c:if test="${totalTopicListIndexes > 1}">
                <nav aria-label="Page navigation">
                  <ul class="pagination">
                    <c:if test="${currentTopicListIndex >1}">
                        <li class="page-item">
                          <a class="page-link" href="javascript:{}" onclick="document.getElementById('topicListIndex').value = ${currentTopicListIndex-1}; document.getElementById('listTopicForm').submit();" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                          </a>
                        </li>
                    </c:if>
                    <c:if test="${currentTopicListIndex <=1}">
                        <li class="page-item disabled">
                          <a class="page-link" href="javascript:{}" onclick="document.getElementById('topicListIndex').value = ${currentTopicListIndex-1}; document.getElementById('listTopicForm').submit();" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                          </a>
                        </li>
                    </c:if>

                    <c:forEach var="i" begin="1" end="${totalTopicListIndexes}">
                        <li class="page-item"><a class="page-link" href="javascript:{}" onclick="document.getElementById('topicListIndex').value = ${i}; document.getElementById('listTopicForm').submit();">${i}</a></li>
                    </c:forEach>

                    <c:if test="${currentTopicListIndex < totalTopicListIndexes}">
                        <li class="page-item">
                          <a class="page-link" href="javascript:{}" onclick="document.getElementById('topicListIndex').value = ${currentTopicListIndex+1}; document.getElementById('listTopicForm').submit();" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                          </a>
                        </li>
                    </c:if>
                    <c:if test="${currentTopicListIndex >= totalTopicListIndexes}">
                        <li class="page-item disabled">
                          <a class="page-link" href="javascript:{}" onclick="document.getElementById('topicListIndex').value = ${currentTopicListIndex+1}; document.getElementById('listTopicForm').submit();" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                          </a>
                        </li>
                    </c:if>
                  </ul>
                </nav>
            </c:if>
        </form>
    </div>
</section>
<!-- ***** Topic List Area Ends ***** -->

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

<!-- Javascript -->
<script src="resources/js/plugin/jquery-3.3.1.slim.min.js " type="text/javascript "></script>
<script src="resources/js/plugin/jquery.min.js "></script>
<script src="resources/js/plugin/popper.min.js "></script>
<script src="resources/plugins/popper.min.js "></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<!-- Charts JS -->
<script src="resources/plugins/chart.js/chart.min.js "></script>

<!-- Page Specific JS -->
<script src="resources/js/custom/app.js "></script>



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

</script>

</body>
</html>
