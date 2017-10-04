var express = require('express');
var router = express.Router();
var product = require('../model/product');
var cosa = require('../app');
var index = require('../model/index');
var lotes = require('../model/lotes');


//cosa.myEmitter.emit('event');

/* GET home page. */
router.get('/', isLoggedIn, function (req, res, next) {
	res.render('index', { user: sess.usuarioDatos });
});


router.get('/generateBarcode', isLoggedIn, function (req, res, next) {
	index.createBarcode(function (error, data) {
		if (error) {
			res.send(error);
		} else {
			res.send(data);
		}
	})

});

router.get('/vouchers', isLoggedIn, function (req, res, next) {
	res.render('voucher', { user: sess.usuarioDatos });
});

router.get('/billAdmin', isLoggedInAdmin, function (req, res, next) {
	res.render('billAdmin', { user: sess.adminDatos });
});

router.get('/lotes', isLoggedInAdmin, function (req, res, next) {
	res.render('lotes', { user: sess.adminDatos });
});

router.post('/lotes/category', isLoggedInAdmin, function (req, res, next) {
	var data = req.body;
	var values = data['aux[]'];

	lotes.insertCategories(values, function (mensaje) {
		res.send(mensaje);
	})


});

router.post('/lotes/model', isLoggedInAdmin, function (req, res, next) {
	var data = req.body;
	var values = data['aux[]'];
	
	lotes.insertModels(values, function (mensaje) {
		res.send(mensaje);
	})
	

});

router.post('/lotes/barcode', isLoggedInAdmin, function (req, res, next) {
	var data = req.body;
	var values = data['aux[]'];
	
	lotes.insertBarcode(values, function (mensaje) {
		console.log(mensaje);
		res.send(mensaje);
	})
	

});

router.post('/lotes/brand', isLoggedInAdmin, function (req, res, next) {
	var data = req.body;
	var values = data['aux[]'];

	lotes.insertBrands(values, function (mensaje) {
		res.send(mensaje);
	})


});

router.post('/lotes/location', isLoggedInAdmin, function (req, res, next) {
	var data = req.body;
	var values = data['aux[]'];

	lotes.insertLocation(values, function (mensaje) {
		res.send(mensaje);
	})


});

router.get('/voucherAdmin', isLoggedInAdmin, function (req, res, next) {
	res.render('voucherAdmin', { user: sess.adminDatos });
});

router.get('/admin', isLoggedInAdmin, function (req, res, next) {
	res.render('admin', { user: sess.adminDatos });
});

router.get('/login', function (req, res, next) {
	res.render('login', { message: null });
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
