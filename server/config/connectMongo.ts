var mongoose = require('mongoose');

const connectMongo = async () => {
  mongoose.Promise = global.Promise;
  await mongoose.connect(process.env.MONGO_URL, { useNewUrlParser: true, useUnifiedTopology: true })
  .catch((err: Error) => console.log(err))
}
module.exports = connectMongo;