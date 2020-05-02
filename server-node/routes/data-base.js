/**
 * This file contains the routes for roots that manipulate the data base.
 * Please be careful when you change something or you add something, and please
 * add a commenter line that describe your code you had added, and if you can
 * add a test-script for your code in the folder ../tests/tests_---.js.
 *                              Thank you !
 *            todo
 * */
// imports
const express = require('express');
// router for manipulate roots that use the data base
const router = express.Router();
// imports functions and methods
const databaseController = require('../controllers/data-base');
// import the middleware
const authMiddleware = require('../middleware/auth');

// Request for authentication to the system
router.post('/', authMiddleware, databaseController.login);
router.post('/modif-state-sub', databaseController.changeStateOfSubscription);
router.post('/savesubscription', databaseController.saveSubscription);
router.post('/add-notification', databaseController.addNotification);
router.post('/add-user', databaseController.addUser);
router.get('/get-notifications', databaseController.getUserNotifications);

/**
 * Export the router
 * */
module.exports = router;
