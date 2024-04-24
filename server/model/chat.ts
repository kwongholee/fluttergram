import { ObjectId } from "mongodb";
var mongoose = require('mongoose');

const chat = mongoose.Schema({
  "chatroom": ObjectId,
  "user": String,
  "message": String
});

var chatModel = mongoose.model("chat", chat);

module.exports = chatModel;