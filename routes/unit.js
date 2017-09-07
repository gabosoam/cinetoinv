var express = require('express');
var router = express.Router();
var unit = require('../model/unit');

/* GET home page. */
router.get('/', isLoggedIn, function (req, res, next) {
  res.render('unit', {  user: sess.adminDatos });
});
router.get('/read', function (req, res, next) {
  unit.read(function (error, datos) {
    if (error) {
      console.log(error);
    } else {
      res.send(datos);
    }
  })
});

router.post('/update', function (req,res,next) {
   var datos= req.body;
   unit.update(datos,function(error, datos){
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
   unit.delete(datos,function(error, datos){
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
   unit.create(datos,function(error, datos){
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
  if (sess.adminDatos)
    return next();
  sess.originalUrl = req.originalUrl;
  res.redirect('/login');
}






module.exports = router;
