const { connection, pool } = require("../db");
const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { fetchOldMessages } = require("./modules/groupChat");
const fetchOldDynastyMessages = require("./modules/dynastyChat");
const fetchOldPostMessages = require("./modules/postChat");
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
    const dynasty_id = socket.handshake.query.dynasty_id; // Get dynasty ID from frontend
    const post_id = socket.handshake.query.post_id; // Get post ID from frontend

    console.log('dynasty id', socket.handshake.query.dynasty_id);
    console.log('family id', socket.handshake.query.familyId);
    console.log('post id', socket.handshake.query.post_id);

    // ----------------------------------------------
    // -------------- GROUP CHAT --------------------
    // ----------------------------------------------
    // FETCH OLD MESSAGES AND EMIT (THESE ARE THE GROUP CHAT MESSAGES)
    const oldMessages = await fetchOldMessages(familyId)
    socket.emit("oldMessages", oldMessages);

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

    // -------------------------------------------
    // -------------- DYNASTY --------------------
    // -------------------------------------------
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

    // ------------------------------------------------------
    // --------------------COMMENTS--------------------------
    // ------------------------------------------------------
    const oldPostMessages = await fetchOldPostMessages(post_id);
    socket.emit("oldPostMessages", oldPostMessages);

    socket.on("post", async (data) => {
        const message = {
            message: data.message,
            sent_at: new Date().toISOString(),
            user_id: data.id,
            post_id: data.post_id,
        };

        try {
            const connection = await pool.getConnection();
            const formattedTimestamp = new Date(message.sent_at)
                .toISOString()
                .slice(0, 19)
                .replace("T", " ");

            const [results, fields] = await connection.execute(
                "INSERT INTO post_messages (message, sent_at, user_id, post_id) VALUES (?, ?, ?, ?)",
                [message.message, formattedTimestamp, message.user_id, message.post_id]
            );

            connection.release(); // Release the connection back to the pool

            console.log("Post Message inserted into MySQL:", results);

            // Emit the current message to all connected users in the dynasty chat
            io.emit("post", message);
        } catch (error) {
            console.error("Error inserting post message into MySQL:", error);
        }
    });

    socket.on("disconnect", () => {
        console.log("A user disconnected");
        // connection.end();
    });
};

module.exports = { app, io, server, listener, express }