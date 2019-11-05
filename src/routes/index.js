const express = require('express');

const queries = require('../model/queries/queries.js');

const router = express.Router();


router.get('/movies', (req, res) => {
  queries.getAllMovies()
  .then(movies => res.render('movies', { movies, layout:'main' }))
  .catch(err => console.log(err))
});

module.exports = router;
