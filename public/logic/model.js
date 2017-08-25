var unid;
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
                id: "id",
                fields: {
                    id: { editable: true, nullable: false },
                    name: { validation: { required: true, }, type: 'string' },
                    category: { validation: { required: true }, type: 'string', search: true },
                    brand: { validation: { required: true }, type: 'string' }
                }
            }
        }
    },
    );
    var socket = io.connect();
    socket.emit('getDates', function (category, brand,unit) {
        unid=unit;
        var element = $("#grid").kendoGrid({
            dataSource: dataSource,
            height: 500,
            filterable: true,
            toolbar: ['create', 'pdf', 'excel'],
            pdf: {
                title: 'reporte',
                allPages: true,
                avoidLinks: false,
                paperSize: "A4",
                margin: { top: "2cm", left: "1cm", right: "1cm", bottom: "1cm" },
                landscape: true,
                repeatHeaders: true,
                template: $("#page-template").html(),
                scale: 0.8
            },
            pdfExport: function (e) {
                var grid = $("#grid").data("kendoGrid");
                grid.hideColumn(3);
                e.promise
                    .done(function () {
                        grid.showColumn(3);
                    });
            },
            pageable: { refresh: true, pageSizes: true },
            detailTemplate: kendo.template($("#template").html()),
            detailInit: detailInit,
            dataBound: function () {
                // this.expandRow(this.tbody.find("tr.k-master-row").first());
            },
            columns: [
                { field: "name", title: "Modelo", filterable: { multi: true, search: true, search: true } },
                { field: "category", values: category, title: "Categoría", filterable: { multi: true, search: true, search: true } },
                { field: "brand", values: brand, title: "Marca", filterable: { multi: true, search: true, search: true } },
                { command: ["edit", "destroy"], title: "Acciones", width: '200px' }],
            editable: "inline"
        });
    });
});
function detailInit(e) {
    var detailRow = e.detailRow;
    detailRow.find(".tabstrip").kendoTabStrip({
        animation: {
        }
    });
    detailRow.find(".orders").kendoGrid({
        dataSource: {
            transport: {
                read: { url: "/variant/read", dataType: "json" },
                update: { url: "variant/update", type: "POST", dataType: "json" },
                destroy: { url: "/variant/delete", type: "POST", dataType: "json" },
                create: { url: "/variant/create", type: "POST", dataType: "json" },
                parameterMap: function (options, operation) {
                    if (operation !== "read" && options.models) {
                        var datos = options.models[0]
                        return datos;
                    }
                }
            },
            batch: true,
            serverFiltering: false,
            schema: {
                model: {
                    id: "id",
                    fields: {
                        model: { editable: false, type: 'string', defaultValue: e.data.id },
                        code: { validation: { required: true, }, type: 'string' },
                        description: { validation: { required: true, }, type: 'string' },
                        price: { validation: { required: true }, type: 'number' },
                        unit: { validation: { required: true } },
                        stockmin: { validation: { required: true, }, type: 'number'},

                    }
                }
            },
            filter: { field: "model", operator: "eq", value: e.data.id }

        },
        scrollable: false,
        sortable: true,
        filterable: true,
        toolbar: ['create', 'excel'],
        columns: [
            { field: "model", title: "Módelo", width: '1px', filterable: { multi: true, search: true, search: true } },
            { field: "code", title: "Código", filterable: { multi: true, search: true, search: true } },
            { field: "description", title: "Variante", filterable: { multi: true, search: true, search: true } },
            { field: "price", title: "Precio", filterable: { search: true, search: true } },
            { field: "stockmin", title: "Stock mínimo", filterable: { search: true, search: true } },
            { field: "unit", values: unid, title: "Unidad de medida" },
            { command: ["edit", "destroy"], title: "Acciones" }
        ],
        editable: "popup"
    });
}
