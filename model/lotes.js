
var connection = require('../config/connection.js');

module.exports = {

    insertCategories: function (data, callback) { 
        var agree=[];

        if (typeof data == 'string') {
            insert(data);
        } else if (typeof data == 'object') {
            for (var i = 0; i < data.length; i++) {
                insert(data[i]);

            }

        }



        function insert(value) {
            connection.query({
                sql: 'SELECT * FROM `category` WHERE `name` = ?',
                timeout: 40000, // 40s 
                values: [value]
            }, function (error, results, fields) {
                if (error) {
                    return (error);
                } else {
                    var size = results.length;
                    if (size == 0) {
                        connection.query({
                            sql: 'INSERT INTO category(name) VALUES(?)',
                            timeout: 40000, // 40s 
                            values: [value]
                        }, function (error, results, fields) {
                            if (error) {
                                return (error);
                            } else {
                                agree.push(value);
                                return (results);
                            }
                        })
                    } else {
                    }
                }
            });
        }
        callback({data: agree});
    },

    insertBrands: function (data, callback) {

        if (typeof data == 'string') {
            insert(data);
        } else if (typeof data == 'object') {
            for (var i = 0; i < data.length; i++) {
                insert(data[i]);

            }

        }


        function insert(value) {
            connection.query({
                sql: 'SELECT * FROM `brand` WHERE `name` = ?',
                timeout: 40000, // 40s 
                values: [value]
            }, function (error, results, fields) {
                if (error) {
                    return (error);
                } else {
                    var size = results.length;
                    if (size == 0) {
                        connection.query({
                            sql: 'INSERT INTO brand(name) VALUES(?)',
                            timeout: 40000, // 40s 
                            values: [value]
                        }, function (error, results, fields) {
                            if (error) {
                                return (error);
                            } else {
                                return (results);
                            }
                        })
                    } else {
                    }
                }
            });
        }
        callback(mensaje);
    },

    insertModels: function (data, callback) {

        if (typeof data == 'string') {
            var split = data.split('+=+');
            var model = {
                description: split[0],
                code: split[1],
                category: split[2],
                brand: split[3]
            };

            insert(model);

        } else if (typeof data == 'object') {
            for (var i = 0; i < data.length; i++) {
                var split = data[i].split('+=+');
                var model = {
                    description: split[0],
                    code: split[1],
                    category: split[2],
                    brand: split[3]
                }

                insert(model);
            }

        }



        function insert(data) {
            connection.query({
                sql: 'SELECT * FROM `model` WHERE `code` = ?',
                timeout: 40000, // 40s 
                values: [data.code]
            }, function (error, results, fields) {
              
                if (error) {
                    return (error);
                } else {
                    var size = results.length;
                    if (size == 0) {
                        connection.query({
                            sql: 'INSERT INTO model(code, description, category, brand) VALUES(?,?,(SELECT id FROM category WHERE name=?),(SELECT id FROM brand WHERE name=?))',
                            timeout: 40000, // 40s 
                            values: [data.code, data.description, data.category, data.brand]
                        }, function (error, results, fields) {
                            if (error) {
                                return (error);
                            } else {
                                return (results);
                            }
                        })
                    } else {
                    }
                }
            });
        }
        callback(mensaje);
    },


    insertBarcode: function (data, callback) {

        if (typeof data == 'string') {
            var split = data.split('+=+');
            var model = {
                variant: split[0],
                barcode: split[1],
                price: split[2],
                location: split[3]
            };

            insert(model);

        } else if (typeof data == 'object') {
            for (var i = 0; i < data.length; i++) {
                var split = data[i].split('+=+');
                var model = {
                    variant: split[0],
                    barcode: split[1],
                    price: split[2],
                    location: split[3]
                }

                insert(model);
            }

        }



        function insert(data) {
          
            connection.query({
                sql: 'SELECT * FROM `product` WHERE `barcode` = ?',
                timeout: 40000, // 40s 
                values: [data.barcode]
            }, function (error, results, fields) {
                if (error) {
                    return (error);
                } else {
                    var size = results.length;
                    if (size == 0) {
                        connection.query({
                            sql: 'INSERT INTO product(barcode, variant, price, location) VALUES(?,(SELECT id FROM model WHERE code=?),?,(SELECT id FROM location WHERE name=?))',
                            timeout: 40000, // 40s 
                            values: [data.barcode, data.variant, data.price, data.location]
                        }, function (error, results, fields) {
                            if (error) {
                        
                                return (error);
                            } else {
                                return (results);
                            }
                        })
                    } else {
                    }
                }
            });
        }
        callback(mensaje);
    },

    insertLocation: function (data, callback) {

        if (typeof data == 'string') {
            insert(data);
        } else if (typeof data == 'object') {
            for (var i = 0; i < data.length; i++) {
                insert(data[i]);

            }

        }



        function insert(value) {
            connection.query({
                sql: 'SELECT * FROM `location` WHERE `name` = ?',
                timeout: 40000, // 40s 
                values: [value]
            }, function (error, results, fields) {
                if (error) {
                    return (error);
                } else {
                    var size = results.length;
                    if (size == 0) {
                        connection.query({
                            sql: 'INSERT INTO location(name) VALUES(?)',
                            timeout: 40000, // 40s 
                            values: [value]
                        }, function (error, results, fields) {
                            if (error) {
                                return (error);
                            } else {
                                return (results);
                            }
                        })
                    } else {
                    }
                }
            });
        }
        callback(mensaje);
    },
}
