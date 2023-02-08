import Sequelize from "sequelize";

export async function initDb() {
  const dbConfig = {
    host: "localhost",
    db: "sequelize",
    username: "root",
    password: ""
  };
  
  const sequelize = new Sequelize(dbConfig.db, dbConfig.username, dbConfig.password, {
    host: dbConfig.host,
    dialect: "mysql",
  });
  
  try {
    await sequelize.authenticate();
    console.log("Connection to database successful.");
    return sequelize;
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
}

