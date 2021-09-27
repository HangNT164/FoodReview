$(document).ready(function () {
    createFeeApartmentTable(null);
});

function createFeeApartmentTable(data) {
    $('#fee-apartment-table').DataTable({
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
                name: "Block",
                searchable: true,
                width: "5%",
                className: "text-center",
                title: "Block",
                data: "block"
            },
            {
                name: "Room Name",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Room Name",
                data: "roomName"
            },
            {
                name: "Service Name",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Service Name",
                data: "serviceName"
            },
            {
                name: "Service Price",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Service Price",
                data: "servicePrice"
            },
            {
                name: "Vehicle Type",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Vehicle Type",
                data: "vehicleType"
            },
            {
                name: "Quantity Vehicle",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Quantity Vehicle",
                data: "quantityVehicle"
            },
            {
                name: "Vehicle Price",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Vehicle Price",
                data: "vehiclePricce"
            },
            {
                name: "Quantity Apratment Card",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Quantity Apartment Card",
                data: "quantityApartmentCard"
            },
            {
                name: "Card Price",
                searchable: true,
                width: "10%",
                className: "text-center",
                title: "Card Price",
                data: "cardPrice"
            },
            {
                name: "Month",
                searchable: true,
                width: "5%",
                className: "text-center",
                title: "Month",
                data: "month"
            },
            {
                name: "Status",
                searchable: true,
                width: "5%",
                className: "text-center",
                title: "Status",
                data: "status"
            },

        ],
        "bLengthChange": false,
    });
}

function removeDataAdd() {
    $("#fee-apartment-add").modal('hide');
}

function openSendNoficationMonth() {
    $("#fee-apartment-add").modal('show');
}