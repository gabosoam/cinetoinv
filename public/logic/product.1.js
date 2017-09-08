$(document).ready(function () {

    dataSourceCombo = new kendo.data.DataSource({
        transport: {
            read: {
              url: "/model/read",
              dataType: "json"
            }
          }
    })
  

    function userNameComboBoxEditor(container, options) {
        $('<input required data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoComboBox({
                dataSource: dataSourceCombo,
                dataTextField: "description",
                dataValueField: "id"
            });
    }

    function userNameAutoCompleteEditor(container, options) {
        $('<input required data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoAutoComplete({
                dataSource: dataSourceCombo,
                placeholder:"Busca un producto",
                dataTextField: "description",
                filter: "contains",
                minLength: 1
            });
    }

    function editNumberWithoutSpinners(container, options) {
        $('<input data-text-field="' + options.field + '" ' +
                'data-value-field="' + options.field + '" ' +
                'data-bind="value:' + options.field + '" ' +
                'data-format="' + options.format + '"/>')
                .appendTo(container)
                .kendoNumericTextBox({
                    spinners : false
                });
    }
    


    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/bill/read/" + bill, dataType: "json" },
            update: { url: "/product/create", type: "POST", dataType: "json" },
            destroy: { url: "/product/delete", type: "POST", dataType: "json" },
            create: { url: "/product/create", type: "POST", dataType: "json" },
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
                    total: { validation: { required: true, decimals:0 }, type: 'number', editor:editNumberWithoutSpinners},
                    code: { editable: false },
                    description: { validation: { required: true, }, type: 'string' },
                    bill: { type: 'string', defaultValue: bill, editable: false, visible: false }
                }
            }
        }
    },
    );

    $("#grid2").kendoGrid({
        dataSource: dataSource,


        height: 400,

        pageable: { refresh: true, pageSizes: false, },
        toolbar: ['create', 'save', 'cancel','pdf'],
        pdf: {
            allPages: true,
            avoidLinks: false,
            paperSize: "A4",
            margin: { top: "6.8cm", left: "1cm", right: "1cm", bottom: "2.54cm" },
            landscape: false,
            repeatHeaders: true,
            template: $("#page-template").html(),
            scale: 0.8
        },
        pdfExport: function (e) {
            var grid = $("#grid").data("kendoGrid");
            //   grid.hideColumn(6);

            e.promise
                .done(function () {
                    //   grid.showColumn(6);
                });
        },
        columns: [
            { field: "total", title: "Cantidad", filterable: { search: true }, width: '10%' },
            { field: "code", title: "Código", filterable: { search: true }, width: '15%' },
            {
                field: "description", title: "Producto", filterable: { search: true },
                editor: userNameAutoCompleteEditor
            },
            { field: "bill", title: "Factura", width: '1px' }],
        editable: "inline"
    })



})
