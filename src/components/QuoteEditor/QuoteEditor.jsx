import { v4 as uuidv4 } from "uuid";
import * as htmlToImage from "html-to-image";

import { useEffect, useState } from "react";
import { useContext } from "react";

import fonts from "../Fonts";

import Navbar from "../Navbar/Navbar";
import QuoteView from "../QuoteView/QuoteView";
import Toolbar from "./Toolbar";
import { ColorEditor, FontEditor, ImageEditor } from "./Editors";
import { MessageData } from "@/context/MsgContext";

import styles from "./QuoteEditor.module.css";
// console.log(fonts);

// main function

export default function QuoteEditor(props) {
  console.log(`INFO QuoteEditor data:`);
  console.log(props);

  const userId = props.id;
  const random = props.random;
  const backgrounds = props.backgrounds || [];
  const debug = props.debug || null;

  if (debug) console.log(`INFO ${JSON.stringify(debug, null, 1)}`);

  console.log(`INFO props.quote:`);
  console.log(props.quote);

  const [quote, setQuote] = useState(props.quote);
  console.log(
    `INFO quote state initialized: ${JSON.stringify(quote, null, 1)}`
  );

  console.log(
    `INFO props.viewStyle: ${JSON.stringify(props.viewStyle, null, 1)}`
  );

  const [viewStyle, setViewStyle] = useState(props.viewStyle);
  console.log(
    `INFO viewStyle state initialized: ${JSON.stringify(viewStyle, null, 1)}`
  );

  const { infoMessage, setInfoMessage } = useContext(MessageData);

  // get random quote on load

  if (random) {
    useEffect(() => handleRandomBackground, []);

    useEffect(() => handleRandomQuote, []);
  }

  const handleRandomBackground = () => {
    if (backgrounds.length === 0) return;

    let randomBg = backgrounds[Math.floor(Math.random() * 20)].imagePath;
    // console.log(randomBg);
    let newImage = {
      bgImage: `/backgrounds/${randomBg}`,
    };
    setViewStyle({ ...viewStyle, ...newImage });
  };

  const handleRandomQuote = () => {
    fetch("api/getRandomQuote")
      .then((res) => res.json())
      .then((data) => {
        const quote = data.data;
        setQuote({
          id: quote.id,
          content: quote.content,
          author: quote.author.name,
        });
      });
  };

  // font actions

  const modifyPolice = (clickedData, selectedText) => {
    // console.log("Coucou c'est la police", clickedData, selectedText);

    const keyValues = Object.entries(fonts);

    const fontNames = keyValues.map(([key, value]) => {
      return clickedData === value.className ? key : null;
    });

    const [fontName] = fontNames.filter((font) => font != null);

    let fontProperty;

    if (selectedText == "quote") {
      fontProperty = { contentFont: fontName };
    } else {
      fontProperty = { authorFont: fontName };
    }

    setViewStyle({ ...viewStyle, ...fontProperty });

    // console.log(`[QuoteEditor]: ${JSON.stringify(viewStyle, null, 1)}`);
  };

  const handleFontSizeChange = (newSize, selectedText) => {
    let fontProperty;

    if (selectedText == "quote") {
      fontProperty = { contentFontSize: `${newSize}rem` };
    } else {
      fontProperty = { authorFontSize: `${newSize}rem` };
    }
    setViewStyle({ ...viewStyle, ...fontProperty });

    // console.log(`[QuoteEditor]: ${JSON.stringify(viewStyle, null, 1)}`);
  };

  // color action

  const handleColorChange = (newColor, selectedText) => {
    // console.log(newColor);
    let fontProperty;

    if (selectedText == "quote") {
      fontProperty = { fgColor: `${newColor}` };
    } else {
      fontProperty = { fgaColor: `${newColor}` };
    }

    setViewStyle({ ...viewStyle, ...fontProperty });

    // console.log(`[QuoteEditor]: ${JSON.stringify(viewStyle, null, 1)}`);
  };

  // background image action

  const handleChangeBackground = (newClickedBackground) => {
    // console.log(newClickedBackground);

    const newBackground = { bgImage: `${newClickedBackground}` };

    setViewStyle({ ...viewStyle, ...newBackground });
  };

  // save action

  async function saveViewStyle() {
    try {
      // generate image file from the DOM
      const node = document.querySelector("article");
      const blob = await htmlToImage.toBlob(node);

      const uniqueFileName = `${uuidv4()}.png`;
      const pngFile = new File([blob], uniqueFileName, { type: "image/png" });
      // console.log(pngFile);

      // build a FormData object to send to the back-end
      const formData = new FormData();
      formData.append("quoteView", pngFile, uniqueFileName);
      formData.append("styles", JSON.stringify(viewStyle));
      formData.append("userId", userId);
      formData.append("quoteSourceId", quote.id);

      console.log(formData);

      const response = await fetch("api/saveQuoteView", {
        method: "POST",
        body: formData,
      });

      if (response.ok) {
        const { message } = await response.json();
        setInfoMessage(message);
      } else {
        setInfoMessage("Votre mise en forme n'a pas pu être enregistrée...");
      }
    } catch (error) {
      console.error(error);
    }

    // save view style to database
  }

  // editor mode selection

  /** Enum-like object */
  const Modes = Object.freeze({
    PREVIEW: "preview",
    SET_IMAGE: "setImage",
    SET_COLOR: "setColor",
    SET_FONT: "setFont",
  });

  const [mode, setMode] = useState(Modes.PREVIEW);

  const editors = {
    preview: null,
    setColor: <ColorEditor colorChange={handleColorChange} />,
    setFont: (
      <FontEditor
        onFontSizeChange={handleFontSizeChange}
        changeFontFunc={modifyPolice}
      />
    ),
    setImage: (
      <ImageEditor
        changeBackground={handleChangeBackground}
        backgrounds={backgrounds}
      />
    ),
  };

  function handleModeChange(modeName) {
    // console.log(`I need to switch to ${modeName} mode!`);
    let newMode = Modes.PREVIEW;
    switch (modeName) {
      case "setImage":
        newMode = Modes.SET_IMAGE;
        break;
      case "setColor":
        newMode = Modes.SET_COLOR;
        break;
      case "setFont":
        newMode = Modes.SET_FONT;
        break;
      default:
        newMode = Modes.PREVIEW;
    }
    setMode(newMode);
  }

  // util function
  function getImage() {
    console.log("coucou !");
    const node = document.querySelector("article");
    console.log(node);
    // allow user to download PNG file
    htmlToImage
      .toPng(node)
      .then(function (dataUrl) {
        /* const img = new Image();
        img.src = dataUrl;
        document.body.appendChild(img); */
        const link = document.createElement("a");
        link.download = "my-image-name.jpeg";
        link.href = dataUrl;
        link.click();
      })
      .catch(function (error) {
        console.error("oops, something went wrong!", error);
      });
  }

  const editor = editors[mode];

  console.log(
    `Sending props to QuoteView: ${JSON.stringify(viewStyle, null, 1)}`
  );

  return (
    <>
      {/* <button className={styles.downloadBtn} onClick={getImage}> */}
      <button className={styles.downloadBtn} onClick={saveViewStyle}>
        <span></span>
        <span></span>
      </button>
      <button onClick={handleRandomQuote}>RandomQuote</button>
      <Toolbar onModeChange={handleModeChange} />
      <QuoteView
        quote={quote}
        viewStyle={viewStyle}
        className={styles.quoteView}
      />
      {editor}
      <Navbar page={"editor"} />
    </>
  );
}
