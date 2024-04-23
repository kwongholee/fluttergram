var mongoose = require('mongoose');

const connectMongo = async () => {
  await mongoose.connect(process.env.MONGO_URL)
  .then(() => console.log('Success to connect with mongo'))
  .catch((err: Error) => console.log(err))
}
module.exports = connectMongo;