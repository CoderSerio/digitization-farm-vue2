const { connection } = require('../config/db');

const dbRes = {};

dbRes.getStatisticsData = (cb) => {
  connection.query('SELECT * FROM statisticdata', (err, res) => {
    if (err) throw err;
    console.log(res);
    cb?.(res);
  });
};

module.exports = dbRes;