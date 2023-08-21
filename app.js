const express = require("express");
const app = express();
const http = require("http");
const server = http.createServer(app);
// const socketIo = require("socket.io");
// const io = socketIo(server);
const { Server } = require("socket.io");
const io = new Server(server);
const messages = [];

// app.use(express.json());

// Express API routes for the frontend to interact with the chat system
// app.post("/send-message", (req, res) => {
//   console.log(req.body, "body");
//   const message = req.body.message;

//   io.emit("chat message", message);
//   res.status(200).json({ success: true });
// });

app.get("/", (req, res) => {
  // console.log("request made");
  res.send("connection made!!");
});

// Socket.io real-time communication
io.on("connection", (socket) => {
  // console.log(`Username: ${socket.handshake.query.username}`);
  const username = socket.handshake.query.username;
  socket.on("message", (data) => {
    console.log(data);
    const message = {
      message: data.message,
      // sender:data.sender,
      sentAt: Date.now(),
    };

    messages.push(message);
    io.emit("message", message);
  });

  socket.on("disconnect", () => {
    console.log("A user disconnected");
  });
});

server.listen(8080, () => {
  console.log("Server listening on port 8080");
});
