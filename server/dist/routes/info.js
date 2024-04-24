"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var router = require('express').Router();
var mongoose = require('mongoose');
var feedModel = require('../model/feed');
var ObjectId = mongoose.Types.ObjectId;
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
    var id = req.query.id;
    feedModel.findOne({ _id: new ObjectId(id) }, function (err, feed) {
        if (err || !feed) {
            console.log(err);
            return res.status(400);
        }
        return res.status(200).json(feed);
    });
});
router.get('/feed/main', function (req, res) {
    feedModel.find({}, function (err, feeds) {
        if (err) {
            console.log(err);
            return res.status(400);
        }
        return res.status(200).json(feeds);
    });
});
router.get('/feed/user', function (req, res) {
    var user = req.query.user;
    feedModel.find({ writer: user }, function (err, feeds) {
        if (err) {
            console.log(err);
            return res.status(400);
        }
        return res.status(200).json(feeds);
    });
});
module.exports = router;
