require('dotenv').config();
import express, { Express, Request, Response } from "express";
const app: Express = express();
const cors = require('cors');
const connectDB = require('./model/connectDB');

app.use(cors());
app.use(express.urlencoded({extended: true}));

app.listen(process.env.SERVER_PORT,  () => {
  connectDB;
  console.log('Server is running...');
})

app.use('/info', require('./routes/info'));
app.use('/user', require('./routes/user'));
app.use('/feed', require('./routes/feed'));
app.use('/message', require('./routes/message'));

app.get('/', (req: Request, res: Response) => {
  res.send("mainpage");
})