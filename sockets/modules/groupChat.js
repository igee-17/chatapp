const { pool } = require("../../db");

const fetchOldMessages = async (familyId) => {

    try {
        const connection = await pool.getConnection();

        // Retrieve old messages based on the family ID
        const [oldMessages, oldMessagesFields] = await connection.query(
            "SELECT * FROM messages WHERE family_id = ?",
            [familyId]
        );

        connection.release();

        return oldMessages

        // Emit old messages to the connected user
    } catch (error) {
        console.error("Error retrieving old messages from MySQL:", error);
    }
}

module.exports = { fetchOldMessages }