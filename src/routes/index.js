const express = require("express");

const queries = require("../model/queries/queries.js");

const router = express.Router();

router.get("/", (req, res) => {
  queries
    .getAllMovies()
    .then(movies => res.render("movies", { movies }))
    .catch(err => console.log(err));
});

router.post("/ratefilm", (req, res) => {
  let stars = req.body.stars;
  let film_id = req.body.film_id;

  queries
    .updateRates(film_id, stars)
    .then(x => res.send())
    .catch(err => console.log(err));
});
module.exports = router;
