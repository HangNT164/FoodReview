$(document).ready(function () {
    createRequestTable([{
        name: "Title1",
        block: "Title1",
        roomNumber: "Title1",
        serviceName: "Title1",
        status: "Title1",
    }, {
        name: "Title1",
        block: "Title1",
        roomNumber: "Title1",
        serviceName: "Title1",
        status: "Title1",
    }, {
        name: "Title1",
        block: "Title1",
        roomNumber: "Title1",
        serviceName: "Title1",
        status: "Title1",
    }]);
});

function createRequestTable(data) {
    $('#request-service-table').DataTable({
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
            width: "5%",
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
                width: "20%",
                className: "text-center",
                title: "Name",
                data: "name"
            },
            {
                name: "Block",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Block",
                data: "block"
            },
            {
                name: "Room Number",
                searchable: true,
                width: "20%",
                className: "text-left",
                title: "Room Number",
                data: "roomNumber"
            },
            {
                name: "Service Name",
                searchable: true,
                width: "19%",
                className: "text-left",
                title: "Service Name",
                data: "serviceName"
            },
            {
                name: "Status",
                searchable: true,
                width: "10%",
                className: "text-left",
                title: "Status",
                data: "status"
            },
            {
                name: "editButton",
                searchable: false,
                width: "11%",
                className: "text-center",
                title: "Function",
                data: null,
                render: function (data, type, full, meta) {
                    return `<div class="container">
                    <div class="row">
                        <div class="col-6" onclick="detailRequest(${meta.row})" style="text-align:right;padding-right:0px;">
                            <a href="#" class="view mr-1" data-target="#detail-apartment-card" title="Quick Detail" data-toggle="modal">
                                <i class="fas fa-eye fa-fw"></i>
                            </a>
                        </div>
                        <div class="col-6" onclick="updateRequest(${meta.row})" style="text-align:left;padding-left:0px;">
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

function detailRequest(index) {
    $("#service-request-detail").modal('show');
}

function updateRequest(index) {
    $("#service-request-update").modal('show');
}