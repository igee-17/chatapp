const { pool } = require("../db");
const { express } = require("../sockets/socketHandler");

// const express = require("express");
const router = express.Router();

const getMessages = router.get("/messages", async (req, res) => {
    console.log('route entered');
    try {
        console.log("Acquiring connection from the pool...");
        const connection = await pool.getConnection();
        console.log("Connection acquired.");
        const [results, fields] = await connection.query("SELECT * FROM messages");
        connection.release();
        console.log("Connection released.");
        res.status(200).json(results);
    } catch (error) {
        console.error("Error retrieving messages from MySQL:", error);
        res.status(500).json({ error: "Failed to retrieve messages" });
    }
});

module.exports = getMessages;
