const MongoClient = require('mongodb').MongoClient;

const connectDB = MongoClient.connect(process.env.MONGO_URL, async (err: any, client: any) => {
  if(err) console.log(err);
  var db = await client.db('Fluttergram');
  console.log(db);
})

module.exports = connectDB;