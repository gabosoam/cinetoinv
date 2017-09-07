var express = require('express');
var router = express.Router();
var client = require('../model/client');

/* GET home page. */
router.get('/', isLoggedIn, function (req, res, next) {
  res.render('client', {  user: sess.usuarioDatos });
});





router.get('/read', function (req, res, next) {
  client.read(function (error, datos) {
    if (error) {
      console.log(error);
    } else {
      res.send(datos);
    }
  })
});

router.post('/update', function (req,res,next) {
   var datos= req.body;
   client.update(datos,function(error, datos){
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
   client.delete(datos,function(error, datos){
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
   client.create(datos,function(error, datos){
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

function isLoggedIn(req, res, next) {
  sess = req.session;
  if (sess.usuarioDatos)
    return next();
  sess.originalUrl = req.originalUrl;
  res.redirect('/login');
}







module.exports = router;
