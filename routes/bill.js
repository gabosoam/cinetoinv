var express = require('express');
var router = express.Router();
var bill = require('../model/bill');
var product= require('../model/product');

/* GET home page. */
router.get('/', isLoggedIn, function (req, res, next) {
  res.render('bill', {  user: sess.usuarioDatos });
});


router.get('/:bill',isLoggedIn, function(req,res,next) {
  var billsend = req.params.bill;

  bill.readOne(billsend, function(error,data) {
    console.log(data[0].id);

      res.render('product', {  user: sess.usuarioDatos, bill: billsend, data: data[0] });
  })

});

router.get('/read/:bill',isLoggedIn, function(req,res,next) {
  var bill = req.params.bill;

  product.readBill(bill,function(error,data) {
    res.send(data);

  })
});



router.post('/read', function (req, res, next) {
  bill.read(function (error, datos) {
    if (error) {
    } else {
      res.send(datos);
    }
  })
});

router.post('/read2', function (req, res, next) {
  bill.read2(function (error, datos) {
    if (error) {
    } else {
      res.send(datos);
    }
  })
});

router.post('/update', function (req,res,next) {
   var datos= req.body;
   bill.update(datos,function(error, datos){
    if (error) {

      res.sendStatus(500);
    } else {

      if (datos.affectedRows>0) {
           res.send(true);
      } else {
            res.sendStatus(500);
      }
    }
  })
})

router.post('/delete', function (req,res,next) {
   var datos= req.body;
   bill.delete(datos,function(error, datos){
    if (error) {

      res.sendStatus(500);
    } else {

      if (datos.affectedRows>0) {
           res.send(true);
      } else {
            res.sendStatus(500);
      }
    }
  })
})


router.post('/create', function (req,res,next) {

   var datos= req.body;
   bill.create(datos,function(error, datos){
    if (error) {

      res.sendStatus(500);
    } else {

      if (datos.affectedRows>0) {
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
