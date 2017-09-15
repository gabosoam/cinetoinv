var config = require('../config/connection.js');
var mysql = require('mysql');

var connection = mysql.createPool({
    host: config.host,
    user: config.user,
    password: config.password,
    database: config.database
});

var bcrypt = require('bcrypt-nodejs');
var generateHash = function (password) {
    return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
}

module.exports = {

    read: function (callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM variant;', function (error, results, fields) {
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
                connection.query('SELECT  * FROM v_variant;', function (error, results, fields) {
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
                connection.query('UPDATE variant SET code=?, description=?, stockmin=?, unit=? WHERE (id=?) LIMIT 1', [datos.code, datos.description, datos.stockmin, datos.unit, datos.id], function (error, results, fields) {//
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
                connection.query('DELETE FROM variant WHERE id=?', [datos.id], function (error, results, fields) {//
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

                connection.query('INSERT INTO variant(code, description, model,stockmin,unit) VALUES(?,?,?,?,?)', [datos.code, datos.description, datos.model, datos.price, datos.stockmin, datos.unit], function (error, results, fields) {
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
