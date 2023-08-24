const express = require("express");
const app = express();
const http = require("http");
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);
const mysql = require("mysql2");
const cors = require("cors");
// const mysql = require("mysql");
app.use(cors());
// Create a MySQL connection
// const connection = mysql.createConnection({
//   host: "127.0.0.1", // IP address of the server
//   port: 3306, // SSH port
//   user: "root", // Database user
//   password: "olaligbags", // Database password
//   database: "fatherland", // Database name
// });
const connection = mysql.createConnection({
  host: "sql6.freemysqlhosting.net", // IP address of the server
  // port: 3306, // SSH port
  user: "sql6640697", // Database user
  password: "bEYr4jHU8C", // Database password
  database: "sql6640697", // Database name
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

io.on("connection", (socket) => {
  const username = socket.handshake.query.username;

  socket.on("message", (data) => {
    console.log(data);
    const message = {
      message: data.message,
      sentAt: new Date().toISOString(),
      userId: data.id,
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
      connection.query(
        "INSERT INTO messages (message, sent_at, user_id) VALUES (?, ?, ?)",
        [message.message, message.sentAt, message.userId],
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
  });

  socket.on("disconnect", () => {
    console.log("A user disconnected");
  });
});

server.listen(8080, () => {
  console.log("Server listening on port 8080");
});
