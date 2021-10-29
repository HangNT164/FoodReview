<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Food Review | Shop Management</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
                <a class="app-logo" href="admin"><span class="logo-text" style="font-size: 27px;"><i>Food
                                Review</i></span></a>
            </div>
            <!--//app-branding-->

            <nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
                <ul class="app-menu list-unstyled accordion" id="menu-accordion">
                    <li class="nav-item ">
                        <a class="nav-link" href="shop">
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
                    <li class="nav-item">
                        <a class="nav-link" href="shop-management">
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
                            <span class="nav-link-text">Shop Management</span>
                        </a>
                        <!--//nav-link-->
                    </li>
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
            <h1 class="app-page-title">Shop Management</h1>
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div>
                                    <button type="button" data-bs-toggle="modal" class="btn btn-success"
                                            data-bs-target="#exampleModal">
                                        Add new
                                    </button>
                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-md"
                                             role="document">
                                            <div class="modal-content">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <form action="add-shop" method="POST">
                                                            <h5 class="mb-3">Add New Shop</h5>
                                                            <p class="mb-3" id="add-shop-message"
                                                               style="color: red;text-align: center;font-size: 15px;">${message}</p>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <div class="col-md-10">
                                                                        <label>Shop Name: </label>
                                                                        <input style="margin-left: 60px" type="text"
                                                                               required="true"
                                                                               pattern=".{1,50}"
                                                                               oninvalid="setCustomValidity('Shop Name max 50 charter')"
                                                                               name="shopName"
                                                                               class="form-control"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <div class="col-md-10">
                                                                        <label>Shop Address: </label>
                                                                        <input style="margin-left: 60px" type="text"
                                                                               required="true"
                                                                               pattern=".{1,200}"
                                                                               oninvalid="setCustomValidity('Shop Address max 200 charter')"
                                                                               name="address"
                                                                               class="form-control"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <div class="col-md-10">
                                                                        <label>Shop Description: </label>
                                                                        <input style="margin-left: 60px" type="text"
                                                                               required="true"
                                                                               pattern=".{1,1000}"
                                                                               oninvalid="setCustomValidity('Shop Description max 1000 charter')"
                                                                               name="description"
                                                                               class="form-control"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br/>
                                                            <div style="display: flex;justify-content: space-evenly">
                                                                <button type="submit"
                                                                        style="border: 1px solid;"
                                                                        class="btn btn-success collapsed">
                                                                    Add
                                                                </button>
                                                                <button type="button"
                                                                        style="border: 1px solid;"
                                                                        class="btn btn-outline-success"
                                                                        data-bs-dismiss="modal"
                                                                        data-dismiss="modal">Close
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <form action="shop-management">
                                    <div class="row mt-3 mb-3">
                                        <div class="row" style="padding: 0px;margin: 0px;">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="name">Shop name: </label>
                                                    <input id="name" name="name" type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="name">Status: </label>
                                                    <select id="status" class="form-control"
                                                            name="status">
                                                        <option value="">All
                                                        </option>
                                                        <option value="active">Active</option>
                                                        <option value="inactive">Inactive</option>
                                                    </select>
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
                                            <table id="shop-management-table" class="table table-bordered w-100">
                                                <thead>
                                                <tr>
                                                    <th class="w-stt">No</th>
                                                    <th>Shop Name</th>
                                                    <th>Address</th>
                                                    <th>Description</th>
                                                    <th>Status</th>
                                                    <th>Created Date</th>
                                                    <th>Update Date</th>
                                                    <th class="w-action-3">Function</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listShopByName}" var="shop" varStatus="loop">
                                                    <tr>
                                                        <td>${loop.count}</td>
                                                        <td>${shop.shopName}</td>
                                                        <td>${shop.address}</td>
                                                        <td>${shop.description}</td>
                                                        <td>${shop.status}</td>
                                                        <td class="format-date">(${shop.createdDate})</td>
                                                        <td class="format-date">${shop.updatedDate}</td>
                                                        <td style="text-align: center">
                                                            <a href="#" class="view mr-1" data-toggle="modal"
                                                               data-target="#detail${shop.shopId}" title="Detail">
                                                                <i
                                                                        class="fas fa-eye fa-fw"></i></a>
                                                            <a href="#" class="edit mr-1" data-toggle="modal"
                                                               data-target="#update${shop.shopId}" title="Update">
                                                                <i
                                                                        class="fas fa-pen fa-fw"></i></a>
                                                            <a href="#" class="remove mr-1" data-toggle="modal"
                                                               data-target="#remove${shop.shopId}"
                                                               title="Remove">
                                                                <i
                                                                        class="fas fa-trash fa-fw"></i></a>
                                                        </td>
                                                    </tr>
                                                    <!-- Su kien show chi tiet -->
                                                    <div class="modal fade" id="detail${shop.shopId}" tabindex="-1"
                                                         role="dialog" aria-labelledby="detail${shop.shopId}"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-xl"
                                                             role="document">
                                                            <div class="modal-content">
                                                                <div class="card">
                                                                    <div class="card-body">
                                                                        <h5 class="mb-3">Detail Shop</h5>
                                                                        <div class="row">
                                                                            <div class="col-6 pr-4">
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Shop name: </label>
                                                                                        <textarea class="form-control"
                                                                                                  disabled>${shop.shopName} </textarea>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Address: </label>
                                                                                        <textarea class="form-control"
                                                                                                  disabled>${shop.address} </textarea>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Description: </label>
                                                                                        <textarea class="form-control"
                                                                                                  disabled>${shop.description} </textarea>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-6 pr-4">
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Rate</label>
                                                                                        <span class="form-control"
                                                                                              style="background-color: #e9ecef;"
                                                                                              disabled>${shop.rate}</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Status</label>
                                                                                        <span class="form-control"
                                                                                              style="background-color: #e9ecef;"
                                                                                              disabled>${shop.status}</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Create Date</label>
                                                                                        <span class="form-control format-date"
                                                                                              style="background-color: #e9ecef;"
                                                                                              disabled>${shop.createdDate}</span>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-group row">
                                                                                    <div class="col-sm-12">
                                                                                        <label>Updated Date </label>
                                                                                        <span class="form-control format-date"
                                                                                              style="background-color: #e9ecef;"
                                                                                              disabled>${shop.updatedDate}</span>
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
                                                    <div class="modal fade" id="update${shop.shopId}" tabindex="-1"
                                                         role="dialog" aria-labelledby="update${shop.shopId}"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-xl"
                                                             role="document">
                                                            <div class="modal-content">
                                                                <div class="card">
                                                                    <div class="card-body">
                                                                        <h5 class="mb-3">Update Topic</h5>
                                                                        <form action="update-shop?shopId=${shop.shopId}"
                                                                              method="post"
                                                                              onchange="return validateUpdateForm()">
                                                                            <div class="form-group row">
                                                                                <div class="col-sm-10">
                                                                                    <label>Shop name:</label>
                                                                                    <input id="update-shop-name"
                                                                                           style="margin-left: 60px"
                                                                                           type="text"
                                                                                           class="form-control"
                                                                                           name="shopName"
                                                                                           value="${shop.shopName}"
                                                                                    />
                                                                                    <span id="update-name-message"
                                                                                          style="display: none; color: red; font-size: 14px; text-align: center"></span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <div class="col-sm-10">
                                                                                    <label>Address:</label>
                                                                                    <input style="margin-left: 60px"
                                                                                           type="text"
                                                                                           class="form-control"
                                                                                           name="address"
                                                                                           value="${shop.address}"/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <div class="col-sm-10">
                                                                                    <label>Description:</label>
                                                                                    <input style="margin-left: 60px"
                                                                                           type="text"
                                                                                           class="form-control"
                                                                                           name="description"
                                                                                           value="${shop.description}"/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <div class="col-md-10">
                                                                                    <label>Status: </label>
                                                                                    <div style="display: block; margin-left: 60px">
                                                                                        <input type="radio"
                                                                                               id="status-active"
                                                                                               name="status"
                                                                                               value="active"
                                                                                            ${shop.status == 'active' ? 'checked="checked"' : ''}>
                                                                                        <label for="status-active">Active</label><br>
                                                                                        <input type="radio"
                                                                                               id="status-inactive"
                                                                                               name="status"
                                                                                               value="inactive"
                                                                                            ${shop.status == 'inactive' ? 'checked="checked"' : ''}>
                                                                                        <label for="status-inactive">Inactive</label><br>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div style="display: flex;justify-content: space-evenly">
                                                                                <button type="submit"
                                                                                        style="border: 1px solid;"
                                                                                        class="btn btn-outline-success"
                                                                                        onclick="return validateUpdateForm()">
                                                                                    Change
                                                                                </button>
                                                                                <button type="button"
                                                                                        style="border: 1px solid;"
                                                                                        class="btn btn-outline-success"
                                                                                        data-bs-dismiss="modal"
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
                                                    <div class="modal fade" id="remove${shop.shopId}" tabindex="-1"
                                                         role="dialog" aria-labelledby="remove${shop.shopId}"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-sm"
                                                             role="document">
                                                            <div class="modal-content">
                                                                <div class="card">
                                                                    <div class="card-body">
                                                                        <h5 class="mb-3">Remove Shop</h5>
                                                                        <p style="text-align: center;color: red;">${message}</p>
                                                                        <form action="remove-shop-management?shopId=${shop.shopId}"
                                                                              method="post">
                                                                            <p>Bạn có muốn xóa cửa hàng này không?</p>
                                                                            <br/>
                                                                            <div style="display: flex;justify-content: space-around">
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
        <small class="copyright " style="color: black; ">© 2021 Copyright <i class="fas fa-heart "
                                                                             style="color: #fb866a; "></i> by <a
                class="app-link "
                href="#">food.review.com</a></small>
    </div>
</footer>
<!--//app-footer-->
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
        $('#shop-management-table').DataTable();
        $('.format-date').each(function (i, item) {
            item.innerHTML = formatDate(item.value);
        })
    });

    function formatDate(date) {
        return moment(date).format('DD/MM/YYYY');
    }

    function validateUpdateForm() {
        if (document.getElementById('update-shop-name').value == "") {
            document.getElementById('update-shop-name').style.borderColor = 'red'
            document.getElementById('update-name-message').style.display = 'block'
            document.getElementById('update-name-message').innerHTML = 'Tên không được để trống'
            return false;
        } else if (document.getElementById('update-shop-name').value.length > 100) {
            document.getElementById('update-shop-name').style.borderColor = 'red'
            document.getElementById('update-name-message').style.display = 'block'
            document.getElementById('update-name-message').innerHTML = 'Tên không được dài quá 100 ký tự'
            return false;
        } else {
            document.getElementById('update-shop-name').style.borderColor = '#e7e9ed'
            document.getElementById('update-name-message').style.display = 'none'
        }
    }
</script>
<style>
    .dataTables_paginate > span > a {
        margin-bottom: 0px !important;
        padding: 2px 2px !important;
    }

    .dataTables_paginate > a {
        margin-bottom: 0px !important;
        padding: 2px 2px !important;
    }

    .dataTables_filter {
        display: none;
    }
</style>
</body>
</html>
