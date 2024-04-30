import { Request, Response } from "express";

var chatroomModel = require('../../model/chatroom');

const addChatroom = async (req: Request, res: Response) => {
  var user1 = req.params.user1, user2 = req.params.user2;
  try {
    var newChatroom = new chatroomModel({
      "user1": user1,
      "user2": user2
    });
    await newChatroom.save();
    return res.status(200);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
}

module.exports = addChatroom;