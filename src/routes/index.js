const express = require("express");

const queries = require("../model/queries/queries.js");

const router = express.Router();

let combinedData;
router.get("/", (req, res) => {
  res.render("home");
});

module.exports = router;
