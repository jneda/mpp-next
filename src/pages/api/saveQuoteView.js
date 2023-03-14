import fs from "fs";
import formidable from "formidable";

import { BgImage, Color, Font, QuoteView, QuoteViewStyle } from "db/sequelize";
import quoteViewStyle from "db/models/quoteViewStyle";

// prevent Next from consuming form data
export const config = {
  api: { bodyParser: false },
};

export default async function saveQuoteView(req, res) {
  // console.log(req.body);
  try {
    const form = new formidable.IncomingForm();
    form.parse(req, async (err, fields, files) => {
      if (err) throw err;

      const previewFileName = files.quoteView.originalFilename;

      const oldPath = files.quoteView.filepath;
      const newPath = "public/quoteviews/" + previewFileName;
      // console.log(`File would be saved as ${newPath}`);

      // save file to public/quoteviews
      await fs.promises.rename(oldPath, newPath);

      // process style data

      const styles = JSON.parse(fields.styles);
      // console.log(styles);

      let {
        image: imagePath,
        contentFont: contentFontName,
        contentFontSize,
        authorFont: authorFontName,
        authorFontSize,
        fgColor: contentColor,
        fgaColor: authorColor,
      } = styles;

      // get background image id
      const imageFile = imagePath.replace("/backgrounds/", "");
      const bgImage = await BgImage.findOne({
        where: { imagePath: imageFile },
      });
      if (!bgImage) {
        throw new Error("Image not found.");
      }
      const bgImageId = bgImage.id;
      // console.log("bgImageId:", bgImageId);

      // get content font id

      const contentFontId = await getFontId(contentFontName);
      // console.log(contentFontId);

      // get author font id

      const authorFontId = await getFontId(authorFontName);
      // console.log(authorFontId);

      // get content color id
      const contentColorId = await getColorId(contentColor);
      // console.log("contentColorId", contentColorId);

      // get author color id
      const authorColorId = await getColorId(contentColor);
      // console.log("authorColorId", authorColorId);

      // make a dummy label
      // use preview image UUID for this!!!
      const label = previewFileName.split(".")[0];
      // console.log("label", label);

      const userId = fields.userId;

      // save all that stuff to database
      const quoteViewStyle = await QuoteViewStyle.create({
        userId,
        label,
        contentFontSize: toFloat(contentFontSize),
        authorFontSize: toFloat(authorFontSize),
        bgImageId,
        contentFontId,
        authorFontId,
        contentColorId,
        authorColorId,
      });

      if (!quoteViewStyle) {
        throw new Error("Failed to save quote view style. :(");
      }

      // console.log(fields.quoteSourceId);

      // finally, save all that stuff into QuoteView
      const quoteView = await QuoteView.create({
        image: previewFileName,
        date: new Date(),
        quoteSourceId: fields.quoteSourceId,
        quoteViewStyleId: quoteViewStyle.id,
        userId,
      });

      res.status(200).json({
        message: "Votre mise en forme a été enregistrée !",
        quoteView: quoteView.toJSON(),
      });
    });
  } catch (error) {
    console.error(error);
    res.status(500).send({ error: error });
  }
}

async function getFontId(fontName) {
  try {
    // does this font exist in database?
    let font = await Font.findOne({
      where: { fontPath: fontName },
    });
    // if not create it
    if (!font) {
      font = await Font.create({ fontPath: fontName });
    }
    return font.id;
  } catch (error) {
    console.log(error);
    return null;
  }
}

async function getColorId(colorString) {
  try {
    let color = await Color.findOne({
      where: { color: colorString },
    });

    if (!color) {
      color = await Color.create({ color: colorString });
    }
    return color.id;
  } catch (error) {
    console.log(error);
    return null;
  }
}

function toFloat(fontSizeString) {
  return parseFloat(fontSizeString.replace("rem", ""));
}
