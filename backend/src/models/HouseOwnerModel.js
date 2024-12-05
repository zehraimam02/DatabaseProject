const oracledb = require('oracledb');


async function listAllHouseOwners() {
    let connection;
    try {
        connection = await oracledb.getConnection();
        const result = await connection.execute(`SELECT * FROM HOUSE_OWNER`);
        return result.rows;
    } catch (error) {
        console.error('Error fetching house owners:', error);
        throw error;
    } finally {
        if (connection) {
            await connection.close();
        }
    }
}

  // Add more methods for CRUD operations


module.exports = {
    getAllHouseOwners: listAllHouseOwners
}