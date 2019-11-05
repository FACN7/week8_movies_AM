const pgpFunc = require("pg-promise");
const pgp = pgpFunc();
const url = require("url");
const env = require("env2");
env("config.env");

let DB_URL = process.env.DB_URL;


if (process.env.NODE_ENV === "test") {
  DB_URL = process.env.TEST_DB_URL;
}

const params = url.parse(DB_URL);

const [username, password] = params.auth.split(":");

const options = {
  host: params.hostname,
  port: params.port,
  database: params.pathname.split("/")[1],
  max: process.env.DB_MAX_CONNECTIONS || 2
};

if (username) {
  options.user = username;
}
if (password) {
  options.password = password;
}

options.ssl = options.host !== "localhost";

module.exports = pgp(options);