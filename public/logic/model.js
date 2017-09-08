

kendo.culture("es-ES");
$(document).ready(function () {
    var socket = io.connect();
    socket.emit('getDates', function (category, brand,unit) {
    dataSource = new kendo.data.DataSource({
        transport:{
            read: {url:"/model/read", dataType: "json"},
            create: {url:"/model/create",type:"POST", dataType: "json"},
            destroy: { url: "/model/delete", type: "POST", dataType: "json" },
            update: { url: "/model/update", type: "POST", dataType: "json" },
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
                    code: { validation: { required: true, size:13 }, type: 'string' },
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

    
    
      $("#grid").kendoGrid({
          dataSource: dataSource,
          height: 475,
          filterable: true,
          columnMenu: true,
          groupable: true,
          
          pageable: { refresh: true, pageSizes: true, },
          toolbar: ['create','excel'],
          
       
          columns: [
              { field: "code", title: "Código", filterable: {search: true } },
              { field: "description", title: "Producto",width: '270px', filterable: { search: true } },
              { field: "brand", values:brand, title: "Marca", filterable: {search: true, search: true } },
              { field: "category", values:category, title: "Categoría", filterable: {search: true, search: true } },
              { field: "stockmin", title: "Stock mínimo", filterable: { search: true } },
              { field: "unit", values:unit, title: "Unidad de medida", filterable: { search: true } },

              { command: ["edit", "destroy"], title: "Acciones" }],
          editable: "popup"
      });

    })


});