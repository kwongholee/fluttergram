var mongoose = require('mongoose');

const chatroomSchema = mongoose.Schema({
  "user1": String,
  "user2": String
});
var chatroomModel = new mongoose.model("chatroom", chatroomSchema);

module.exports = chatroomModel;