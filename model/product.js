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
                connection.query('SELECT  * FROM v_product;', function (error, results, fields) {
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

    readBill: function (bill, callback) {
        connection.getConnection(function (err, connection) {
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM v_bill where bill=?;',bill, function (error, results, fields) {
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
                connection.query('UPDATE `location` SET `name`=?,`description`=? WHERE (`id`=?) LIMIT 1', [datos.name,datos.description,datos.id], function (error, results, fields) {//
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
            if (err) {
                callback(err, null);
            } else {
                connection.query('SELECT  * FROM model where model.description=?;',datos.description, function (error, results, fields) {
                    if (error) {
                      console.log(error);
                        callback('error en la consulta: ' + error, null);
                    } else {
                        if (results.length==1) {
                            var query= createQuery({total:datos.total, model: results[0].id, bill: datos.bill});
                            connection.query(query, function (error, results, fields) {
                                if (error) {
                                  console.log(error);
                                    callback('error en la consulta: ' + error, null);
                                } else { 
                                    callback(null, results);
                                    connection.release();
                                }
                            });
                            
                        } else {
                            callback('error', null);
                            connection.release();
                            
                        }
                      
                        
                    }
                });
            }
        });
        
    }
}


function createQuery(datos) {
    var query="";
    for (var i = 0; i < parseInt(datos.total); i++) {
        query+= '(\''+datos.model+'\',\''+'13'+'\',\''+datos.bill+'\'),';
    }

    return 'INSERT INTO product (variant, location, bill) VALUES'+query.slice(0,-1);
    
}