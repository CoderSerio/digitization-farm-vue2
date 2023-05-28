const { connection } = require('../config/db');

const dbRes = {};

dbRes.getOverviewData = (cb) => {
  connection.query('SELECT * FROM overviewdata', (err, res) => {
    if (err) throw err;
    console.log(res);
    cb?.(res);
  });
};

module.exports = dbRes;