
const express = require("express");
const cors = require('cors');
const { global } = require("./config/global");
const routes = require("./controllers/index");

const app = express();

app.use(cors());
app.use(routes);

app.listen(global.port, global.hostname, function () {
  console.log('Server Is Listening at http://%s:%d', global.host, global.port);
});