var express = require('express');
var router = express.Router();
var product = require('../model/product');

/* GET home page. */
router.get('/', isLoggedIn, function(req, res, next) {
    if (sess.usuarioDatos.rol==1) {

    
    res.render('index', {  user: sess.usuarioDatos });
  } else {
   
   res.render('product', {  user: sess.usuarioDatos });
 }
});

router.get('/read', isLoggedIn, function(req,res,next) {
  product.read(function(error, data) {
    if (error) {
      res.send(error);
    } else {
      res.send(data);
    }
  });
})

router.post('/create', isLoggedIn, function(req, res, next) {
  var datos = req.body;

  product.create(datos, function(error, data) {
    if (error) {
      res.send(error);
    } else {
      res.send(data);
    }
  })
});

router.post('/delete',isLoggedIn,function(req,res,next) {
  var data= req.body;

  product.delete(data, function(error, data) {
    if (error) {
      res.sendStatus(500);
    } else {
      res.send(true);
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
