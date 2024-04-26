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

router.get('/user/follow/check', async (req: Request, res: Response) => {
  var id1 = req.body.id1, id2 = req.body.id2;
  try {
    const {driver} = await connectNeo4j();
    let {records, summary} = await driver.executeQuery(
      'MATCH (:User {id: $id1})-[:Follow]->(:User {id: $id2}) RETURN COUNT(*) > 0 AS connected',
      {id1: id1, id2: id2},
      {database: 'neo4j'}
    );
    let record = records[0].get('connected');
    return res.status(200).json(record);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
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