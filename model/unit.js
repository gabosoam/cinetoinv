var mysql = require('mysql');
var config = require('../config/connection.js');
var bcrypt = require('bcrypt-nodejs');
var generateHash = function (password) {
    return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
};

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
                connection.query('SELECT  * FROM unit;', function (error, results, fields) {
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
    read2: function (callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM v_unit;', function (error, results, fields) {
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
                connection.query('UPDATE unit SET description=?, smallDescription=?, size=? WHERE (id=?) LIMIT 1', [datos.description, datos.smallDescription,datos.size,datos.id], function (error, results, fields) {//
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
                connection.query('DELETE FROM unit WHERE id=?', [datos.id], function (error, results, fields) {//
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
                connection.query('INSERT INTO unit(description,smallDescription,size) VALUES(?,?,?)', [datos.description, datos.smallDescription, datos.size], function (error, results, fields) {//
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