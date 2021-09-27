$(document).ready(function () {
    createApartmentCardTable([{
        title: "Title1",
        phoneNumber: "description1",
        identifyCard: "16/04/1999",
        codeCard: "16/04/1999",
        status: "16/04/1999",
    }, {
        title: "Title1",
        phoneNumber: "description1",
        identifyCard: "16/04/1999",
        codeCard: "16/04/1999",
        status: "16/04/1999",
    }]);
});

function createApartmentCardTable(data) {
    $('#apartment-card-table').DataTable({
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
                name: "Name",
                searchable: true,
                width: "15%",
                className: "text-center",
                title: "Title",
                data: "title"
            },
            {
                name: "Phone Number",
                searchable: true,
                width: "15%",
                className: "text-left",
                title: "Phone Number",
                data: "phoneNumber"
            },
            {
                name: "Identify Card",
                searchable: true,
                width: "20%",
                className: "text-left",
                title: "Identify Card",
                data: "identifyCard"
            },
            {
                name: "Code Card",
                searchable: true,
                width: "20%",
                className: "text-left",
                title: "Code Card",
                data: "codeCard"
            },
            {
                name: "Status",
                searchable: true,
                width: "5%",
                className: "text-left",
                title: "Status",
                data: "status"
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
                        <div class="col-4" onclick="detailApartmentCard(${meta.row})">
                            <a href="#" class="view mr-1" data-target="#detail-apartment-card" title="Quick Detail" data-toggle="modal">
                                <i class="fas fa-eye fa-fw"></i>
                            </a>
                        </div>
                        <div class="col-4" onclick="updateApartmentCard(${meta.row})">
                            <a href="#" class="edit mr-1" data-toggle="modal" data-target="#update-apartment-card" title="Update">
                                <i class="fas fa-pen fa-fw"></i></a>
                        </div>
                        <div class="col-4" onclick="removeApartmentCard(${meta.row})">
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

function removeDataAdd() {
    $("#apartment-card-add").modal('hide');
    $('#identify-card').val('');
    $('#phone-number').val('');
    $('#name').val('');
}

function openDialogApartmentAdd() {
    $("#apartment-card-add").modal('show');
}

function detailApartmentCard(index) {
    $("#apartment-card-detail").modal('show');
}

function updateApartmentCard(index) {
    $("#apartment-card-update").modal('show');
}

function removeApartmentCard(index) {
    $("#apartment-card-remove").modal('show');
}