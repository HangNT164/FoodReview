<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Food Review | User Management</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resources/images/avatar.png">
    <link rel="stylesheet" href="resources/css/plugin/boostrap.min.css">
    <link rel="stylesheet" href="resources/css/plugin/bootstrap.css">
    <link rel="stylesheet" href="resources/css/plugin/dataTables.bootstrap4.min.css">

    <!-- FontAwesome JS-->
    <script defer src="resources/plugins/fontawesome/js/all.min.js"></script>

    <!-- App CSS -->
    <link rel="stylesheet" href="resources/css/custom/portal.css">
    <link rel="stylesheet" href="resources/css/custom/footer.css">
    <link rel="stylesheet" href="resources/css/plugin/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="resources/css/custom/user.css">
    <link rel="stylesheet" type="text/css" href="resources/css/plugin/query-ui.css">

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
    <div id="app-sidepanel" class="app-sidepanel">
        <div id="sidepanel-drop" class="sidepanel-drop"></div>
        <div class="sidepanel-inner d-flex flex-column">
            <a href="#" id="sidepanel-close" class="sidepanel-close d-xl-none">&times;</a>
            <div class="app-branding" style="margin:auto;">
                <a class="app-logo" href="index.jsp"><span class="logo-text" style="font-size: 27px;"><i>Food
                                Review</i></span></a>
            </div>
            <!--//app-branding-->

            <nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
                <ul class="app-menu list-unstyled accordion" id="menu-accordion">
                    <li class="nav-item ">
                        <a class="nav-link  " href="index.jsp">
                                <span class="nav-icon">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
                                        <path fill-rule="evenodd"
                                              d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                                    </svg>
                                </span>
                            <span class="nav-link-text">Dashboard</span>
                        </a>
                        <!--//nav-link-->
                    </li>
                    <!--//nav-item-->

                    <li class="nav-item">
                        <a class="nav-link active" href="search-user-management">
                                <span class="nav-icon">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                        <path fill-rule="evenodd"
                                              d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
                                        <circle cx="3.5" cy="5.5" r=".5"/>
                                        <circle cx="3.5" cy="8" r=".5"/>
                                        <circle cx="3.5" cy="10.5" r=".5"/>
                                    </svg>
                                </span>
                            <span class="nav-link-text">User Management</span>
                        </a>
                        <!--//nav-link-->
                    </li>
                    <!--//nav-item-->

                    <li class="nav-item">
                        <a class="nav-link" href="search-topic-status">
                                <span class="nav-icon">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                                d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z"/>
                                        <path fill-rule="evenodd"
                                              d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z"/>
                                    </svg>
                                    <path fill-rule="evenodd"
                                          d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                    <path fill-rule="evenodd"
                                          d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
                                    <circle cx="3.5" cy="5.5" r=".5"/>
                                    <circle cx="3.5" cy="8" r=".5"/>
                                    <circle cx="3.5" cy="10.5" r=".5"/>
                                    </svg>
                                </span>
                            <span class="nav-link-text">Topic Management</span>
                        </a>
                        <!--//nav-link-->
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="food-management">
                                <span class="nav-icon">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                                d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z"/>
                                        <path fill-rule="evenodd"
                                              d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z"/>
                                    </svg>
                                    <path fill-rule="evenodd"
                                          d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                    <path fill-rule="evenodd"
                                          d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
                                    <circle cx="3.5" cy="5.5" r=".5"/>
                                    <circle cx="3.5" cy="8" r=".5"/>
                                    <circle cx="3.5" cy="10.5" r=".5"/>
                                    </svg>
                                </span>
                            <span class="nav-link-text">Food Management</span>
                        </a>
                        <!--//nav-link-->
                    </li>
                    <!--//nav-item-->
                </ul>
                <!--//app-menu-->
            </nav>
            <!--//app-nav-->
            <!--//app-sidepanel-footer-->
        </div>
        <!--//sidepanel-inner-->
    </div>
    <!--//app-sidepanel-->
</header>
<!--//app-header-->
<div class="app-wrapper">
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <div class="container-fuild">

            <h1 class="app-page-title">User Management</h1>
            <div class="animated fadeIn">

                <div class="row">

                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-body">
                                <form action="search-user-management">
                                    <div class="row mt-3 mb-3">
                                        <div class="row" style="padding: 0px;margin: 0px;">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="name">Email:</label>
                                                    <input id="name" name="name" type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-1" style="margin-top: 30px;">
                                                <button type="submit"
                                                        style="background-color: transparent;border-color: transparent;">
                                                    <img src="resources/images/search.png" alt="Search"></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <div class="row">
                                    <div style="max-height: 600px; overflow: auto;">
                                        <div class="table-responsive">
                                            <table id="user-management-table" class="table table-bordered w-100">
                                                <thead>
                                                <tr>
                                                    <th class="w-stt">No</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Role</th>
                                                    <th>Status</th>
                                                    <th>Created Date</th>
                                                    <th>Update Date</th>
                                                    <th>Note</th>

                                                    <th class="w-action-3">Function</th>
                                                </tr>
                                                </thead>

                                                <tbody>

                                                <c:forEach items="${accountList}" var="a" varStatus="loop">
                                                    <tr>
                                                        <td>${loop.count}</td>
                                                        <td>${a.name}</td>
                                                        <td>${a.email}</td>
                                                        <td>${a.phoneNumber}</td>
                                                        <td>${a.role}</td>
                                                        <td>${a.status}</td>
                                                        <td>${a.createdDate}</td>
                                                        <td>${a.updatedDate}</td>
                                                        <td></td>
                                                        <td style="text-align: center">
                                                            <a href="#" class="view mr-1" data-toggle="modal"
                                                               data-target="#detail${a.accountId}" title="Detail">
                                                                <i
                                                                        class="fas fa-eye fa-fw"></i></a>
                                                            <a href="#" class="edit mr-1" data-toggle="modal"
                                                               data-target="#update${a.accountId}" title="Update">
                                                                <i
                                                                        class="fas fa-pen fa-fw"></i></a>
                                                            <a href="#" class="remove mr-1" data-toggle="modal"
                                                               data-target="#remove${a.accountId}"
                                                               title="Review">
                                                                <i
                                                                        class="fas fa-trash fa-fw"></i></a>
                                                        </td>
                                                    </tr>

                                                    <!-- Su kien show chi tiet -->
                                                    <div class="modal fade" id="detail${a.accountId}" tabindex="-1"
                                                         role="dialog" aria-labelledby="detail${a.accountId}"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-lg"
                                                             role="document">
                                                            <div class="modal-content">
                                                                <div class="card">
                                                                    <div class="card-body">
                                                                        <h5 class="mb-3">Detail User</h5>
                                                                        <div class="row">
                                                                            <div class="col-6 pr-4">
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>User Name</label>
                                                                                        <span class="form-control">${a.name} </span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Date of Birth</label>
                                                                                        <span class="form-control">${a.dob}</span>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Gender </label>
                                                                                        <c:choose>
                                                                                            <c:when test="${a.gender ==true}">
                                                                                                <span class="form-control">Male</span>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <span class="form-control">Female</span>
                                                                                            </c:otherwise>
                                                                                        </c:choose>

                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Address </label>
                                                                                        <span class="form-control">${a.address}</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Role</label>
                                                                                        <span class="form-control">${a.role}</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-6 pr-4">
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Status</label>
                                                                                        <span class="form-control">${a.status} </span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Date of Birth</label>
                                                                                        <span class="form-control">${a.updatedDate}</span>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Updated Date </label>
                                                                                        <span class="form-control">${a.updatedDate}</span>
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
                                                    </div>

                                                    <%--  Su kien update--%>
                                                    <div class="modal fade" id="update${a.accountId}" tabindex="-1"
                                                         role="dialog" aria-labelledby="update${a.accountId}"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-sm"
                                                             role="document">
                                                            <div class="modal-content">
                                                                <div class="card">
                                                                    <div class="card-body">
                                                                        <h5 class="mb-3">Update Role User </h5>
                                                                        <form action="search-user-management?accountId=${a.accountId}"
                                                                              method="post">
                                                                            <p style="text-align: center;color: red;">${message}</p>
                                                                            <select class="form-control"
                                                                                    name="listRole">
                                                                                <option value="Reviewer">Reviewer
                                                                                </option>
                                                                                <option value="ShopOwner">Shop Owner
                                                                                </option>
                                                                                <option value="Admin">Admin</option>
                                                                            </select>
                                                                            <br/>
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
                                                    </div>

                                                    <%--  Su kien remove--%>
                                                    <div class="modal fade" id="remove${a.accountId}" tabindex="-1"
                                                         role="dialog" aria-labelledby="remove${a.accountId}"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-sm"
                                                             role="document">
                                                            <div class="modal-content">
                                                                <div class="card">
                                                                    <div class="card-body">
                                                                        <h5 class="mb-3">Remove User </h5>
                                                                        <p style="text-align: center;color: red;">${message}</p>
                                                                        <form action="remove-user-management?accountId=${a.accountId}"
                                                                              method="post">
                                                                            <p>Bạn có muốn xóa tài khoản này không?</p>
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
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--//container-fluid-->
    </div>
    <!--//app-content-->
</div>

<footer class="footer ">
    <div class="container text-center py-3 ">
        <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
        <small class="copyright " style="color: black; ">© 2021 Copyright <i class="fas fa-heart "
                                                                             style="color: #fb866a; "></i> by <a
                class="app-link "
                href="index.jsp ">food.review.com</a></small>

    </div>
</footer>
<!--//app-footer-->

</div>
<!--//app-wrapper-->

<!-- Javascript -->
<script src="resources/js/plugin/jquery-3.3.1.slim.min.js " type="text/javascript "></script>
<script src="resources/js/plugin/jquery.min.js "></script>
<script src="resources/js/plugin/popper.min.js "></script>
<script src="resources/plugins/popper.min.js "></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

<!-- Page Specific JS -->
<script src="resources/js/custom/app.js "></script>

<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        $('#user-management-table').DataTable();
    });

</script>

<style>
    .dataTables_paginate>span>a {
        margin-bottom: 0px !important;
        padding: 2px 2px !important;
    }

    .dataTables_paginate>a {
        margin-bottom: 0px !important;
        padding: 2px 2px !important;
    }
</style>
</body>

</html>
