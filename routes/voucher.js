var express = require('express');
var router = express.Router();
var voucher = require('../model/voucher');

router.get('/', isLoggedIn, function (req, res, next) {
  res.render('index', { user: sess.usuarioDatos });
});

router.get('/read', isLoggedIn, function (req, res, next) {
  voucher.read(function (err, data) {
    if (err) {
      res.sendStatus(500);
    } else {
      res.send(data);
    }
  });

});

function isLoggedIn(req, res, next) {
  sess = req.session;
  if (sess.usuarioDatos)
    return next();
  sess.originalUrl = req.originalUrl;
  res.redirect('/login');
}

module.exports = router;
