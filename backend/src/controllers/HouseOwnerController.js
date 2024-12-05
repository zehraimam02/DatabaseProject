/**
 * Controller for house owner-related operations
 */

const {
    getAllHouseOwners: listAllHouseOwners
} = require("../models/HouseOwnerModel");
const db = require("../config/db");

/**
 * Get all employees
 * @param req - Request object
 * @param res - Response object
 */
async function getAllHouseOwners(req, res) {
    try {
        // get all house owners
        const houseOwners = await listAllHouseOwners();

        // send response with house owners in json
        res.json({ data: houseOwners });
    } catch (error) {
        res.status(500).json({ message: "Error fetching employees", error: err });
    }
}

// Add more methods for different operations


module.exports = {
    getAllHouseOwners
};