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
                connection.query('SELECT  * FROM model;', function (error, results, fields) {
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
                connection.query('UPDATE `model` SET `name`=?,`category`=?,`brand`=? WHERE (`id`=?) LIMIT 1', [datos.name,datos.category,datos.brand, datos.id], function (error, results, fields) {//
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
                connection.query('DELETE FROM model WHERE id=?', [datos.id], function (error, results, fields) {//
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
                
                connection.query('INSERT INTO model(name, category, brand, unit) VALUES(?,?,?,?)', [datos.name,datos.category,datos.brand,datos.unit], function (error, results, fields) {//
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