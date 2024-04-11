"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require('dotenv').config();
var express_1 = __importDefault(require("express"));
var app = (0, express_1.default)();
var cors = require('cors');
app.use(cors());
app.use(express_1.default.urlencoded({ extended: true }));
app.listen(process.env.SERVER_PORT, function () {
    console.log('Server is running...');
});
app.get('/', function (req, res) {
    res.send("mainpage");
});
