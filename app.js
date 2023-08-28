const express = require("express");
const app = express();
const http = require("http");
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server, {
  cors: {
    // origin: "http://localhost:5174", // Replace with your frontend's URL
    origin: "0.0.0.0", // Replace with your frontend's URL
    methods: ["GET", "POST"],
    credentials: true,
  },
});
const mysql = require("mysql2");
const cors = require("cors");

//Setting up cors
const corsOption = {
  origin: "*",
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  credentials: true,
  exposedHeaders: ["x-auth-token"],
};

app.use(cors(corsOption));

const connection = mysql.createConnection({
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

app.get("/", (req, res) => {
  res.send("connection made!!");
});

app.get("/messages", (req, res) => {
  connection.query("SELECT * FROM messages", (error, results) => {
    if (error) {
      console.error("Error retrieving messages from MySQL:", error);
      res.status(500).json({ error: "Failed to retrieve messages" });
    } else {
      res.status(200).json(results);
    }
  });
});

io.on("connection", (socket) => {
  const username = socket.handshake.query.username;
  console.log("a user connected");
  let userConnected = true;

  socket.on("message", (data) => {
    console.log(data);
    const message = {
      message: data.message,
      sentAt: new Date().toISOString(),
      userId: data.id,
      family_id: data.familyId
      // userId: 1,
    };

    executeQuery();

    function executeQuery() {
      if (connection.state === "disconnected") {
        connection.connect((error) => {
          if (error) {
            console.error("Error reconnecting to database:", error);
          } else {
            console.log("Reconnected to database");
            performQuery();
          }
        });
      } else {
        performQuery();
      }
    }

    // Insert the message into the MySQL database
    function performQuery() {
      const formattedTimestamp = new Date(message.sentAt).toISOString().slice(0, 19).replace('T', ' ');

      // const userId = parseInt(message.userId, 10)

      connection.query(
        "INSERT INTO messages (message, sent_at, user_id, family_id) VALUES (?, ?, ?, ?)",
        // [message.message, message.sentAt, message.userId],
        [message.message, formattedTimestamp, message.userId, message.family_id],
        (error, results) => {
          if (error) {
            console.error("Error inserting message into MySQL:", error);
          } else {
            console.log("Message inserted into MySQL:", results);
            io.emit("message", message);
          }
        }
      );
    }

    // if (userConnected) {
    //   executeQuery();
    // }
  });

  socket.on("disconnect", () => {
    console.log("A user disconnected");
    userConnected = false;
    // connection.end();
  });
});

server.listen(8000, () => {
  console.log("Server listening on port 8000");
});
