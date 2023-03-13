import fs from "fs";
import path from "path";

export default async function saveQuoteView(req, res) {
  try {
    // parse data URL to get PNG as base 64 data
    const { png: dataURL } = JSON.parse(req.body);
    const base64data = dataURL.replace("data:image/png;base64,", "");

    // try and find where to save that as an image file...
    // const staticDir = path.normalize(__dirname + "../../../public/quoteviews");

    const saved = fs.writeFile("./public/quoteviews/out.png", base64data, "base64", (err) =>
      console.error(err)
    );
    console.log("saved", saved);

    if (saved === undefined) {
      throw new Error("Failed to save file to disk.");
    }

    res.status(200).send();
  } catch (error) {
    console.error(error);
    res.status(500).send();
  }
}
