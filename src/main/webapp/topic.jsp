<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Food Review | Topic Management</title>

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
    <link rel="stylesheet" href="resources/css/custom/notficaition-table.css">
    <link rel="stylesheet" href="resources/css/custom/footer.css">
    <link rel="stylesheet" href="resources/css/plugin/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="resources/css/custom/apartment-card.css">
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
                                <li><a class="dropdown-item" href="account.jsp">Account</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="login.jsp">Log Out</a></li>
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
                        <a class="nav-link " href="user.jsp">
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
                        <a class="nav-link active" href="topic.jsp">
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

            <h1 class="app-page-title">Topic Management</h1>
            <div class="animated fadeIn">

                <div class="row">

                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-body">
                                <div class="row mt-3 mb-3">
                                    <div class="row" style="padding: 0px;margin: 0px;">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="name">Name:</label><br>
                                                <input id="name" name="name" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="phoneNumber">Phone Number:</label><br>
                                                <input id="phoneNumber" name="phoneNumber" type="text"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="identifyCard">Identify Card:</label><br>
                                                <input id="identifyCard" name="identifyCard" type="text"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="codeCard">Code Card:</label><br>
                                                <input id="codeCard" name="codeCard" type="text"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="status">Status:</label><br>
                                                <select class="form-select" aria-label="Default select example">
                                                    <option selected>--------</option>
                                                    <option value="1">One</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-1" style="margin-top: 30px;">
                                            <button type="button"
                                                    style="background-color: transparent;border-color: transparent;">
                                                <img
                                                        src="resources/images/search.png" alt="Search"></button>
                                        </div>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-11"></div>
                                    <div class="col-md-1" style="display: grid;">
                                        <button type="button" class="btn btn-success collapsed"
                                                onclick="openDialogApartmentAdd();">
                                            Add Card
                                        </button>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div style="max-height: 600px; overflow: auto;">
                                        <div class="table-responsive">
                                            <table id="apartment-card-table"
                                                   class="table table-striped table-bordered" cellspacing="0"
                                                   width="100%">
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
<!-- Add Modal -->
<div class="modal fade" id="apartment-card-add" tabindex="-1" role="dialog"
     aria-labelledby="apartment-card-add-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="apartment-card-add-title">Add Apartment Card</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        onclick="removeDataAdd();">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <div class="custom-div-right">Name:</div>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <input type="text" class="form-control" id="name" name="name"/>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <div class="custom-div-right">Phone Number:</div>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <input type="text" class="form-control" id="phone-number" name="phone-number"/>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <div class="custom-div-right">Identify Card:</div>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <input type="text" class="form-control" id="identify-card" name="identify-card"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save changes</button>
                <button type="button" class="btn btn-secondary"
                        onclick="closeDialog($(`#apartment-card-add`));">Close
                </button>
            </div>
        </div>
    </div>
</div>
<!-- End Add Modal -->

<!-- Detail Modal -->
<div class="modal fade" id="apartment-card-detail" tabindex="-1" role="dialog"
     aria-labelledby="apartment-card-detail-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="apartment-card-detail-title">Detail Apartment Card</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        onclick="closeDialog($(`#apartment-card-detail`));">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <div class="custom-div-right">Name:</div>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <input type="text" class="form-control" id="name" name="name"/>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <div class="custom-div-right">Phone Number:</div>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <input type="text" class="form-control" id="phone-number-detail" name="phone-number"/>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <div class="custom-div-right">Identify Card:</div>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <input type="text" class="form-control" id="identify-card-detail" name="identify-card"/>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <div class="custom-div-right">Code Card :</div>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <input type="text" class="form-control" id="code-card-detail" name="code-card"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        onclick="closeDialog($(`#apartment-card-detail`));">Close
                </button>
            </div>
        </div>
    </div>
</div>
<!-- End Detail Modal -->

<!-- Update Modal -->
<div class="modal fade" id="apartment-card-update" tabindex="-1" role="dialog"
     aria-labelledby="apartment-card-update-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="apartment-card-update-title">Update Apartment Card</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        onclick="closeDialog($(`#apartment-card-update`));">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <div class="custom-div-right">Status:</div>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <select class="form-select" aria-label="Default select example">
                            <option select value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save changes</button>
                <button type="button" class="btn btn-secondary"
                        onclick="closeDialog($(`#apartment-card-update`));">Close
                </button>
            </div>
        </div>
    </div>
</div>
<!-- End Update Modal -->

<!-- Remove Modal -->
<div class="modal fade" id="apartment-card-remove" tabindex="-1" role="dialog"
     aria-labelledby="apartment-card-remove-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="apartment-card-remove-title">Remove Apartment Card</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        onclick="closeDialog($(`#apartment-card-remove`));">
                    <span aria-hidden="true ">&times;</span>
                </button>
            </div>
            <div class="modal-body ">
                <div class="container">
                    <p style=" text-align: center;
                        font-size: 20px;
                        color: black;">Do you want to remove this card?</p>
                </div>
            </div>
            <div class="modal-footer ">
                <button type="button " class="btn btn-danger ">Yes</button>
                <button type="button " class="btn btn-secondary "
                        onclick="closeDialog($(`#apartment-card-remove`));">No
                </button>
            </div>
        </div>
    </div>
</div>
<!-- End Remove Modal -->

<footer class="footer ">
    <div class="container text-center py-3 ">
        <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
        <small class="copyright " style="color: black; ">© 2021 Copyright <i class="fas fa-heart "
                                                                             style="color: #fb866a; "></i> by <a
                class="app-link "
                href="index.jsp ">ams.building.com</a></small>

    </div>
</footer>
<!--//app-footer-->

</div>
<!--//app-wrapper-->

<!-- Javascript -->
<script src="resources/js/plugin/jquery-3.3.1.slim.min.js " type="text/javascript "></script>
<script src="resources/js/plugin/jquery.min.js "></script>
<script src="resources/js/plugin/popper.min.js "></script>
<script src="resources/js/plugin/jquery-3.5.1.js "></script>
<script src="resources/js/plugin/jquery.dataTables.min.js "></script>
<script src="resources/js/plugin/dataTables.bootstrap4.min.js "></script>
<script src="resources/plugins/popper.min.js "></script>
<script src="resources/plugins/bootstrap/js/bootstrap.min.js "></script>

<!-- Charts JS -->
<script src="resources/plugins/chart.js/chart.min.js "></script>

<!-- Page Specific JS -->
<script src="resources/js/custom/app.js "></script>

<script src="resources/js/custom/apartment-card-table.js "></script>
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="resources/js/plugin/bootstrap-datepicker.min.js "></script>
</body>

</html>