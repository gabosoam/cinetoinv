var config = require('../config/connection.js');
var mysql = require('mysql');


var connection = mysql.createPool({
    host: config.host,
    user: config.user,
    password: config.password,
    database: config.database,
    port: config.port
});


module.exports = {
    read: function (callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM voucher', function (error, results, fields) {
                    if (error) {
                        callback('error en la consulta: ' + error, null);
                    } else {
                        connection.release();
                        callback(null, results);
                    }
                });
            }
        });
    },

    readOne: function (voucher, callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM voucher WHERE id=?;', voucher, function (error, results, fields) {
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
                connection.query('UPDATE voucher SET `client`=?, `date`=?, `reference`=? WHERE (`id`=?) LIMIT 1', [datos.client, new Date(datos.date).toLocaleDateString(), datos.reference, datos.id], function (error, results, fields) {//
                    if (error) {
                        console.log(error);
                        callback('error en la consulta: ' + error, null);
                    } else {
                        console.log(results);
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
                connection.query('DELETE FROM voucher WHERE id=?', [datos.id], function (error, results, fields) {
                
                   
                    if (error) {
                        callback('error en la consulta: ' + error, null);
                    } else {
                        console.log(results);
                        if (results.affectedRows==0) {
                         
                            callback('no se puede eliminar', null);
                        }else{
                  
                            callback(null, results);
                            connection.release();

                        }
                        
                    }
                });
            }
        });
    },


    create: function (datos, callback) {
        console.log(datos);
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('INSERT INTO voucher (client, date, reference, type) VALUES (?,?,?,?)', [datos.client, new Date(datos.date).toLocaleDateString(), datos.reference, datos.type], function (error, results, fields) {
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
