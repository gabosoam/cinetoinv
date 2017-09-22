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

function isLoggedIn(req, res, next) {
  sess = req.session;
  if (sess.usuarioDatos)
    return next();
  sess.originalUrl = req.originalUrl;
  res.redirect('/login');
}


module.exports = router;
