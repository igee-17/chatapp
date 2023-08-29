const cors = require("cors");


const messagesRoutes = require("./routes/messages");
const socketHandler = require("./sockets/socketHandler");

socketHandler.app.use(cors());
socketHandler.app.use("/messages", messagesRoutes);

socketHandler.io.on("connection", socketHandler.listener);

const PORT = process.env.PORT || 8000;
socketHandler.server.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
