const express = require("express");

const queries = require("../model/queries/queries.js");

const router = express.Router();
let combinedData;
router.get("/", (req, res) => {
  Promise.all([queries.getAllMovies(), queries.getMovieRate()])
    .then(data => {
      combinedData = data[0].map(allMovies => {
        const allRatings= data[1].filter(x=>x.movie_id===allMovies.id)[0];
        return {
          ...allMovies,
          ...allRatings
        }
      }).sort((a,b)=> {return b.rate-a.rate});
      
      res.render("movies", { combinedData })

  })
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
