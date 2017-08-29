

kendo.culture("es-ES");
$(document).ready(function () {

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/model/read", dataType: "json" },
            update: { url: "/model/update", type: "POST", dataType: "json" },
            destroy: { url: "/model/delete", type: "POST", dataType: "json" },
            create: { url: "/model/create", type: "POST", dataType: "json" },
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
                id: "code",
                fields: {
                    code: { nullable:false,  validation: { required: true, size:13 }},
                    description: { validation: { required: true, size:13 }, type: 'string' },
                    stockmin: { validation: { required: true, }, type: 'string' },
                    unit: { validation: { required: true, }, type: 'string' },
                    brand: { validation: { required: true, }, type: 'string' },
                    category: { validation: { required: true, }, type: 'string' }
                }
            }
        }
    },
    );

    var socket = io.connect();
    socket.emit('getDates', function (category, brand,unit) {
      $("#grid").kendoGrid({
          dataSource: dataSource,
          height: 475,
          filterable: true,
          pageable: { refresh: true, pageSizes: true, },
          toolbar: ['create','excel'],
          columns: [
              { field: "code", title: "Código", filterable: {search: true } },
              { field: "description", title: "Producto",width: '270px', filterable: { multi: true, search: true, search: true } },
              { field: "brand", values:brand, title: "Marca", filterable: {search: true, search: true } },
              { field: "category", values:category, title: "Categoría", filterable: {search: true, search: true } },
              { field: "stockmin", title: "Stock mínimo", filterable: { search: true } },
              { field: "unit", values:unit, title: "Unidad de medida", filterable: { multi: true, search: true, search: true } },

              { command: ["edit", "destroy"], title: "Acciones" }],
          editable: "popup"
      });

    })


});
function redirect(location) {
    window.location.href = location;
}
