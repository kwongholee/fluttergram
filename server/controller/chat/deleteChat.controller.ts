import { Request, Response } from "express";
var chatModel = require('../../model/chat');

const deleteChat = async (req: Request, res: Response) => {
  var _id = req.params.id;
  var content = req.body;
  try {
    const chat = await chatModel.findById(_id).exec();
    if(chat.id != content.id) return res.status(200).json({"message": "You can't delete this message cause you are not a writer of this chat!"});
    await chatModel.findByIdAndDelete(_id);
    return res.status(200);
  } catch(err) {
    console.log(err);
    return res.status(400);
  } 
}

module.exports = deleteChat;