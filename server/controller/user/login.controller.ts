import { Request, Response } from "express";
const connectNeo4j = require('../../config/connectNeo4j');

var logIn = async (req: Request, res: Response) => {
  var userInfo = req.body.id;
  try {
    const { driver } = await connectNeo4j();
    let { records, summary } = await driver.executeQuery(
      'MATCH (u:User {id: $id}) RETURN u',
      {id: userInfo},
      { database: 'neo4j' }
    );
    console.log(records);
    if(records.legnth == 0) return res.status(200).json({isLogin: false, message: "That's not a valid ID or PW"});
    else return res.status(200).json({isLogin: true});
  } catch (err) {
    console.log(err);
    return res.status(400).send({isLogin: false, message: "Server Error"});
  }
}

module.exports = logIn;