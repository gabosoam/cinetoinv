$(document).ready(function () {

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/bill/read/"+bill, dataType: "json" },
            update: { url: "/brand/update", type: "POST", dataType: "json" },
            destroy: { url: "/brand/delete", type: "POST", dataType: "json" },
            create: { url: "/brand/create", type: "POST", dataType: "json" },
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
                    barcode: { validation: { required: true, }, type: 'string' },
                    variant: { validation: { required: true, }, type: 'string' },
                    
                    location: { validation: { required: true, }, type: 'string' },
                    bill: { validation: { required: true, }, type: 'string' },
                }
            }
        }
    },
    );
    
    $("#grid2").kendoGrid({
        dataSource: dataSource,
        height: 475,
        filterable: true,
        pageable: { refresh: true, pageSizes: true, },
        selectable:true,
        resizable: true,        
        toolbar: ['create','excel','destroy',{
            name: "Add",
            text: "Send Email",
            click: function(e){alert('Send Emails'); return false;}
         } ],
        columns: [           
            { field: "barcode", title: "Serie", filterable: { search: true } },
            { field: "variant", title: "Código", filterable: { search: true } },
            { field: "location", title: "Almancen", filterable: { search: true } }],
        editable: "inline"
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

