$(document).ready(function () {
    createServiceTable([{
        serviceName: "Title1",
        subName: "Title1"
    }, {
        serviceName: "Title1",
        subName: "Title1"
    }, {
        serviceName: "Title1",
        subName: "Title1"
    }]);
});

function createServiceTable(data) {
    $('#service-table').DataTable({
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
                name: "Service Name",
                searchable: true,
                width: "40%",
                className: "text-center",
                title: "Service Name",
                data: "serviceName"
            },
            {
                name: "Sub Service Name",
                searchable: true,
                width: "40%",
                className: "text-left",
                title: "SubService Name",
                data: "subName"
            },
            {
                name: "editButton",
                searchable: false,
                width: "10%",
                className: "text-center",
                title: "Function",
                data: null,
                render: function (data, type, full, meta) {
                    return `<div class="container" onclick="detailService(${meta.row})">
                                <a href="#" class="view mr-1" data-target="#detail-apartment-card" title="Quick Detail" data-toggle="modal">
                                    <i class="fas fa-eye fa-fw"></i>
                                </a>
                            </div>`
                }
            },
        ],
        "bLengthChange": false,
    });
}

function detailService(index) {
    $("#service-detail").modal('show');
}