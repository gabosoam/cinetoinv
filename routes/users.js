var express = require('express');
var router = express.Router();
router.io = require('socket.io')();
var category = require('../model/category.js');
var brand = require('../model/brand.js');
var unit = require('../model/unit.js');
var provider = require('../model/provider.js');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});

router.io.on('connection', function (socket) {

  module.exports = {
    saludar: function () {
      socket.broadcast.emit('user connected');
    }
  }
  console.log('usuario conectado');

  socket.on('getDates', function (callback) {
    category.read2(function (error, category) {
      if (error) {
      } else {
        brand.read2(function (error, brand) {
          if (error) {
          } else {
            unit.read2(function (error, unit) {
              if (error) {
              } else {
                callback(category, brand, unit);
              }
            })
          }
        });
      }
    });
  });

  socket.on('getUnit', function (callback) {
    unit.read2(function (error, unit) {
      if (error) {

      } else {
        callback(unit);

      }

    })

  })

  socket.on('getProvider', function (callback) {
    provider.read2(function (error, unit) {
      if (error) {

      } else {
        console.log( unit);
        callback(unit);

      }

    })

  })



  socket.on('disconnect', function () {
    console.log("Desconectado");
  });
});

module.exports = router;
