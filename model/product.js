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
                connection.query('SELECT  * FROM v_product;', function (error, results, fields) {
                    if (error) {

                        callback('error en la consulta: ' + error, null);
                    } else {
                        callback(null, results);

                    }
                });
                connection.release();
            }
        });
    },

    readBill: function (bill, callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM v_bill where bill=?;', bill, function (error, results, fields) {
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
                connection.query('UPDATE location SET name=?,description=? WHERE (id=?) LIMIT 1', [datos.name, datos.description, datos.id], function (error, results, fields) {//
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
                connection.query('DELETE FROM location WHERE id=?', [datos.id], function (error, results, fields) {//
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

            connection.query('SELECT id from product WHERE barcode=? AND barcode !=\'S/N\' ', [datos.barcode], function (er, re, fi) {
                if (er) {
              
                    callback(er, null);
                    connection.release();

                } else {
                    if (re.length == 0) {
                        connection.query('INSERT INTO product (barcode,variant, location, bill, price) VALUES (?,?,?,?,?)', [datos.barcode, datos.code, datos.location, datos.bill, datos.price], function (error, results, fields) {
                            if (error) {
                           
                                callback(error, null)
                            } else {
                                callback(null, results)
                            }
                        });

                    } else {
                        callback('Ya existe el producto');
                    }
                    connection.release();
                }

            })

        });

    }
}


function createQuery(datos) {
    var query = "";
    for (var i = 0; i < parseInt(datos.total); i++) {
        query += '(\'' + datos.description + '\',\'' + '13' + '\',\'' + datos.bill + '\'),';
    }

    return 'INSERT INTO product (variant, location, bill) VALUES' + query.slice(0, -1);

}