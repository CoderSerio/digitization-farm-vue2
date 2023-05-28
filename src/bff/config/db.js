const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: '127.0.0.1',
  port: '3306',
  user: 'root',
  password: '12345678',
  database: 'animal',
});

connection.connect();

exports.connection = connection;
