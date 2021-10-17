<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Food Review | Update Profile</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resources/images/avatar.png">

    <!-- FontAwesome JS-->
    <script defer src="resources/plugins/fontawesome/js/all.min.js"></script>

    <!-- App CSS -->
    <link rel="stylesheet" href="resources/css/custom/portal.css">
    <link rel="stylesheet" href="resources/css/custom/footer.css">

</head>
<body class="app">
<header class="app-header fixed-top">
    <div class="app-header-inner">
        <div class="container-fluid py-2">
            <div class="app-header-content">
                <div class="row justify-content-between align-items-center">

                    <div class="col-auto">
                        <a id="sidepanel-toggler" class="sidepanel-toggler d-inline-block d-xl-none" href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30"
                                 role="img">
                                <title>Menu</title>
                                <path stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10"
                                      stroke-width="2" d="M4 7h22M4 15h22M4 23h22"></path>
                            </svg>
                        </a>
                    </div>
                    <div class="app-utilities col-auto">
                        <div class="app-utility-item app-user-dropdown dropdown">
                            <a class="dropdown-toggle" id="user-dropdown-toggle" data-bs-toggle="dropdown" href="#"
                               role="button" aria-expanded="false"><img class="profile-image"
                                                                        src="resources/images/users/hangnt.png"
                                                                        alt="Avatar" style="border-radius: 50%;">
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="user-dropdown-toggle">
                                <li><a class="dropdown-item" href="profile">Account</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                <li><a class="dropdown-item" href="change-password.jsp">Change Password</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="logout">Log Out</a></li>
                            </ul>
                        </div>
                        <!--//app-user-dropdown-->
                    </div>
                    <!--//app-utilities-->
                </div>
                <!--//row-->
            </div>
            <!--//app-header-content-->
        </div>
        <!--//container-fluid-->
    </div>
    <!--//app-header-inner-->
</header>
<!--//app-header-->
<div>
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <h1 class="app-page-title">My Account</h1>
    </div>
    <div class="container">
        <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
            <div class="app-card-header p-2 border-bottom-0">
                <div class="row align-items-center gx-3">
                    <div class="col-auto">
                        <div class="app-icon-holder">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                            </svg>
                        </div>
                        <!--//icon-holder-->

                    </div>
                    <!--//col-->
                    <div class="col-auto">
                        <h4 class="app-card-title">Profile</h4>
                    </div>
                    <!--//col-->
                </div>
                <!--//row-->
            </div>
            <!--//app-card-header-->
            <div class="app-card-body px-4 w-100">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog"
                                 alt="Avatar"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                       aria-controls="profile" aria-selected="false">Update Profile</a>
                                </li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="tab-content profile-tab p-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <form action="profile" method="post">
                                            <p style="text-align: center;color: red;">${message1}</p>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-10">
                                                        <label>Name: </label>
                                                        <input class="form-control" style="margin-left: 60px" type="text" name="name" value="${sessionScope.account.name}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-10">
                                                        <label>Email: </label>
                                                        <input class="form-control" style="margin-left: 60px" type="email" name="email" value="${sessionScope.account.email}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-10">
                                                        <label>Phone Number: </label>
                                                        <input class="form-control" style="margin-left: 60px" type="text" name="phone" value="${sessionScope.account.phoneNumber}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-10">
                                                        <label>Address: </label>
                                                        <input class="form-control" style="margin-left: 60px" type="text" name="address" value="${sessionScope.account.address}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-10">
                                                        <label>Gender: </label>
                                                        <input class="form-control" style="margin-left: 60px" type="text" name="gender" value="${sessionScope.account.gender}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-10">
                                                        <label>Date Of Birth: </label>
                                                        <input class="form-control" style="margin-left: 60px" type="date" name="dob" value="${sessionScope.account.dob}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: flex;justify-content: flex-end; padding-bottom: 20px; margin-top: 5px">
                                                <button type="submit" class="btn btn-success collapsed">Update</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--//app-content-->
</div>
<!--//app-wrapper-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="resources/js/custom/app.js"></script>
</body>
<footer class="footer">
    <div class="container text-center py-3">
        <small class="copyright" style="color: black;">© 2021 Copyright <i class="fas fa-heart"
                                                                           style="color: #fb866a;"></i> by <a
                class="app-link"
                href="home.jsp">food.review.com</a></small>
    </div>
</footer>
<!--//app-footer-->
</html>
