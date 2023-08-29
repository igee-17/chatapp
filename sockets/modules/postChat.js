const { pool } = require("../../db");

// Function to fetch old post messages
const fetchOldPostMessages = async (post_id) => {
    try {
        const connection = await pool.getConnection();

        // Retrieve old post messages based on the family ID
        const [oldPostMessages, oldMessagesFields] = await connection.query(
            "SELECT * FROM post_messages WHERE post_id = ?",
            [post_id]
        );

        connection.release();

        return oldPostMessages;
    } catch (error) {
        console.error("Error retrieving old post messages from MySQL:", error);
        return [];
    }
};

module.exports = fetchOldPostMessages