require('dotenv').config();
const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors());
app.use(express.urlencoded({extended: true}));

app.listen(process.env.SERVER_PORT, (req,res) => {
  console.log('Server is running...');
})