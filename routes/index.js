var express = require('express');
var router = express.Router();
var product = require('../model/product');

/* GET home page. */
router.get('/',isLoggedIn, function(req, res, next) {
	res.render('index', {  user: sess.usuarioDatos });
});

router.get('/login', function(req, res, next) {
	res.render('login',{message: null});
});
router.get('/entry', isLoggedIn, function(req, res, next) {
	res.render('entry',{  user: sess.usuarioDatos });
});

router.get('/report', isLoggedIn, function(req, res, next) {
	res.render('report',{  user: sess.usuarioDatos });
});

router.get('/report/read', function (req, res, next) {
  product.read(function (error, datos) {
    if (error) {
    } else {
      res.send(datos);
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

function isLoggedIn(req, res, next) {
  sess = req.session;
  if (sess.usuarioDatos)
    return next();
  sess.originalUrl = req.originalUrl;
  res.redirect('/login');
}

router.get('/logout', function (req, res) {
    req.session.destroy(function (err) {
        if (err) {
        } else {
            res.redirect('/login');
        }
    });
});


module.exports = router;
