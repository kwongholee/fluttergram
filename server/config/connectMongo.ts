var mongoose = require('mongoose');

const connectMongo = async () => {
  mongoose.Promise = global.Promise;
  await mongoose.connect(process.env.MONGO_URL, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Success to connect with mongo'))
  .catch((err: Error) => console.log(err))
}
module.exports = connectMongo;