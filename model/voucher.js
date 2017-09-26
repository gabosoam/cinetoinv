var connection = require('../config/connection.js');


module.exports = {
    read: function (callback) {
        connection.query('SELECT  * FROM voucher', function (error, results, fields) {
            if (error) {
                callback('error en la consulta: ' + error, null);
            } else {

                callback(null, results);
            }
        });
    },

    read2: function (voucher, callback) {
        connection.query('SELECT  * FROM v_detail WHERE voucher=?;', voucher, function (error, results, fields) {
            if (error) {
                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);
            }
        });
    },

    readOne: function (voucher, callback) {
        connection.query('SELECT  * FROM voucher WHERE id=?;', voucher, function (error, results, fields) {
            if (error) {
                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);

            }
        });
    },

    update: function (datos, callback) {
        connection.query('UPDATE voucher SET `client`=?, `date`=?, `reference`=? WHERE (`id`=?) LIMIT 1', [datos.client, new Date(datos.date).toLocaleDateString(), datos.reference.toUpperCase(), datos.id], function (error, results, fields) {//
            if (error) {

                callback('error en la consulta: ' + error, null);
            } else {

                callback(null, results);

            }
        });
    },

    delete: function (datos, callback) {
        connection.query('DELETE FROM voucher WHERE id=?', [datos.id], function (error, results, fields) {
            if (error) {
                callback('error en la consulta: ' + error, null);
            } else {
                if (results.affectedRows == 0) {
                    callback('no se puede eliminar', null);
                } else {
                    callback(null, results);
                }

            }
        });
    },


    create: function (datos, callback) {
        connection.query('INSERT INTO voucher (client, date, reference, type) VALUES (?,?,?,?)', [datos.client, new Date(datos.date).toLocaleDateString(), datos.reference.toUpperCase(), datos.type], function (error, results, fields) {
            if (error) {
                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);

            }
        });
    },
}
