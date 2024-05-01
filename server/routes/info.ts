const router = require('express').Router();
const mongoose = require('mongoose');
import { Request, Response } from 'express';
var feedModel = require('../model/feed');
var chatModel = require('../model/chat');
var chatroomModel = require('../model/chatroom');
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

router.get('/user/follower', async (req: Request, res: Response) => {
  var id = req.query.id;
  try {
    let data;
    const {driver} = await connectNeo4j();
    let {records, summary} = await driver.executeQuery(
      'MATCH (u: User {id: $id})-[:Follow]->(f) RETURN f',
      {id: id},
      {database: 'neo4j'}
    );
    for(let record of records) {
      data = (record.get("f"));
      return res.status(200).json(data);
    }
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
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
    console.log(`${id1} and ${id2} are ${record}`);
    return res.status(200).json(record);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
})

router.get('/chatroom', async (req: Request, res: Response) => {
  var id = req.query.id;
  try {
    const result = await chatroomModel.find({$or: [{user1: id}, {user2: id}]}).exec();
    return res.status(200).json(result);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
})

router.get('/chatroom/message', async (req: Request, res: Response) => {
  var room = req.query.chatroom, limit: any = req.query.limit, skip: any = req.query.skip;
  try {
    const result = await chatModel.find({chatroom: room}).skip(parseInt(skip)).limit(parseInt(limit)).exec();
    return res.status(400).json(result);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
})

router.get('/feed', async (req: Request, res: Response) => {
  try {
    const result = await feedModel.findOne({_id: new ObjectId(req.query.id)}).exec();
    return res.status(200).json(result);
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