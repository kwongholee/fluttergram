const router = require('express').Router();
const mongoose = require('mongoose');
import { Request, Response } from 'express';
var feedModel = require('../model/feed');
var ObjectId = mongoose.Types.ObjectId;

router.get('/user', (req: Request, res: Response) => {
  res.send("user info");
})

router.get('/user/follower', (req: Request, res: Response) => {
  res.send("user follower info");
})

router.get('/message', (req: Request, res: Response) => {
  res.send("chatroom info");
})

router.get('/feed', (req: Request, res: Response) => {
  var id = req.query.id;
  feedModel.findOne({_id: new ObjectId(id)}, (err: Error, feed: any) => {
    if(err || !feed) {
      console.log(err);
      return res.status(400);
    }
    return res.status(200).json(feed);
  })
})

router.get('/feed/main', (req: Request, res: Response) => {
  feedModel.find({}, (err: Error, feeds: any) => {
    if(err) {
      console.log(err);
      return res.status(400);
    }
    return res.status(200).json(feeds);
  })
})

router.get('/feed/user', (req: Request, res: Response) => {
  var user = req.query.user;
  feedModel.find({writer: user}, (err: Error, feeds: any) => {
    if(err) {
      console.log(err);
      return res.status(400);
    }
    return res.status(200).json(feeds);
  })
})

module.exports = router;