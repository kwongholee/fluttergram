"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require('dotenv').config();
var express_1 = __importDefault(require("express"));
var app = (0, express_1.default)();
var cors = require('cors');
var connectMongo = require('./config/connectMongo');
var connectNeo4j = require('./config/connectNeo4j');
var addFeed = require('./controller/addFeed.controller');
app.use(cors());
app.use(express_1.default.urlencoded({ extended: true }));
app.use(express_1.default.json());
app.listen(process.env.SERVER_PORT, function () {
    connectMongo();
    connectNeo4j();
    console.log('Server is running...');
});
app.use('/info', require('./routes/info'));
app.use('/user', require('./routes/user'));
app.use('/feed', require('./routes/feed'));
app.use('/message', require('./routes/message'));
app.get('*', function (req, res) { console.log("server is running"); });
