const db = require('../db_connection.js');

const getAllMovies = () => db.query('SELECT * FROM movies');

module.exports = {getAllMovies};
