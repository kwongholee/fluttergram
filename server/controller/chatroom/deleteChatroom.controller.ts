import { Request, Response } from "express";
import { ObjectId } from "mongodb";

var chatroomModel = require('../../model/chatroom');
var chatModel = require('../../model/chat');

const deleteChatroom = async (req: Request, res: Response) => {
  var chatroomId = req.params.id;
  try {
    await chatroomModel.findByIdAndDelete(chatroomId);
    await chatModel.deleteMany({_id: new ObjectId(chatroomId)});
    return res.status(200);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
}

module.exports = deleteChatroom;