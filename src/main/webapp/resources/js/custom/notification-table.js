$(document).ready(function () {
    createNotificationTable([{
        title: "Title1",
        description: "description1",
        date: "16/04/1999"
    }, {
        title: "Title2",
        description: "description1",
        date: "16/04/1999"
    }, {
        title: "Title3",
        description: "description1",
        date: "16/04/1999"
    }, {
        title: "Title3",
        description: "description1",
        date: "16/04/1999"
    }, {
        title: "Title4",
        description: "description1",
        date: "16/04/1999"
    }]);

    $('#start-date').datepicker({
        format: 'yyyy-mm',
        startView: "months",
        minViewMode: "months",
        startDate: "1970-01",
        endDate: "2099-12",
        autoclose: true,
        orientation: "bottom auto",
        defaultDate: new Date(),
        todayHighlight: true,
        setDate: new Date()
    });
});

function createNotificationTable(data) {
    $('#notification-table').DataTable({
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
                name: "Title",
                searchable: true,
                width: "20%",
                className: "text-center",
                title: "Title",
                data: "title"
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

function removeDataAdd() {
    $("#notification-add").modal('hide');
    $('#notification-title').val('');
    $('#notification-description').val('');
}

function openDialogAddNotfication() {
    $("#notification-add").modal('show');
}