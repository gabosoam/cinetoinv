
var bcrypt = require('bcrypt-nodejs');
var generateHash = function (password) {
  return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
}
var connection = require('../config/connection.js');


module.exports = {

  read: function (callback) {
    connection.query('SELECT  * FROM bill;', function (error, results, fields) {
      if (error) {

        callback('error en la consulta: ' + error, null);
      } else {


        callback(null, results);
      }
    });
  },

  readOne: function (bill, callback) {
    connection.query('SELECT  * FROM v_infobill WHERE id=?;', bill, function (error, results, fields) {
      if (error) {

        callback('error en la consulta: ' + error, null);
      } else {
        callback(null, results);
      }
    });
  },

  read2: function (callback) {
    connection.query('SELECT  * FROM v_bill;', function (error, results, fields) {
      if (error) {

        callback('error en la consulta: ' + error, null);
      } else {


        callback(null, results);




      }
    });
  },

  update: function (datos, callback) {
    connection.query('UPDATE bill SET `provider`=?, `date`=?, `reference`=?, type=? WHERE (`id`=?) LIMIT 1', [datos.provider, new Date(datos.date).toLocaleDateString(), datos.reference.toUpperCase(), datos.type, datos.id], function (error, results, fields) {//
      if (error) {
        callback('error en la consulta: ' + error, null);
      } else {
        callback(null, results);
      }
    });
  },

  delete: function (datos, callback) {
    connection.query('DELETE FROM bill WHERE id=?', [datos.id], function (error, results, fields) {//
      if (error) {
        callback('error en la consulta: ' + error, null);
      } else {
        callback(null, results);
      }
    });
  },


  create: function (data, callback) {

    connection.query('SELECT * FROM v_product WHERE barcode= ? LIMIT 1', [data.serie], function (error, results, fields) {
      if (results[0]) {
        if (results[0].billstate == 1) {
          if (results[0].state == 0) {

            connection.query('INSERT INTO detail(voucher,product) VALUES(?,?)', [data.voucher, results[0].id], function (e, r, f) {
              if (e) {
                callback(e, null);
              } else {
                connection.query("UPDATE `product` SET `state`='1', location= NULL WHERE (`id`=?)", [results[0].id], function (er, re, fi) {
                  if (er) {
                    console.log(er);
                    callback(er, null);
                  } else {
                    callback(null, 'Se registro la salida satisfactoriamente');
                  }
                });
              }
            });
          } else {
            if (results[0].state == 1) {
              callback('El producto se encuentra entregado', null);
            } else if (results[0].state == 2) {
              callback('El producto se encuentra reservado', null);
            }
          }
        } else {
          callback('El ingreso del producto no ha sido cerrado aún', null);
        }
      } else {
        callback('No existe el producto', null);
      }

    })

  },
}
