const mysql = require('mysql');
const connection = mysql.createConnection({
        host: "127.0.0.1", 
        user: "root", 
        password: '88888888', 
        database: "khan",
        port:3306
});

module.exports = connection;