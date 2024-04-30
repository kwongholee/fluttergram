import { Request, Response } from "express";

var chatModel = require('../../model/chat');

const addChat = async (req: Request, res: Response) => {
  var chat = req.body;
  try {
    var newChat = new chatModel({
      "chatroom": chat.chatroom,
      "user": chat.writer,
      "message": chat.message
    });
    await newChat.save();
    return res.status(200);    
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
};

module.exports = addChat;