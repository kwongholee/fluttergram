"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var router = require('express').Router();
router.post('/new', function (req, res) {
    res.send('make new chatroom');
});
router.post('/:groupid', function (req, res) {
    res.send('send new chat');
});
router.put('/:groupid/original', function (req, res) {
    res.send('edit my chat');
});
router.delete('/elimination/record/:groupid', function (req, res) {
    res.send('delete my chat');
});
router.delete('/elimination/:groupid', function (req, res) {
    res.send('delete chatroom');
});
module.exports = router;
