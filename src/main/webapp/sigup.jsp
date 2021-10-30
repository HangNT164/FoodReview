<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" i
          ntegrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/plugin/boostrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/custom/form.css">
    <title>Register | Food Review</title>
    <link rel="shortcut icon" href="resources/images/avatar.png">
</head>
<body>
<div id="intro">
    <div class="middle signin"
         style="background: url(https://www.ieltsvietop.vn/wp-content/uploads/2020/07/hong_kong_skyline_green_building_in_asia.jpg);">
        <form action="register" method="post">
            <div class="login-panel">
                <div class="logo text-center"><br/>
                    <a href="home">
                        <p>Food Review</p>
                    </a><br/>
                    <p style="text-align: center; color: #eb421c;font-size: 12px;">${message}</p>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-user fa-fw"></i>
                    </label>
                    <input type="text" class="form-control" placeholder="Name" name="name" required
                           value="${sessionScope.nameTemp}"/>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-user fa-fw"></i>
                    </label>
                    <input type="text" class="form-control" placeholder="Phone Number" name="phone" required
                           value="${sessionScope.phoneTemp}"/>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-user fa-fw"></i>
                    </label>
                    <input type="text" class="form-control" placeholder="Email" name="email" required
                           value="${sessionScope.emailTemp}"/>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-user fa-fw"></i>
                    </label>
                    <input type="text" class="form-control" placeholder="Address" name="address" required
                           value="${sessionScope.addressTemp}"/>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-key fa-fw"></i>
                    </label>
                    <select class="form-control"
                            name="gender">
                        <option value="true" style="color: black">Male
                        </option>
                        <option value="false" style="color: black">Female
                        </option>
                    </select></div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-key fa-fw"></i>
                    </label>
                    <input type="date" class="form-control" placeholder="DOB" name="dob" required
                           value="${sessionScope.dateTemp}"/>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-key fa-fw"></i>
                    </label>
                    <input type="password" class="form-control" placeholder="Password" name="password" required/>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-key fa-fw"></i>
                    </label>
                    <input type="password" class="form-control" placeholder="Re-enter Password" name="rePassword"
                           required/>
                </div>
                <br>
                <div class="form-group">
                    <div class="col">
                        <a href="#">
                            <button type="submit" class="btn btn-sm">
                                <i class="fas fa-sign-in-alt fa-fw mr-1"></i>Sign Up
                            </button>
                        </a>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col">
                        <a class="link-effect" href="#">
                        </a>
                        <a class="link-effect float-right" href="login">
                            <i class="fas fa-question fa-fw mr-1"></i>Login
                        </a><br/><br/>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<footer class="footer">
    <p>
        © 2021 Food Review
    </p>
</footer>
<!-- Bootstrap core JavaScript-->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js "></script>
<script src="resources/js/plugin/popper.min.js"></script>
<script src="resources/js/plugin/boostrap.min.js"></script>
</body>
</html>