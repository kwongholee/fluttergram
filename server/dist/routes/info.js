"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var router = require('express').Router();
router.get('/user', function (req, res) {
    res.send("user info");
});
router.get('/user/follower', function (req, res) {
    res.send("user follower info");
});
router.get('/message', function (req, res) {
    res.send("chatroom info");
});
router.get('/feed', function (req, res) {
    res.send("feed info");
});
module.exports = router;
