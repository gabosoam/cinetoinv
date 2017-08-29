var express = require('express');
var router = express.Router();
var model = require('../model/model');

/* GET home page. */
router.get('/', isLoggedIn, function (req, res, next) {
    if (sess.usuarioDatos.rol==1) {
    res.render('index', {  user: sess.usuarioDatos });
  } else {
   res.render('model', {  user: sess.usuarioDatos });
 }
});





router.get('/read', function (req, res, next) {
  model.read(function (error, datos) {
    if (error) {
    } else {
      res.send(datos);
    }
  })
});

router.get('/read2', function (req, res, next) {
  model.read2(function (error, datos) {
    if (error) {
    } else {
      res.send(datos);
    }
  })
});

router.post('/update', function (req,res,next) {
   var datos= req.body;
   model.update(datos,function(error, datos){
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
   model.delete(datos,function(error, datos){
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
   model.create(datos,function(error, datos){
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
