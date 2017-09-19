var validator = $("#formsave").kendoValidator().data("kendoValidator");
$("#save").on("click", function () {
    if (validator.validate()) {
        save();
    }
});

$('#barcode').keypress(function(e) {
    if(e.which == 13) {
        save();
    }
});

function save() {
    var data = $('#formsave').serialize();
    $.post("/product/create", data, function (info) {

       if(info!='Ya existe el producto'){
        $('#grid2').data('kendoGrid').dataSource.read();
        $('#grid2').data('kendoGrid').refresh();
        $('#barcode').val(null);
        $('#barcode').focus();
       }else{
        alert('Ya existe el número de serie');
        $('#barcode').focus();
       }
        
    });
}

$(document).ready(function () {
    dataSourceCombo = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/model/readBill",
                dataType: "json"
            }
        }
    });

    dataSourceLocation = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/location/read",
                dataType: "json"
            }
        }
    });


    $("#code").kendoComboBox({
        dataSource: dataSourceCombo,
        filter: "contains",
        dataTextField: "description",
        dataValueField: "id",
        placeholder: "Buscar producto",
        minLength: 1,
        change: onChange
    });



    function onChange(e) {
        var widget = e.sender;

        if (widget.value() && widget.select() === -1) {
            //custom has been selected
            widget.value(""); //reset widget
            //widget.trigger("change");
        }
    };

    $("#location").kendoDropDownList({
        dataSource: dataSourceLocation,
        editable: false,
        dataTextField: "name",
        dataValueField: "id",
        title: "Seleccionar almacén",
        minLength: 1

    });

    function userNameAutoCompleteEditor(container, options) {
        $('<input required data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoAutoComplete({
                dataSource: dataSourceCombo,
                placeholder: "Busca un producto",
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
                spinners: false
            });
    }

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/bill/read/" + bill, dataType: "json" },
            update: { url: "/product/create", type: "POST", dataType: "json" },
            destroy: { url: "/product/delete", type: "POST", dataType: "json" },
            create: {
                url: "/product/create", type: "POST", dataType: "json", success: function (data) {
                    alert(data);
                },
            },
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
                    Producto: { editable: false },
                    barcode: { validation: { required: true, decimals: 0, min: 1 }, type: 'string', editor: editNumberWithoutSpinners },
                    description: { validation: { required: true, }, type: 'string' },
                    bill: { type: 'string', defaultValue: bill, editable: false, visible: false },
                    code: { editable: false }
                }
            }
        },
        group: {
            field: "Producto", aggregates: [
                { field: "barcode", aggregate: "count" },
                { field: "Producto", aggregate: "count" },
            ]
        },
        aggregate: [{ field: "barcode", aggregate: "count" }]
    },
    );

    $("#grid2").kendoGrid({
        dataSource: dataSource,
        height: 400,


        pageable: false,
        toolbar: ['pdf', 'excel'],
        pdf: {
            allPages: true,
            avoidLinks: true,
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
            { field: "Producto", hidden: true, aggregates: ["min", "max", "count"], groupHeaderTemplate: "Cantidad: #= count#" },
            { field: "barcode", aggregates: ["count"], title: "No. de serie", filterable: { search: true }, width: '20%' },
            { field: "code", title: "Código", filterable: { search: true }, width: '15%' },
            { field: "description", title: "Producto", filterable: { search: true } },
            { field: "location", title: "Almacén", width: '100px' },
            { field: "price", title: "Precio", width: '100px' },
            { field: "bill", title: "Factura", width: '1px' }],
        editable: "inline"
    })



})
