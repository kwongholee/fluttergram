require('dotenv').config();
import express, { Express, Request, Response } from "express";
const app: Express = express();
const cors = require('cors');

app.use(cors());
app.use(express.urlencoded({extended: true}));

app.listen(process.env.SERVER_PORT,  () => {
  console.log('Server is running...');
})

app.get('/', (req: Request, res: Response) => {
  res.send("mainpage");
})