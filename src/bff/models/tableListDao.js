const { connection } = require('../config/db');

const dbRes = {};

dbRes.getTableListData = (cb) => {
  connection.query('SELECT * FROM animal', (err, res) => {
    if (err) throw err;
    console.log(res);
    cb?.(res);
  });
};

module.exports = dbRes;