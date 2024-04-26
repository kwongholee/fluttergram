const neo4j = require('neo4j-driver');

const connectNeo4j = async () => {
  const URI = process.env.NEO4J_URI;
  const neo4jUser = process.env.NEO4J_USERNAME;
  const neo4jPassword = process.env.NEO4J_PASSWORD;

  try {
    const driver = neo4j.driver(URI, neo4j.auth.basic(neo4jUser, neo4jPassword));
    const session = driver.session();
    const serverInfo = await driver.verifyConnectivity();
    console.log('Success to connect with Neo4j');
    await session.close();
    return { driver };
  } catch (err) {
    console.log(err);
    throw err;
  }
}

module.exports = connectNeo4j;