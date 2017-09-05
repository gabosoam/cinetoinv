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
                connection.query('SELECT  * FROM bill;', function (error, results, fields) {
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

    read2: function (callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM v_bill;', function (error, results, fields) {
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
                connection.query('UPDATE bill SET `provider`=?, `date`=?, `reference`=?, type=? WHERE (`id`=?) LIMIT 1', [datos.provider,new Date(datos.date).toLocaleDateString(),datos.reference,datos.type,datos.id], function (error, results, fields) {//
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

    delete: function (datos, callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('DELETE FROM bill WHERE id=?', [datos.id], function (error, results, fields) {//
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
                    console.log('los datos son:');
                    var fecha = datos.date;
                    console.log(new Date(fecha).toISOString());
                    console.log(datos);

                connection.query('INSERT INTO bill (provider, date, reference, type) VALUES (?,?,?,?)', [datos.provider,new Date(datos.date).toLocaleDateString(),datos.reference,datos.type], function (error, results, fields) {
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
}

function parseDate(input) {
  var parts = input.split('-');
  // new Date(year, month [, day [, hours[, minutes[, seconds[, ms]]]]])
  return new Date(parts[0], parts[1]-1, parts[2]); // Note: months are 0-based
}
