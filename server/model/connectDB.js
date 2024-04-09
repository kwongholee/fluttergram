const MongoClient = require('mongodb').MongoClient;

const connectDB = MongoClient.connect(process.env.MONGO_URL, async (err, client) => {
  if(err) console.log(err);
  var db = await client.db('Fluttergram');
  console.log('success to connect with mongodb');
})

export {connectDB};