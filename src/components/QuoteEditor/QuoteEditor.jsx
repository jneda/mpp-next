import { v4 as uuidv4 } from "uuid";
import * as htmlToImage from "html-to-image";

import { useEffect, useState } from "react";

import fonts from "../Fonts";

import Navbar from "../Navbar/Navbar";
import QuoteView from "../QuoteView/QuoteView";
import Toolbar from "./Toolbar";
import { ColorEditor, FontEditor, ImageEditor } from "./Editors";

import styles from "./QuoteEditor.module.css";
// console.log(fonts);

// dummy data for testing
const quote = {
  content: "Il fait chaud ici!",
  author: { name: "Giordano Bruno" },
};

// dummy style for testing
const dummyStyle = {
  image: "/backgrounds/marguerite-729510_1920.jpg",
  contentFont: "GreatVibes",
  contentFontSize: "2rem",
  authorFont: "caveat",
  authorFontSize: "2em",
  fgColor: "#00000",
  fgaColor: "#00000",
  bgColor: "#00000000",
};

// main function

export default function QuoteEditor({ backgrounds, userId }) {
  const [quote, setQuote] = useState({
    content: "",
    author: "",
  });

  const [viewstyle, setViewStyle] = useState({ ...dummyStyle });

  // get random quote on load

  useEffect(() => handleRandomBackground, []);

  const handleRandomBackground = () => {
    if (backgrounds.length === 0) return;

    let randomBg = backgrounds[Math.floor(Math.random() * 20)].imagePath;
    // console.log(randomBg);
    let newImage = {
      image: `/backgrounds/${randomBg}`,
    };
    setViewStyle({ ...viewstyle, ...newImage });
  };

  useEffect(() => handleRandomQuote, []);

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

    setViewStyle({ ...viewstyle, ...fontProperty });

    // console.log(`[QuoteEditor]: ${JSON.stringify(viewstyle, null, 1)}`);
  };

  const handleFontSizeChange = (newSize, selectedText) => {
    let fontProperty;

    if (selectedText == "quote") {
      fontProperty = { contentFontSize: `${newSize}rem` };
    } else {
      fontProperty = { authorFontSize: `${newSize}rem` };
    }
    setViewStyle({ ...viewstyle, ...fontProperty });

    // console.log(`[QuoteEditor]: ${JSON.stringify(viewstyle, null, 1)}`);
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

    setViewStyle({ ...viewstyle, ...fontProperty });

    // console.log(`[QuoteEditor]: ${JSON.stringify(viewstyle, null, 1)}`);
  };

  // background image action

  const handleChangeBackground = (newClickedBackground) => {
    // console.log(newClickedBackground);

    const newBackground = { image: `${newClickedBackground}` };

    setViewStyle({ ...viewstyle, ...newBackground });
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
      formData.append("styles", JSON.stringify(viewstyle));
      formData.append("userId", userId);
      formData.append("quoteSourceId", quote.id);

      console.log(formData);

      const response = await fetch("api/saveQuoteView", {
        method: "POST",
        body: formData,
      });
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

  // util function
  function getCard() {
    const quoteView = document.querySelector(".quote-view");
    const quoteContent = document.querySelector(".quote-content");
    const quoteAuthor = document.querySelector(".quote-author");

    const width = quoteView.offsetWidth;
    const height = quoteView.offsetHeight;

    const contentFontSize = window.getComputedStyle(quoteContent).fontSize;
    const authorFontSize = window.getComputedStyle(quoteAuthor).fontSize;

    const sizes = {
      width: width,
      height: height,
      contentFontSize: contentFontSize,
      authorFontSize: authorFontSize,
    };
    console.log(sizes);
  }

  const editor = editors[mode];

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
        viewStyle={viewstyle}
        className={styles.quoteView}
      />
      {editor}
      <Navbar page={"editor"} />
    </>
  );
}
