import fs from "fs";
import path from "path";

import formidable from "formidable";

// prevent Next from consuming form data
export const config = {
  api: { bodyParser: false },
};

export default async function saveQuoteView(req, res) {
  console.log(req.body);
  try {
    const form = new formidable.IncomingForm();
    form.parse(req, (err, fields, files) => {
      if (err) throw err;
      const oldPath = files.quoteView.filepath;
      const newPath = "public/quoteviews/" + files.quoteView.originalFilename;
      // console.log(`File would be saved as ${newPath}`);

      fs.rename(oldPath, newPath, (err) => {
        if (err) throw err;
        res.status(200).json({ "message": `File saved at ${newPath}` });
      });
    });    
  } catch (error) {
    console.error(error);
    const message = "Erreur lors de l'enregistrement du fichier."
    res.status(500).json({message});
  }
}
