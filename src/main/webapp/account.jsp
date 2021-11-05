<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Food Review | Profile</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resources/images/avatar.png">
    <!-- FontAwesome JS-->
    <script defer src="resources/plugins/fontawesome/js/all.min.js"></script>
    <script src="resources/js/custom/genderScriptProfile.js"></script>

    <!-- App CSS -->
    <link rel="stylesheet" href="resources/css/custom/portal.css">
    <link rel="stylesheet" href="resources/css/custom/footer.css">
</head>
<body class="app">
<header class="app-header fixed-top">
    <div class="row justify-content-between"
         style="align-items: baseline !important; margin-top: -10px; margin-left: 3px; width: 100%;">
        <div class="app-branding" style="width: fit-content;">
            <a class="app-logo" style=" text-decoration: none" href="#"><span class="logo-text" style="font-size: 27px;"><i>Food Review</i></span></a>
        </div>
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
                            <h5>
                                <span>${account.name}</span>
                            </h5>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link ${message1 == null && message2 == null ? " active" : ""}"
                                       id="home-tab" data-toggle="tab" href="#home" role="tab"
                                       aria-controls="home" aria-selected="true">About</a>
                                </li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="tab-content profile-tab p-1" id="myTabContent">
                                    <div class="tab-pane fade ${message1 == null && message2 == null ? " show active" : ""}"
                                         id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <p style="text-align: center;color: limegreen;">${message}</p>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><span>${sessionScope.account.name}</span></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${sessionScope.account.email}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${sessionScope.account.phoneNumber}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Gender</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input id='hiddenG' type='hidden' value='${sessionScope.account.gender}'/>
                                                <p id="genderName"></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Address</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${sessionScope.account.address}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>DOB</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${sessionScope.account.dob}</p>
                                            </div>
                                        </div>
                                        <div style="display: flex;justify-content: flex-end; padding-bottom: 20px; margin-top: 5px">
                                            <a href="update-profile">
                                                <button type="button" class="btn btn-primary collapsed">Edit Profile
                                                </button>
                                            </a>
                                        </div>
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
                href="#">food.review.com</a></small>
    </div>
</footer>
<!--//app-footer-->
</html>
