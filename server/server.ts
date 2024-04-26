require('dotenv').config();
import express, { Express, Request, Response } from "express";
const app: Express = express();
const cors = require('cors');

const connectMongo = require('./config/connectMongo');
const connectNeo4j = require('./config/connectNeo4j');

app.use(cors());
app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.listen(process.env.SERVER_PORT,  () => {
  connectMongo();
  connectNeo4j();
  console.log('Server is running...');
})

app.use('/info', require('./routes/info'));
app.use('/user', require('./routes/user'));
app.use('/feed', require('./routes/feed'));
app.use('/message', require('./routes/message'));
app.use('/follow', require('./routes/follow'));