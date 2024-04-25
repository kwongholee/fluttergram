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

router.get('/feed', async (req: Request, res: Response) => {
  try {
    const result = await feedModel.findOne({_id: new ObjectId(req.query.id)}).exec();
    res.status(200).json(result);
  }
  catch(err) {
    console.log(err);
    return res.status(400);
  }
})

router.get('/feed/main', async (req: Request, res: Response) => {
  try {
    const result = await feedModel.find({}).exec();
    if(result) {
      res.status(200).json(result);
    } else {
      res.status(200).json([]);
    }
  }
  catch(err) {
    console.log(err);
    return res.status(400);
  }
})

router.get('/feed/user', async (req: Request, res: Response) => {
  try {
    const result = await feedModel.find({"writer": req.query.userId}).exec();
    if(result) {
      res.status(200).json(result);
    } else {
      res.status(200).json([]);
    }
  }
  catch(err) {
    console.log(err);
    return res.status(400);
  }
})

module.exports = router;