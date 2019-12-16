var sql = require("mssql");

var dbConfig = {
    server: "DESKTOP-3C6AMCT\\SQLEXPRESS",
    database: "BGrade",
    user: "kimquy",
    password: "kimquy060297",
    port: 1433
};

const db = new sql.ConnectionPool(dbConfig);
//console.log(db);
module.exports = db