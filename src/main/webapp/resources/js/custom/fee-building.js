$(document).ready(function () {
    createFeeBuildingTable(null);
});

function createFeeBuildingTable(data) {
    $('#fee-building-table').DataTable({
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
                name: "Electric Fee",
                searchable: true,
                width: "25%",
                className: "text-center",
                title: "Electric Fee",
                data: "electricFee"
            },
            {
                name: "Water Fee",
                searchable: true,
                width: "25%",
                className: "text-center",
                title: "Water Fee",
                data: "waterFee"
            },
            {
                name: "Service Fee",
                searchable: true,
                width: "20%",
                className: "text-center",
                title: "Service Fee",
                data: "serviceFee"
            },
            {
                name: "Month",
                searchable: true,
                width: "20%",
                className: "text-center",
                title: "Month",
                data: "month"
            },
        ],
        "bLengthChange": false,
    });
}