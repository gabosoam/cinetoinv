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
            read: { url: "/report/read", dataType: "json" }
        },
        schema: {
          model:{
            fields:{
              admission: { type: "date" }
            }
          }
        },
        batch: true,
        pageSize: 10,
        serverFiltering: false
    },
    );

    $("#grid").kendoGrid({
        dataSource: dataSource,
        height: 700,
        filterable: true,
        pageable: { refresh: true, pageSizes: true, },
        toolbar: ['pdf','excel'],
        columns: [
            { field: "code", title: "Código", filterable: { multi: true, search: true, search: true } },
            { field: "barcode", title: "Número de serie", filterable: { multi: true, search: true, search: true } },
            { field: "description", title: "Producto", filterable: { multi: true, search: true, search: true } },
            { field: "admission", title: "Fecha de ingreso",  filterable: { search: true } },
            { field: "brand", title: "Marca", filterable: { multi: true, search: true, search: true } },
            { field: "category", title: "Categoría", filterable: { multi: true, search: true, search: true } }],
        editable: "inline"
    });
});
function redirect(location) {
    window.location.href = location;
}
