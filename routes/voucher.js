var express = require('express');
var router = express.Router();
var voucher = require('../model/voucher');


router.get('/:voucher', isLoggedIn, function (req, res, next) {
  var vouchersend = req.params.voucher;

  voucher.readOne(vouchersend, function (error, data) {

    res.render('voucherDetail', { user: sess.usuarioDatos, bill: vouchersend, data: data[0] });
  })

});


router.get('/', isLoggedIn, function (req, res, next) {
  voucher.read(function (err, data) {
    if (err) {
      res.sendStatus(500);
    } else {
      res.send(data);
    }
  });
});

router.post('/create', function (req, res, next) {
  
    var datos = req.body;
    voucher.create(datos, function (error, datos) {
      if (error) {
  
        res.sendStatus(500);
      } else {
  
        if (datos.affectedRows > 0) {
          res.send(true);
        } else {
          res.sendStatus(500);
        }
      }
    })
  })

  router.post('/delete', function (req, res, next) {
    var datos = req.body;
    voucher.delete(datos, function (error, datos) {
      if (error) {
        res.sendStatus(500);
      } else {
        res.send(true);
      }
    })
  })

  router.post('/update', function (req, res, next) {
    var datos = req.body;
    voucher.update(datos, function (error, data) {
      if (error) {
  
        res.sendStatus(500);
      } else {
  
        if (data.affectedRows > 0) {
          res.send(true);
        } else {
          res.sendStatus(500);
        }
      }
    })
  })

function isLoggedIn(req, res, next) {
  sess = req.session;
  if (sess.usuarioDatos)
    return next();
  sess.originalUrl = req.originalUrl;
  res.redirect('/login');
}

module.exports = router;
