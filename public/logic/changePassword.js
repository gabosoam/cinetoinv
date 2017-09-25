var cosa = '<div class="modal fade" id="myModal" role="dialog">'+
'<div class="modal-dialog modal-sm">'+
    '<div class="modal-content">'+
        '<div class="modal-header">'+
            '<button type="button" class="close" data-dismiss="modal">&times;</button>'+
            '<h4 class="modal-title">Cambiar contraseña</h4>'+
        '</div>'+
        '<div class="modal-body">'+
            '<form id="formPass">'+
                '<div class="form-group">'+
                    '<input type="hidden" name="user" value="<%= user.id%>" required>'+
                    '<label for="email">Contraseña anterior:</label>'+
                    '<input autofocus type="password" class="form-control" name="Anterior" required>'+
                '</div>'+
                '<div class="form-group">'+
                    '<label for="pwd">Nueva contraseña:</label>'+
                    '<input type="password" class="form-control" id="pwd" name="Nueva" id="Nueva" required>'+
                '</div>'+
                '<div class="form-group">'+
                    '<label for="pwd">Confirmar contraseña:</label>'+
                    '<input type="password" class="form-control" id="pwd" name="Confirm" id="Nueva" required>'+
                '</div>'+
        '</div>'+
        '<div class="modal-footer">'+
            '<button id="btnSavePassword"  type="button" class="btn btn-primary">Guardar</button>'+
            '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'+
            '</form>'+
        '</div>'+
    '</div>'+
'</div>'+
'</div>';

document.getElementById('cosa').innerHTML= cosa;


  
  
  $('#btnSavePassword').click(function () {

    var validator = $("#formPass").kendoValidator().data("kendoValidator");
    if (validator.validate()) {
      var data = $('#formPass').serialize();
      alert(data);
      $.post("/user/editPassword",data, function (datares) {
        alert(datares);
        if (datares=="Contraseña modificada con éxito") {
          alert(datares);
          location.href ="/logout";
        } else {
          alert(datares);
        }
      });
    } else {

    }



  });
