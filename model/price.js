var mysql = require('mysql');
var config = require('../config/connection.js');
var bcrypt = require('bcrypt-nodejs');
var generateHash = function (password) {
  return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
}


var connection = mysql.createPool({
  host: config.host,
  user: config.user,
  password: config.password,
  database: config.database
});


module.exports = {

  read: function (callback) {
    connection.getConnection(function (err, connection) {
      if (err) {
        callback(err, null);
      } else {
        connection.query('SELECT  * FROM price;', function (error, results, fields) {
          if (error) {
            callback('error en la consulta: ' + error, null);
          } else {
            callback(null, results);
            connection.release();
          }
        });
      }
    });
  },

  update: function (datos, callback) {
    connection.getConnection(function (err, connection) {
      if (err) {
        callback(err, null);
      } else {
        connection.query('UPDATE price SET variant=?,price=?,size=?,description=? WHERE (id=?) LIMIT 1', [datos.variant,datos.price, datos.size, datos.description,datos.id], function (error, results, fields) {//
          if (error) {
            console.log(error);
            callback('error en la consulta: ' + error, null);
          } else {
            callback(null, results);
            connection.release();
          }
        });
      }
    });
  },

  delete: function (datos, callback) {
    connection.getConnection(function (err, connection) {
      if (err) {
        callback(err, null);
      } else {
        connection.query('DELETE FROM price WHERE id=?', [datos.id], function (error, results, fields) {//
          if (error) {
            callback('error en la consulta: ' + error, null);
          } else {
            callback(null, results);
            connection.release();
          }
        });
      }
    });
  },

  create: function (datos, callback) {
    connection.getConnection(function (err, connection) {
      if (err) {
        callback(err, null);
      } else {
        connection.query('INSERT INTO price (variant, price, size, description) VALUES (?, ?, ?, ?)', [datos.variant,datos.price,datos.size,datos.description], function (error, results, fields) {//
          if (error) {
            callback('error en la consulta: ' + error, null);
          } else {
            callback(null, results);
            connection.release();
          }
        });
      }
    });
  }
}
