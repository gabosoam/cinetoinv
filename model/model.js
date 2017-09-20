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

    readOne: function (code,callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM model where code=?',code, function (error, results, fields) {
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

    readBil: function (callback) {
     
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT * FROM v_modelbill;', function (error, results, fields) {
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
                connection.query('SELECT  * FROM v_model;', function (error, results, fields) {
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
                console.log(datos);
                connection.query('UPDATE model SET code=?, description=?, stockmin=?, unit=?, brand=?, category=? WHERE (id=?) LIMIT 1', [datos.code,datos.description,datos.stockmin,datos.unit, datos.brand,datos.category,datos.id], function (error, results, fields) {
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
                
                connection.query('INSERT INTO model (code, description, stockmin, unit, category, brand) VALUES (?, ?, ?, ?, ?, ?)', [datos.code,datos.description,datos.stockmin,datos.unit,datos.category,datos.brand], function (error, results, fields) {
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




}
