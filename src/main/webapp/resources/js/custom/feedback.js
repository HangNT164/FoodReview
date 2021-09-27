$(document).ready(function () {
    createFeedbackTable([{
        name: "Name1",
        description: "description1",
        date: "16/04/1999"
    }, {
        name: "Name1",
        description: "description1",
        date: "16/04/1999"
    }, {
        name: "Name1",
        description: "description1",
        date: "16/04/1999"
    }, {
        name: "Name1",
        description: "description1",
        date: "16/04/1999"
    }, {
        name: "Name1",
        description: "description1",
        date: "16/04/1999"
    }]);
});

function createFeedbackTable(data) {
    $('#feedback-table').DataTable({
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
                width: "20%",
                className: "text-center",
                title: "Name",
                data: "name"
            },
            {
                name: "Description",
                searchable: true,
                width: "40%",
                className: "text-left",
                title: "Description",
                data: "description"
            },
            {
                name: "Date",
                searchable: true,
                width: "30%",
                className: "text-left",
                title: "Date",
                data: "date"
            },
        ],
        "bLengthChange": false,
    });
}