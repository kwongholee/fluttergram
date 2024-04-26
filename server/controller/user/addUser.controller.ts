import { Request, Response } from "express";
const connectNeo4j = require('../../config/connectNeo4j');

var addUser = async (req: Request, res: Response) => {
  var userInfo = req.body;
  try {
    const { driver } = await connectNeo4j();
    let { records, summary } = await driver.executeQuery(
      'MERGE (u:User {id: $id, name: $name, introduce: $introduce})',
      { id: userInfo.id, name: userInfo.name, introduce: userInfo.introduce },
      { database: 'neo4j' }
    );
    console.log(
      `Created ${summary.counters.updates().nodesCreated} nodes ` +
      `in ${summary.resultAvailableAfter} ms.`
    );
    return res.status(200).send("User added successfully");
  } catch (err) {
    console.log(err);
    return res.status(400).send("Error adding user");
  }
}

module.exports = addUser;