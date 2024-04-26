var chatroomModel = require('../model/chatroom');

const addChatroom = async () => {
  var newChatroom = new chatroomModel({
    "user1": "test1",
    "user2": "test2"
  });
  await newChatroom.save();
  console.log(newChatroom);
}

module.exports = addChatroom;