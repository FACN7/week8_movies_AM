const express = require("express");
const exphbs = require("express-handlebars");
const path = require("path");
const routes = require("./routes/index");
const helpers = require("./views/helpers/index");
const bodyParser = require("body-parser");

const app = express();

app.use("/public", express.static("public"));

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.engine(
  "hbs",
  exphbs({
    extname: "hbs",
    layoutsDir: path.join(__dirname, "views", "layouts"),
    partialsDir: path.join(__dirname, "views", "partials"),
    defaultLayout: "main",
    helpers
  })
);

app.set("port", 5000);
app.use(routes);

module.exports = app;
