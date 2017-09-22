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
            read: { url: "/bill/read", type: 'POST', dataType: "json" },
            update: { url: "/bill/update", type: "POST", dataType: "json" },
            destroy: { url: "/bill/delete", type: "POST", dataType: "json" },
            create: { url: "/bill/create", type: "POST", dataType: "json" },
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
                    provider: { validation: { required: true, size:13 }, type: 'string' },
                    type: {validation: { required: true, size:13 }, type: 'string'},
                    date: { validation: { required: true, }, type:'date'},
                    reference: { validation: { required: true, }, type: 'string' }
                }
            }
        }
    },
    );

    var wnd,
    detailsTemplate;

    var socket = io.connect();
    socket.emit('getProvider', function (providers) {

      $("#grid").kendoGrid({
          dataSource: dataSource,
          height: 475,
          filterable: true,
          groupable: true,

          pageable: { refresh: true, pageSizes: true, },
          toolbar: ['create','excel','pdf'],
          pdf: {
            allPages: true,
            avoidLinks: false,
            paperSize: "A4",
            margin: { top: "3.5cm", left: "1cm", right: "1cm", bottom: "2cm" },
            landscape: true,
            repeatHeaders: true,
            template: $("#page-template").html(),
            scale: 0.8
        },
        pdfExport: function (e) {
            var grid = $("#grid").data("kendoGrid");
            grid.hideColumn(6);

            e.promise
            .done(function () {
              grid.showColumn(6);
            });
          },
          columns: [

              { field: "provider", values:providers, title: "Proveedor",width: '270px', filterable: { search: true } },
              { field: "date",title: "Fecha", width: '100px', filterable: {search: true, search: true }, format: "{0:dd/MM/yyyy}"},
              { field: "type", values: types, width: '150px',  title: "Tipo documento", filterable: { multi: true, search: true, search: true } },
              { field: "reference",title: "Referencia",  width: '100px', filterable: {search: true, search: true } },

              { command: ["edit", "destroy",{ text: "Ver detalles", click: showDetails, iconClass: 'icon icon-chart-column' }], title: "Acciones" }],
          editable: "popup"
      });



    })

    function showDetails(e) {
        e.preventDefault();

        var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
        location.href ="/bill/"+dataItem.id;
    }



});
