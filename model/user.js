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
                connection.query('SELECT  * FROM user;', function (error, results, fields) {
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
                connection.query('UPDATE `user` SET `name`=?,`lastname`=?,`username`=?, `rol`=?, email=? WHERE (`id`=?) LIMIT 1', [datos.name,datos.lastname,datos.username, datos.rol,datos.email, datos.id], function (error, results, fields) {//
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
                connection.query('DELETE FROM user WHERE id=?', [datos.id], function (error, results, fields) {//
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

                connection.query('INSERT INTO user(name, lastname, username, rol,email,password) VALUES(?, ?, ?,?,?,?)', [datos.name,datos.lastname,datos.username, datos.rol,datos.email,generateHash(datos.username)], function (error, results, fields) {//
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

    login: function (user, callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT * FROM user WHERE username = ?', user.username, function (error, results, fields) {//
                    if (error) {
                        callback('error en la consulta: ' + error, null);
                        console.log(err);
                    } else {
                        var usuarioDatos = {};
                        if (results[0]) {
                            if (bcrypt.compareSync(user.password, results[0].password)) {
                             usuarioDatos = {
                                name: results[0].name+' '+results[0].lastname,
                                username: results[0].username,
                                email: results[0].email,
                                rol: results[0].rol
                            };
                            callback(null, usuarioDatos);

                        } else {
                            callback('La contraseña es incorrecta',null)

                        }
                            //console.log("La contraseña es: ",generateHash(results[0].password));
                        } else {
                            callback('El usuario no existe',null);

                        }
                    }

                    connection.release();
                });
            }
        });
    }

}
