const router = require('express').Router();
const mongoose = require('mongoose');
import { Request, Response } from 'express';
var feedModel = require('../model/feed');
var ObjectId = mongoose.Types.ObjectId;
var connectNeo4j = require('../config/connectNeo4j');

router.get('/user', async (req: Request, res: Response) => {
  var userId = req.query.id;
  try {
    const {driver} = await connectNeo4j();
    let {records, summary} = await driver.executeQuery(
      'MATCH (u: User {id: $id}) RETURN u',
      {id: userId},
      {database: 'neo4j'}
    );
    for(let record of records) {
      return res.status(200).json(record.get('u').properties);
    }
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
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