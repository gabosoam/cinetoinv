var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', isLoggedIn, function(req, res, next) {
    if (sess.usuarioDatos.rol==1) {
    res.render('index', {  user: sess.usuarioDatos });
  } else {
   res.render('voucher', {  user: sess.usuarioDatos });
 }
});

function isLoggedIn(req, res, next) {
  sess = req.session;
  if (sess.usuarioDatos)
    return next();
  sess.originalUrl = req.originalUrl;
  res.redirect('/login');
}


module.exports = router;
