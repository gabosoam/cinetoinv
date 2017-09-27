var express = require('express');
var router = express.Router();
var product = require('../model/product');
var cosa = require('../app');


//cosa.myEmitter.emit('event');

/* GET home page. */
router.get('/',isLoggedIn, function(req, res, next) {
	res.render('index', {  user: sess.usuarioDatos });
});

router.get('/vouchers',isLoggedIn, function(req, res, next) {
	res.render('voucher', {  user: sess.usuarioDatos });
});

router.get('/admin', isLoggedInAdmin, function (req, res, next) {
	res.render('admin', {  user: sess.adminDatos });
});

router.get('/login', function(req, res, next) {
	res.render('login',{message: null});
});

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



router.get('/logout', function (req, res) {
	req.session.destroy(function (err) {
		if (err) {
		} else {
			res.redirect('/login');
		}
	});
});


module.exports = router;
