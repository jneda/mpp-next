const fs = require("fs");
const path = require("path");
import { sequelize } from "../../db/sequelize";

const rootFolder = path.normalize(__dirname + "../../..");
const backgroundsFolder = "public/backgrounds";

export function getBackgrounds() {
  try {
    const backgroundPaths = fs.readdirSync(backgroundsFolder);
    return backgroundPaths.map((path, index) => ({
      id: index + 1,
      path,
    }));
  } catch (error) {
    throw new Error(error);
  }
}

export async function seedDb() {
  try {
    const backgrounds = getBackgrounds();
    const queryInterface = sequelize.getQueryInterface();
    await queryInterface.bulkInsert(
      "bgimages",
      backgrounds.map((background) => ({
        imagePath: background.path,
      }))
    );
  } catch (error) {
    throw new Error(error);
  }
}
