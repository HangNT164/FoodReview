$(document).ready(function () {
    createParkingCardTable([{
        vehicleOwner: "Title1",
        vehicleName: "Title1",
        type: "Title1",
        color: "Title1",
        licensePlates: "Title1",
        status: "Title1",
    }, {
        vehicleOwner: "Title1",
        vehicleName: "Title1",
        type: "Title1",
        color: "Title1",
        licensePlates: "Title1",
        status: "Title1",
    }, {
        vehicleOwner: "Title1",
        vehicleName: "Title1",
        type: "Title1",
        color: "Title1",
        licensePlates: "Title1",
        status: "Title1",
    }]);
});

function createParkingCardTable(data) {
    $('#parking-card-table').DataTable({
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
                name: "Vehicle Owner",
                searchable: true,
                width: "15%",
                className: "text-center",
                title: "Vehicle Owner",
                data: "vehicleOwner"
            },
            {
                name: "Vehicle Name",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Vehicle Name",
                data: "vehicleName"
            },
            {
                name: "Type",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Type",
                data: "type"
            },
            {
                name: "Color",
                searchable: true,
                width: "23%",
                className: "text-left",
                title: "Color",
                data: "color"
            },
            {
                name: "License Plates",
                searchable: true,
                width: "9%",
                className: "text-left",
                title: "License Plates",
                data: "licensePlates"
            },
            {
                name: "Status",
                searchable: true,
                width: "9%",
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
                        <div class="col-4" onclick="detailParkingCard(${meta.row})">
                            <a href="#" class="view mr-1" data-target="#detail-apartment-card" title="Quick Detail" data-toggle="modal">
                                <i class="fas fa-eye fa-fw"></i>
                            </a>
                        </div>
                        <div class="col-4" onclick="updateParkingCard(${meta.row})">
                            <a href="#" class="edit mr-1" data-toggle="modal" data-target="#update-apartment-card" title="Update">
                                <i class="fas fa-pen fa-fw"></i></a>
                        </div>
                        <div class="col-4" onclick="removeParkingCard(${meta.row})">
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

function detailParkingCard(index) {
    $("#parking-card-detail").modal('show');
}

function updateParkingCard(index) {
    $("#parking-card-update").modal('show');
}

function removeParkingCard(index) {
    $("#parking-card-remove").modal('show');
}