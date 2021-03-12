const express = require('express');
const authMiddleware = require('./Middleware/auth');

const UserController = require('./Controllers/User/UserController')


const routes = express.Router();
routes.post('/LoginUser', UserController.LoginUser );
routes.post('/CreateUser', UserController.CreateUser );
routes.get('/GetUserToken', UserController.GetUserToken );



/**
 * Private route
 */
routes.use(authMiddleware);



module.exports = routes;
