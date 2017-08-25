var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/',isLoggedIn, function(req, res, next) {
	res.render('index', {  user: sess.usuarioDatos });
});

router.get('/login', function(req, res, next) {
	res.render('login');
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
