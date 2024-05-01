import { Request, Response } from "express";
const connectNeo4j = require('../../config/connectNeo4j');
const feedModel = require('../../model/feed');
const chatModel = require('../../model/chat');
const chatroomModel = require('../../model/chatroom');

const deleteUser = async (req: Request, res: Response) => {
  var userId = req.query.id;
  try {
    const {driver} = await connectNeo4j();
    let {records, summary} = await driver.executeQuery(
      'MATCH (u: User{id: $id}) DELETE u',
      {id: userId},
      {database: "neo4j"}
    );
    await chatModel.deleteMany({user: userId}).exec();
    await chatroomModel.deleteMany({$or: [{user1: userId}, {user2: userId}]}).exec();
    await feedModel.deleteMany({writer: userId}).exec();
    return res.status(200);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
};

module.exports = deleteUser;