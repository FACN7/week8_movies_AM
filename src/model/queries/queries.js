const db = require("../db_connection.js");

const getAllMovies = () => db.query("SELECT * FROM movies order by rate ASC");

module.exports = { getAllMovies };
