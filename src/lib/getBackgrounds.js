const fs = require("fs");
const path = require("path");

const rootFolder = path.normalize(__dirname + "../../..");
const backgroundsFolder = "public/backgrounds";

const backgroundsPath = path.join(rootFolder, backgroundsFolder);

console.log("cwd?", __dirname);
console.log(path.normalize(__dirname + "../../../public/backgrounds"));

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
