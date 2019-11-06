const db = require("../db_connection.js");

const getAllMovies = () => db.query("SELECT * FROM movies order by rate desc");

const getMovieRate = () =>
  db.query("SELECT movie_id, AVG(rate) FROM movierates GROUP BY movie_id");

const updateRates = (film_id, stars) =>
  db.query(`insert into movierates (movie_id,rate)values(${film_id},${stars})`);

module.exports = { getAllMovies, getMovieRate, updateRates };
