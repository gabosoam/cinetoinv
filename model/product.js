var connection = require('../config/connection.js');


module.exports = {

    read: function (callback) {
        connection.query('SELECT  * FROM v_product where billstate=1;', function (error, results, fields) {
            if (error) {

                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);

            }
        });
    },

    readBill: function (bill, callback) {
        connection.query('SELECT  * FROM v_bill where bill=?;', bill, function (error, results, fields) {
            if (error) {

                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);

            }
        });
    },

    update: function (datos, callback) {
        connection.query('UPDATE location SET name=?,description=? WHERE (id=?) LIMIT 1', [datos.name, datos.description, datos.id], function (error, results, fields) {//
            if (error) {
                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);

            }
        });
    },

    delete: function (datos, callback) {
        connection.query('DELETE FROM product WHERE id=?', [datos.id], function (error, results, fields) {//
            if (error) {
                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);

            }
        });
    },
    create: function (datos, callback) {
        connection.query('SELECT id from product WHERE barcode=? AND barcode !=\'S/N\' ', [datos.barcode], function (er, re, fi) {
            if (er) {
                callback(er, null);
            } else {
                if (re.length == 0) {
                    connection.query('INSERT INTO product (barcode,variant, location, bill, price, observation) VALUES (?,?,?,?,?,?)', [datos.barcode.toUpperCase(), datos.code, datos.location, datos.bill, datos.price, datos.observation.toUpperCase()], function (error, results, fields) {
                        if (error) {

                            callback(error, null)
                        } else {
                            callback(null, results)
                        }
                    });

                } else {
                    callback('Ya existe el producto');
                }
            }

        })

    }
}


function createQuery(datos) {
    var query = "";
    for (var i = 0; i < parseInt(datos.total); i++) {
        query += '(\'' + datos.description + '\',\'' + '13' + '\',\'' + datos.bill + '\'),';
    }

    return 'INSERT INTO product (variant, location, bill) VALUES' + query.slice(0, -1);

}
