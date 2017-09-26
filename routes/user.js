var express = require('express');
var router = express.Router();
var user = require('../model/user');
var prueba = require('../routes/users');

/* GET home page. */
router.get('/', isLoggedInAdmin, function (req, res, next) {
  res.render('user', { user: sess.adminDatos });

});





router.get('/admin', isLoggedInAdmin, function (req, res, next) {
  res.render('user', { user: sess.adminDatos });

});


router.get('/read', function (req, res, next) {
  user.read(function (error, datos) {
    if (error) {

    } else {
      res.send(datos);
    }
  })
});

router.get('/read2', function (req, res, next) {
  user.read2(function (error, datos) {
    if (error) {

    } else {
      res.send(datos);
    }
  })
});

router.post('/update', function (req, res, next) {
  var datos = req.body;
  user.update(datos, function (error, datos) {
    if (error) {
      res.sendStatus(500);
    } else {

      if (datos.affectedRows > 0) {
        res.send(true);
      } else {
        res.sendStatus(500);
      }
    }
  })
})

router.post('/editPassword', function (req, res, next) {

  var datos = req.body;
  user.updatePass(datos, function (error, datos) {
    if (error) {
      console.log(error);
      res.send(error);
    } else {
      console.log(datos);
      res.send(datos);
      
    }
  })
})

router.post('/delete', function (req, res, next) {
  var datos = req.body;
  user.delete(datos, function (error, datos) {
    if (error) {

      res.sendStatus(500);
    } else {

      if (datos.affectedRows > 0) {
        res.send(true);
      } else {
        res.sendStatus(500);
      }
    }
  })
})


router.post('/create', function (req, res, next) {
  var datos = req.body;
  user.create(datos, function (error, datos) {
    if (error) {

      res.sendStatus(500);
    } else {

      if (datos.affectedRows > 0) {

        res.send(true);
      } else {
        res.sendStatus(500);
      }
    }
  })
})


router.post('/login', function (req, res, next) {
  var sess = req.session;
  user.login(req.body, function (err, dates) {
    if (err) {
      res.render('login', { message: err })
    } else {

      if (dates.rol == 1) {
        sess.usuarioDatos = dates;
        res.redirect('/');

      } else {
        sess.adminDatos = dates;
        res.redirect('/admin');

      }


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

function isLoggedInAdmin(req, res, next) {
  sess = req.session;

  if (sess.adminDatos)
    return next();
  sess.originalUrl = req.originalUrl;
  res.redirect('/login');
}






module.exports = router;
