const cors = require("cors");
const getMessages = require("./routes/messages");
const messagesRoutes = require("./routes/messages");
const socketHandler = require("./sockets/socketHandler");

socketHandler.app.use(cors());

socketHandler.app.get("/", (req, res) => {
  res.send("connection made!!");
});

socketHandler.app.get("/messages", getMessages);

socketHandler.io.on("connection", socketHandler.listener);

const PORT = process.env.PORT || 8000;
socketHandler.server.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
