const db = require("../db_connection.js");

const getAllMovies = () => db.query("SELECT * FROM movies order by rate desc");

const getMovieRate = () =>
  db.query("SELECT movie_id, AVG(rate) FROM movierates GROUP BY movie_id");

module.exports = { getAllMovies, getMovieRate };
