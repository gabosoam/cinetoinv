var express = require('express');
var router = express.Router();
var voucher = require('../model/voucher');


router.get('/:voucher', isLoggedIn, function (req, res, next) {
  var vouchersend = req.params.voucher;

  voucher.readOne(vouchersend, function (error, data) {

    res.render('voucherDetail', { user: sess.usuarioDatos, bill: vouchersend, data: data[0] });
  })

});


router.get('/', function (req, res, next) {
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


  router.get('/read/:bill', isLoggedIn, function (req, res, next) {
    var bill = req.params.bill;

    voucher.read2(bill, function (error, data) {
      res.send(data);

    })
  });

  router.post('/delete',isLoggedIn, function (req, res, next) {
    var data = req.body;
    voucher.delete(data, function (error, data) {
      if (error) {
        res.sendStatus(500);
      } else {
        res.send(true);
      }
    })
  })

  router.post('/close', isLoggedIn, function (req, res, next) {
    var data = req.body;
    voucher.closeVoucher(data,function(error, data) {
      if (error) {
        res.send(error);
      } else {
        res.send(data);
      }
    });
  });

  router.post('/update',isLoggedIn, function (req, res, next) {
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

  router.post('/updateAdmin',isLoggedInAdmin, function (req, res, next) {
    var datos = req.body;
    voucher.updateAdmin(datos, function (error, data) {
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

function isLoggedInAdmin(req, res, next) {
	sess = req.session;

	if (sess.adminDatos)
	return next();
	sess.originalUrl = req.originalUrl;
	res.redirect('/login');
}


module.exports = router;
