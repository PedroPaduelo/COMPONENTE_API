const express = require('express');
const authMiddleware = require('./Middleware/auth');

const UserController = require('./Controllers/User/UserController')
const ListsController = require('./Controllers/Listas/ListsController')

const routes = express.Router();
routes.post('/LoginUser', UserController.LoginUser );
routes.post('/CreateUser', UserController.CreateUser );
routes.get('/GetUserToken', UserController.GetUserToken );

routes.post('/lists', ListsController.CreateList );

/**
 * Private route
 */
routes.use(authMiddleware);



module.exports = routes;
