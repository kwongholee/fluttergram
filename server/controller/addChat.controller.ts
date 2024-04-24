var chatModel = require('../model/chat');

const addChat = async () => {
  var newChat = new chatModel({
    "chatroom": "",
    "user": "test",
    "message": "test입니다"
  });
  await newChat.save();
  console.log(newChat);
};

module.exports = addChat;