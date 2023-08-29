const { pool } = require("../../db");

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

module.exports = fetchOldDynastyMessages