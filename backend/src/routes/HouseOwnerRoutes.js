const express = require("express");
const router = express.Router();
const houseOwnerController = require('../controllers/HouseOwnerController');


//http://localhost:3001/api/employees
router.get("/houseOwners", houseOwnerController.getAllHouseOwners);

module.exports = router;