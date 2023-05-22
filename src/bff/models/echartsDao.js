const { connection } = require('../config/db');

const dbRes = {};

dbRes.getEchartsData = async (cb) => {
  connection.query('SELECT * FROM animal', (err, res) => {
    if (err) throw err;
    console.log(res);
    cb?.(res);
  });
};

module.exports = dbRes;