var connection = require('../config/connection.js');


module.exports = {

  createBarcode: function (callback) {
    connection.query('CALL barcode();', function (error, results, fields) {
      if (error) {

        callback('error en la consulta: ' + error, null);
      } else {
        callback(null, results[0]);
      }
    });
  },
}