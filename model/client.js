var mysql = require('mysql');
var config = require('../config/connection.js');


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
                connection.query('SELECT  * FROM client;', function (error, results, fields) {
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

    update: function (datos, callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('UPDATE `client` SET `dni`=?,`name`=?,`address`=?, `phone`=?, email=? WHERE (`id`=?) LIMIT 1', [datos.dni,datos.name,datos.address, datos.phone,datos.email, datos.id], function (error, results, fields) {//
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
                connection.query('DELETE FROM client WHERE id=?', [datos.id], function (error, results, fields) {//
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
                
                connection.query('INSERT INTO client(dni, name, address, phone,email) VALUES(?,?,?,?,?)', [datos.dni,datos.name,datos.address, datos.phone,datos.email], function (error, results, fields) {//
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