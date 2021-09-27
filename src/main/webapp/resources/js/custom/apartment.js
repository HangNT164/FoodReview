$(document).ready(function () {
    createResidentTable([{
        block: "Title1",
        roomName: "description1",
        householderName: "16/04/1999",
    },]);
});

const template = ` <div class="relative">
<div class="row">
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-3">
                <div class="custom-div-right">Name:</div>
            </div>
            <div class="col-md-9">
                <input type="text" class="form-control" id="name-update" name="name-update" />
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-3">
                <div class="custom-div-right">Gender:</div>
            </div>
            <div class="col-md-9" style="margin: auto;">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="male" value="option1" checked>
                    <label class="form-check-label" for="male">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="female" value="option2">
                    <label class="form-check-label" for="gemale">Female</label>
                </div>
            </div>
        </div>
    </div>
</div>
<br/>
<div class="row">
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-3">
                <div class="custom-div-right">Identity Card:</div>
            </div>
            <div class="col-md-9">
                <input type="text" class="form-control" id="name-update" name="name-update" />
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-3">
                <div class="custom-div-right">DOB:</div>
            </div>
            <div class="col-md-9">
                <div id="dp-range">
                    <div class="input-daterange input-group" id="datepicker">
                        <input type="text" class="form-control" autocomplete="off" id="start-date" readonly="readonly">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br/>
<div class="row">
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-3">
                <div class="custom-div-right">Phone:</div>
            </div>
            <div class="col-md-9">
                <input type="text" class="form-control" id="name-update" name="name-update" />
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-3">
                <div class="custom-div-right">Relative:</div>
            </div>
            <div class="col-sm-9 col-xs-9">
                <select class="form-select" aria-label="Default select example">
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>
            </div>
        </div>
    </div>
</div>
<br/>

<hr class="md-5">

</div>`;

function createResidentTable(data) {
    $('#apartment-table').DataTable({
        destroy: true,
        responsive: true,
        autoWidth: false,
        deferRender: true,
        scrollCollapse: true,
        scrollY: "350px",
        data: (data) ? data : [],
        columns: [{
            name: "No",
            searchable: false,
            width: "10%",
            className: "text-center",
            title: "No",
            data: null,
            render: function (data, type, full, meta) {
                return meta.row + 1
            }
        },
            {
                name: "Block",
                searchable: true,
                width: "20%",
                className: "text-center",
                title: "Block",
                data: "block"
            },
            {
                name: "Room Name",
                searchable: true,
                width: "20%",
                className: "text-left",
                title: "Room Name",
                data: "roomName"
            },
            {
                name: "Householder Name",
                searchable: true,
                width: "40%",
                className: "text-left",
                title: "Householder Name",
                data: "householderName"
            },
            {
                name: "editButton",
                searchable: false,
                width: "10%",
                className: "text-center",
                title: "Function",
                data: null,
                render: function (data, type, full, meta) {
                    return `<div class="container">
                    <div class="row">
                        <div class="col-6" style=" padding-right: 0px;text-align: right;" onclick="detailApartment(${meta.row})" >
                            <a href="#" class="view mr-1" data-target="#detail-apartment-card" title="Quick Detail" data-toggle="modal">
                                <i class="fas fa-eye fa-fw"></i>
                            </a>
                        </div>
                        <div class="col-6" style=" padding-left: 0px;text-align: leftl" onclick="updateApartment(${meta.row})" >
                            <a href="#" class="edit mr-1" data-toggle="modal" data-target="#update-apartment-card" title="Update">
                                <i class="fas fa-pen fa-fw"></i></a>
                        </div>
                    </div>
                </div>`
                }
            },
        ],
        "bLengthChange": false,
    });
}

function createApartmentTableDetail(data) {
    $('#apartment-table-detail').DataTable({
        destroy: true,
        responsive: true,
        autoWidth: false,
        deferRender: true,
        scrollCollapse: true,
        data: (data) ? data : [],
        columns: [{
            name: "No",
            searchable: false,
            width: "15%",
            className: "text-center",
            title: "No",
            data: null,
            render: function (data, type, full, meta) {
                return meta.row + 1
            }
        },
            {
                name: "Name",
                searchable: true,
                width: "15%",
                className: "text-center",
                title: "Name",
                data: "name"
            },
            {
                name: "Phone",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Phone",
                data: "phoneNumber"
            },
            {
                name: "Address",
                searchable: true,
                width: "25%",
                className: "text-left",
                title: "Address",
                data: "address"
            },
            {
                name: "Email",
                searchable: true,
                width: "20%",
                className: "text-left",
                title: "Email",
                data: "email"
            },
            {
                name: "Identify",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Identify",
                data: "identifyCard"
            },
            {
                name: "Manager",
                searchable: true,
                width: "5%",
                className: "text-left",
                title: "Manager",
                data: "manager"
            },
        ],
        "bLengthChange": false,
    });
}

function createApartmentTableUpdate(data) {
    $('#apartment-update').DataTable({
        destroy: true,
        responsive: true,
        autoWidth: false,
        deferRender: true,
        scrollCollapse: true,
        data: (data) ? data : [],
        columns: [{
            name: "No",
            searchable: false,
            width: "15%",
            className: "text-center",
            title: "No",
            data: null,
            render: function (data, type, full, meta) {
                return meta.row + 1
            }
        },
            {
                name: "Name",
                searchable: true,
                width: "15%",
                className: "text-center",
                title: "Name",
                data: "name"
            },
            {
                name: "Phone",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Phone",
                data: "phoneNumber"
            },
            {
                name: "Address",
                searchable: true,
                width: "25%",
                className: "text-left",
                title: "Address",
                data: "address"
            },
            {
                name: "Email",
                searchable: true,
                width: "20%",
                className: "text-left",
                title: "Email",
                data: "email"
            },
            {
                name: "Identify",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Identify",
                data: "identifyCard"
            },
            {
                name: "Manager",
                searchable: true,
                width: "5%",
                className: "text-left",
                title: "Manager",
                data: "manager"
            },
        ],
        "bLengthChange": false,
    });
}

function createTableAddConfirm(data) {
    $('#apartment-add').DataTable({
        destroy: true,
        responsive: true,
        autoWidth: false,
        deferRender: true,
        scrollCollapse: true,
        data: (data) ? data : [],
        columns: [{
            name: "No",
            searchable: false,
            width: "15%",
            className: "text-center",
            title: "No",
            data: null,
            render: function (data, type, full, meta) {
                return meta.row + 1
            }
        },
            {
                name: "Name",
                searchable: true,
                width: "15%",
                className: "text-center",
                title: "Name",
                data: "name"
            },
            {
                name: "Phone",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Phone",
                data: "phoneNumber"
            },
            {
                name: "Address",
                searchable: true,
                width: "25%",
                className: "text-left",
                title: "Address",
                data: "address"
            },
            {
                name: "Email",
                searchable: true,
                width: "20%",
                className: "text-left",
                title: "Email",
                data: "email"
            },
            {
                name: "Identify",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Identify",
                data: "identifyCard"
            },
            {
                name: "Manager",
                searchable: true,
                width: "5%",
                className: "text-left",
                title: "Manager",
                data: "manager"
            },
        ],
        "bLengthChange": false,
    });
}

function openUpdateRelation() {
    $("#apartment-update-second").modal('show');
    $("#apartment-update-first").modal('hide');

}

function backDepartmentAddFirst() {
    $("#apartment-update-first").modal('show');
    $("#apartment-update-second").modal('hide');

}

function confirmDataUpdate() {
    $("#apartment-update-second").modal('hide');
    $("#apartment-update-confirm").modal('show');
    createApartmentTableUpdate(null);
}

function removePanelRelative() {
    $(".template").detach();
}

function addPanelRelative() {
    $("#body").append(template);
}


function detailApartment() {
    $("#apartment-detail").modal('show');
    createApartmentTableDetail(null);
}

function updateApartment() {
    $("#apartment-update-first").modal('show');
}

function addApartment() {
    $("#apartment-add-first").modal('show');
}

function openDialodAddSecond() {
    $("#apartment-add-first").modal('hide');
    $("#apartment-add-second").modal('show');
}

function openDialodAddThrid() {
    $("#apartment-add-second").modal('hide');
    $("#apartment-add-thrid").modal('show');
}

function openDialodAddFirst() {
    $("#apartment-add-second").modal('hide');
    $("#apartment-add-first").modal('show');
}

function backModalThird() {
    $("#apartment-add-thrid").modal('hide');
    $("#apartment-add-second").modal('show');
}

function confirmModalAdd() {
    $("#apartment-add-thrid").modal('hide');
    $("#apartment-add-confirm").modal('show');
    createTableAddConfirm(null);
}