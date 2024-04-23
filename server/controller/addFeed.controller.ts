var feedModel = require('../model/feed');

const addFeed = async () => {
  var newFeed = new feedModel({
    "id": 1,
    "writer": "lgh",
    "introduce": "지우 미친 겁나 예뻐요~",
    "like": 1234
  });
  await newFeed.save();
  console.log(newFeed);
}

module.exports = addFeed;