$(document).ready(function () {
    createDepartmentTable([{
        title: "Title1",
        departmentName: "description1",
        departmentManager: "16/04/1999",
        phoneNumber: "0942578685"
    }, {
        title: "Title1",
        departmentName: "description1",
        departmentManager: "16/04/1999",
        phoneNumber: "0942578685"
    }]);
    createDepartmentTableDetail([{
        name: "Title1",
        phoneNumber: "description1",
        address: "16/04/1999",
        address: "aaa",
        email: "aaa",
        identifyCard: "dd",
        manager: "Manager"
    }, {
        name: "Title1",
        phoneNumber: "description1",
        address: "16/04/1999",
        address: "aaa",
        email: "aaa",
        identifyCard: "dd",
        manager: "Employee"
    }, {
        name: "Title1",
        phoneNumber: "description1",
        address: "16/04/1999",
        address: "aaa",
        email: "aaa",
        identifyCard: "dd",
        manager: "Employee"
    }]);
    createDepartmentTableUpdate(null);
});

function createDepartmentTable(data) {
    $('#department-table').DataTable({
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
                name: "Department Name",
                searchable: true,
                width: "30%",
                className: "text-center",
                title: "Department Name",
                data: "departmentName"
            },
            {
                name: "Department Manager",
                searchable: true,
                width: "30%",
                className: "text-left",
                title: "Department Manager",
                data: "departmentManager"
            },
            {
                name: "Phone Number",
                searchable: true,
                width: "22%",
                className: "text-left",
                title: "Phone Number",
                data: "phoneNumber"
            },
            {
                name: "editButton",
                searchable: false,
                width: "8%",
                className: "text-center",
                title: "Function",
                data: null,
                render: function (data, type, full, meta) {
                    return `<div class="container">
                    <div class="row">
                        <div class="col-6" onclick="detailDepartment(${meta.row})" style="text-align:right; padding-right:0px;">
                            <a href="#" class="view mr-1" data-target="#detail-apartment-card" title="Quick Detail" data-toggle="modal">
                                <i class="fas fa-eye fa-fw"></i>
                            </a>
                        </div>
                        <div class="col-6" onclick="updateDepartment(${meta.row})" style="text-align:left;padding-left:0px;">
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

function detailDepartment() {
    $("#department-detail").modal('show');
}

function updateDepartment() {
    $("#department-update").modal('show');
}

function createDepartmentTableDetail(data) {
    $('#department-table-detail').DataTable({
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

function createDepartmentTableUpdate(data) {
    $('#department-table-update').DataTable({
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