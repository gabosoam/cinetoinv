$(document).ready(function () {

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/bill/read/"+bill, dataType: "json" },
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
                    total: { validation: { required: true, }, type: 'string' },
                    id: { validation: { required: true, }, type: 'string' },
                    description: { validation: { required: true, }, type: 'string' },
                    bill: {type: 'string',defaultValue: bill, editable:false, visible:false}
                }
            }
        }
    },
    );

    $("#grid2").kendoGrid({
      dataSource: dataSource,
      height: 475,
      filterable: true,
      selectable: true,
      columnMenu: true,
      groupable: true,
      pageable: { refresh: true, pageSizes: true, },
      toolbar: ['create','excel','pdf'],
         pdf: {
           allPages: true,
           avoidLinks: false,
           paperSize: "A4",
           margin: { top: "6.5cm", left: "1cm", right: "1cm", bottom: "2.54cm" },
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
            { field: "total", title: "Cantidad", filterable: { search: true }, width:'100px' },
            { field: "id", title: "Código", filterable: { search: true }, width:'100px' },
            { field: "description", title: "Producto", filterable: { search: true } },
          { field: "bill", title: "Factura", filterable: { search: true } }],
        editable: "popup"
      }).on('focusin', function(e) {

      });

      function showDetails(e) {
        alert('hola');

         // get the grid position
         var offset = $(this).offset();
         // crete a textarea element which will act as a clipboard
         var textarea = $("<textarea>");
         // position the textarea on top of the grid and make it transparent
         textarea.css({
           position: 'absolute',
           top: offset.top,
           left: offset.left,
           border: 'none',
           width: $(this).width(),
           height: $(this).height()
         })
         .appendTo('body')
         .on('paste', function() {
           // handle the paste event
           setTimeout(function() {
             // the the pasted content
             var value = $.trim(textarea.val());
             // get instance to the grid
             var grid = $("#grid2").data("kendoGrid");
             // get the pasted rows - split the text by new line
             var rows = value.split('\n');

             var data = [];

             for (var i = 0; i < rows.length; i++) {
               var cells = rows[i].split('\t');
               data.push({
                 barcode: cells[0],
                 variant: cells[1]
               });
             };
             grid.dataSource.data(data);
           });
         }).on('focusout', function() {
           // remove the textarea when it loses focus
           $(this).remove();
         });
         // focus the textarea
         setTimeout(function() {
           textarea.focus();
         });

    }


})
