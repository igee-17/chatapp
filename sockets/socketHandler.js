const { connection, pool } = require("../db");
const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const app = express();
const server = http.createServer(app);
const io = new Server(server, {
    cors: {
        // origin: "http://localhost:5174", // Replace with your frontend's URL
        origin: "0.0.0.0", // Replace with your frontend's URL
        methods: ["GET", "POST"],
        credentials: true,
    },
});

const listener = async (socket) => {
    const username = socket.handshake.query.username;
    console.log("a user connected");

    const familyId = socket.handshake.query.familyId; // Get family ID from frontend
    const dynasty_id = socket.handshake.query.dynasty_id; // Get family ID from frontend

    try {
        const connection = await pool.getConnection();

        // Retrieve old messages based on the family ID
        const [oldMessages, oldMessagesFields] = await connection.query(
            "SELECT * FROM messages WHERE family_id = ?",
            [familyId]
        );

        console.log('dynasty id', socket.handshake.query.dynasty_id);
        console.log('family id', socket.handshake.query.familyId);

        connection.release();

        // Emit old messages to the connected user
        socket.emit("oldMessages", oldMessages);
    } catch (error) {
        console.error("Error retrieving old messages from MySQL:", error);
    }

    socket.on("message", async (data) => {
        console.log(data);
        const message = {
            message: data.message,
            sent_at: new Date().toISOString(),
            user_id: data.id,
            family_id: data.familyId,
        };

        try {
            const connection = await pool.getConnection();

            const formattedTimestamp = new Date(message.sent_at)
                .toISOString()
                .slice(0, 19)
                .replace("T", " ");

            const [results, fields] = await connection.execute(
                "INSERT INTO messages (message, sent_at, user_id, family_id) VALUES (?, ?, ?, ?)",
                [message.message, formattedTimestamp, message.user_id, message.family_id]
            );

            connection.release(); // Release the connection back to the pool

            console.log("Message inserted into MySQL:", results);

            // Emit the current message to all connected users
            io.emit("message", message);
        } catch (error) {
            console.error("Error inserting message into MySQL:", error);
        }
    });

    // -------------- DYNASTY --------------------
    // Function to fetch old dynasty messages
    const fetchOldDynastyMessages = async (dynasty_id) => {
        try {
            const connection = await pool.getConnection();

            // Retrieve old dynasty messages based on the family ID
            const [oldDynastyMessages, oldMessagesFields] = await connection.query(
                "SELECT * FROM dynasty_messages WHERE dynasty_id = ?",
                [dynasty_id]
            );

            connection.release();

            // console.log(oldDynastyMessages, 'old dd');

            return oldDynastyMessages;
        } catch (error) {
            console.error("Error retrieving old dynasty messages from MySQL:", error);
            return [];
        }
    };

    // Fetch old dynasty messages and emit them to the user
    const oldDynastyMessages = await fetchOldDynastyMessages(dynasty_id);
    socket.emit("oldDynastyMessages", oldDynastyMessages);

    socket.on("dynasty", async (data) => {
        const message = {
            message: data.message,
            sent_at: new Date().toISOString(),
            user_id: data.id,
            dynasty_id: data.dynasty_id,
        };

        try {
            const connection = await pool.getConnection();
            const formattedTimestamp = new Date(message.sent_at)
                .toISOString()
                .slice(0, 19)
                .replace("T", " ");

            const [results, fields] = await connection.execute(
                "INSERT INTO dynasty_messages (message, sent_at, user_id, dynasty_id) VALUES (?, ?, ?, ?)",
                [message.message, formattedTimestamp, message.user_id, message.dynasty_id]
            );

            connection.release(); // Release the connection back to the pool

            console.log("Dynasty Message inserted into MySQL:", results);

            // Emit the current message to all connected users in the dynasty chat
            io.emit("dynasty", message);
        } catch (error) {
            console.error("Error inserting dynasty message into MySQL:", error);
        }
    });


    socket.on("disconnect", () => {
        console.log("A user disconnected");
        // connection.end();
    });
};

module.exports = { app, io, server, listener, express }