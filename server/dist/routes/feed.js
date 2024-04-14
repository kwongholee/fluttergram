"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var router = require('express').Router();
router.post('/new', function (req, res) {
    res.send('post new feed');
});
router.put('/original', function (req, res) {
    res.send('edit original feed');
});
router.delete('/original/elimination', function (req, res) {
    res.send('delete original feed');
});
module.exports = router;
