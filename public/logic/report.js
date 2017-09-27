var states = [{
  "value": 0,
  "text": "EN BODEGA"
}, {
  "value": 2,
  "text": "RESERVADO"
},
{
  "value": 1,
  "text": "ENTREGADO"
}];

kendo.culture("es-ES");
$(document).ready(function () {
  dataSource = new kendo.data.DataSource({
    transport: {
      read: { url: "/product/read", dataType: "json" }
    },
    batch: true,
    pageSize: 10,
    serverFiltering: false,
    schema: {
      model: {
        id: "id",
        fields: {
          code: { type: "string" },
          date: { type: 'date', editable: false },
          code: { type: "string" }
        }
      }
    },
    group: {
      field: "code", aggregates: [
        { field: "code", aggregate: "count" }
      ]
    },
    aggregate: [
    { field: "code", aggregate: "count" },
    { field: "category", aggregate: "count" }],
    pageSize: 100
  }
  );

  $("#grid").kendoGrid({
    dataSource: dataSource,
    height: 600,
    toolbar: ['pdf', 'excel'],
    scrollable:true,
    columnMenu:true,
    filterable: true,
    resizable: true,
    groupable: true,
    pageable: { refresh: true },
    columns: [
      { field: "barcode", title: "No de serie", filterable: { search: true } },
      {
        field: "code", aggregates: ["count"], title: "Código",
        groupHeaderTemplate: "Código: #= value # (Cantidad: #= count#)", filterable: { multi: true, search: true, search: true }
      },
      { field: "description", title: "Producto", filterable: { multi: true, search: true, search: true } },
      { field: "category",aggregates: ["count"], title: "Categoría",
      groupHeaderTemplate: "Categoría: #= value # (Cantidad: #= count#)", filterable: { multi: true, search: true, search: true } },
      { field: "brand", title: "Marca", filterable: { multi: true, search: true } },
      { field: "date", title: "F. Ingreso", filterable: { search: true, search: true },format: "{0:dd/MM/yyyy}" },
      { field: "reference", title: "Referencia", filterable: { search: true, search: true } },
      { field: "state",values:states, title: "Estado", filterable: { search: true, search: true } },
      { field: "location", title: "Ubicación", filterable: { multi: true, search: true } },
      { field: "observation", title: "Observación", filterable: false },
      { command: [{ text: "Reservar", click: showDetails }], title: "Acciones"}]
  });

  function showDetails(e) {
    e.preventDefault();
    var dataItem = this.dataItem($(e.currentTarget).closest("tr"));

    switch (dataItem.state) {
      case 1:
        alert('No se puede reservar un producto entregado');
        break;
        case 2:
        alert('El producto ya se encuentra reservado');
        break;
      default:
        var confirmation = 
        confirm("¿Está seguro que desea reservar el producto con número de serie: "+dataItem.barcode+"?");
        if (confirmation) {
          alert('El producto con número de serie: '+dataItem.barcode+" ha sido reservado");
        } else {
          
        }
        break;
    }
   
    
  }
});
