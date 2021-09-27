$(document).ready(function () {
    createAbsentTable(null);
});

function createAbsentTable(data) {
    $('#absent-table').DataTable({
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
                width: "15%",
                className: "text-center",
                title: "Name",
                data: "name"
            },
            {
                name: "Identify Card ",
                searchable: true,
                width: "15%",
                className: "text-center",
                title: "Identify Card",
                data: "identifyCard"
            },
            {
                name: "Address",
                searchable: true,
                width: "15%",
                className: "text-center",
                title: "Address",
                data: "address"
            },
            {
                name: "Home Town",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Home Town",
                data: "homeTown"
            },
            {
                name: "Block",
                searchable: true,
                width: "5%",
                className: "text-center",
                title: "Block",
                data: "block"
            },
            {
                name: "Room Number",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Room Number",
                data: "roomNumber"
            },
            {
                name: "Start Date",
                searchable: true,
                width: "12%",
                className: "text-center",
                title: "Start Date",
                data: "startDate"
            },
            {
                name: "End Date",
                searchable: true,
                width: "13%",
                className: "text-center",
                title: "End Date",
                data: "endDate"
            },
        ],
        "bLengthChange": false,
    });
}