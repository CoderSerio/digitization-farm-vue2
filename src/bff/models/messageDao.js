const { connection } = require('../config/db');

const dbRes = {};

dbRes.getMessageData = (cb) => {
  connection.query('SELECT * FROM messagedata', (err, res) => {
    if (err) throw err;
    console.log(res);
    cb?.(res);
  });
};

module.exports = dbRes;