var express = require('express');
var router = express.Router();
var user = require('../model/user');
var prueba = require('../routes/users');

/* GET home page. */
router.get('/', isLoggedIn, function (req, res, next) {
  if (sess.usuarioDatos.rol==1) {
    res.render('index', {  user: sess.usuarioDatos });
  } else {
   res.render('user', {  user: sess.usuarioDatos });
 }

});




router.get('/read', function (req, res, next) {
  user.read(function (error, datos) {
    if (error) {
      console.log(error);
    } else {
      res.send(datos);
    }
  })
});

router.post('/update', function (req,res,next) {
 var datos= req.body;
 user.update(datos,function(error, datos){
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
 user.delete(datos,function(error, datos){
  if (error) {
    console.log(error);
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
 user.create(datos,function(error, datos){
  if (error) {
    console.log(error);
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


router.post('/login', function (req,res,next) {
  var sess = req.session;
  user.login(req.body, function (err, dates) {
    if (err) {
      res.render('login',{message:err})
    } else {
      sess.usuarioDatos = dates;
      res.redirect('/');
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
