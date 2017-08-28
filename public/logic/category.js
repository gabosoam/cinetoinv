var roles = [{
    "value": 1,
    "text": "Usuario"
}, {
    "value": 2,
    "text": "Administrador"
}];



kendo.culture("es-ES");
$(document).ready(function () {

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/category/read", dataType: "json" },
            update: { url: "/category/update", type: "POST", dataType: "json" },
            destroy: { url: "/category/delete", type: "POST", dataType: "json" },
            create: { url: "/category/create", type: "POST", dataType: "json" },
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
                    name: { validation: { required: true, }, type: 'string' }
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
            { field: "name", title: "Categoría", filterable: { multi: true, search: true, search: true } },
            { command: ["edit", "destroy"], title: "Acciones", width: '200px' }],
        editable: "inline"
    });
});
function redirect(category) {
    window.location.href = category;
}
