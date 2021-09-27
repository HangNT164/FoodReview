$(document).ready(function () {
    createResidentTable([{
        name: "Title1",
        phoneNumber: "16/04/1999",
        room: "16/04/1999",
    },]);
});

function createResidentTable(data) {
    $('#resident-table').DataTable({
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
                width: "25%",
                className: "text-center",
                title: "Name",
                data: "name"
            },
            {
                name: "Phone Number",
                searchable: true,
                width: "25%",
                className: "text-left",
                title: "Phone Number",
                data: "phoneNumber"
            },
            {
                name: "Room Number",
                searchable: true,
                width: "25%",
                className: "text-left",
                title: "Room Number",
                data: "room"
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
                        <div class="col-4" onclick="detailResident(${meta.row})">
                            <a href="#" class="view mr-1" data-target="#detail-apartment-card" title="Quick Detail" data-toggle="modal">
                                <i class="fas fa-eye fa-fw"></i>
                            </a>
                        </div>
                        <div class="col-4" onclick="updateResident(${meta.row})">
                            <a href="#" class="edit mr-1" data-toggle="modal" data-target="#update-apartment-card" title="Update">
                                <i class="fas fa-pen fa-fw"></i></a>
                        </div>
                        <div class="col-4" onclick="removeResident(${meta.row})">
                            <a href="#" class="remove mr-1" data-toggle="modal" data-target="#remove-apartment-card" title="Remove">
                                <i class="fas fa-trash fa-fw"></i></a>
                        </div>
                    </div>
                </div>`
                }
            },
        ],
        "bLengthChange": false,
    });
}

function detailResident() {
    $("#resident-detail").modal('show');
}

function updateResident() {
    $("#resident-update").modal('show');
}

function removeResident() {
    $("#resident-remove").modal('show');
}