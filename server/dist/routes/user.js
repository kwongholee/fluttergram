"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var router = require('express').Router();
router.post('/new', function (req, res) {
    res.send('post new user');
});
router.put('/original', function (req, res) {
    res.send('edit original user');
});
router.delete('/original/secession', function (req, res) {
    res.send('delete original user');
});
router.put('/follower', function (req, res) {
    res.send('edit follower');
});
module.exports = router;
