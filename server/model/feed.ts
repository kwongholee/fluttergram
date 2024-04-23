var mongoose = require('mongoose');

const feedSchema = new mongoose.Schema({
  "id": Number,
  "writer": String,
  "introduce": String,
  "like": Number
})
var feedModel = mongoose.model("Feed", feedSchema);
module.exports = feedModel;