var types = [{
    "value": 1,
    "text": "FACTURA"
}, {
    "value": 2,
    "text": "ACTA"
}];



kendo.culture("es-ES");
$(document).ready(function () {

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/voucher/read", type: "GET", dataType: "json" },
            update: { url: "/voucher/update", type: "POST", dataType: "json" },
            destroy: { url: "/voucher/delete", type: "POST", dataType: "json" },
            create: { url: "/voucher/create", type: "POST", dataType: "json" },
            parameterMap: function (options, operation) {
                if (operation !== "read" && options.models) {
                    var datos = options.models[0]
                    return datos;
                }
            }
        },
        batch: true,
        pageSize: 10,
        serverFiltering: false,
        schema: {
            model: {
                id: "id",
                fields: {
                    client: { validation: { required: true, }, type: 'number' },
                    date: {validation: {type: 'date'}},
                    reference: {type: 'string'}
                }
            }
        }
    },
    );

    $("#grid").kendoGrid({
        dataSource: dataSource,
        height: 475,
        filterable: true,
        pageable: { refresh: true, pageSizes: true, },
        toolbar: ['create','excel'],
        columns: [
            { field: "client", title: "Cliente" },
            { field: "date", title: "Fecha"},
            { field: "reference", title: "Referencia", filterable: {search: true } },
            { command: ["edit", "destroy"], title: "Acciones" }],
        editable: "inline"
    });
});
