const mysql = require("mysql2/promise");
const mysql2 = require("mysql2");

const pool = mysql.createPool({
    host: "157.90.167.161",
    port: 3306,
    user: "hackerdev",
    password: "F@ther35l@nd",
    database: "fatherland",
    connectionLimit: 1000, // Adjust as needed
});

const connection = mysql2.createConnection({
    host: "157.90.167.161", // IP address of the server
    port: 3306, // SSH port
    user: "hackerdev", // Database user
    password: "F@ther35l@nd", // Database password
    database: "fatherland", // Database name
});

// Establish the connection
connection.connect((error) => {
    if (error) {
        console.error("Error connecting to database:", error);
    } else {
        console.log("Connected to database");
    }
});

module.exports = { connection, pool };
