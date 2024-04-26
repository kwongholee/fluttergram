import { Request, Response } from "express";
const connectNeo4j = require('../../config/connectNeo4j');

var addFollow = async (req: Request, res: Response) => {
  try {
    const { driver } = await connectNeo4j();
    let { records, summary } = await driver.executeQuery(
      'MATCH (u1:User {id: $id1}), (u2:User {id: $id2}) CREATE (u1)-[:Follow]->(u2)',
      { id1: req.query.id1, id2: req.query.id2 },
      { database: 'neo4j' }
    );
    return res.status(200);
  } catch (err) {
    console.log(err);
    return res.status(400);
  }
}

module.exports = addFollow;