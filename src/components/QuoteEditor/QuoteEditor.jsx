import { useEffect, useState } from "react";
import Navbar from "../Navbar/Navbar";
import QuoteView from "../QuoteView/QuoteView";
import Toolbar from "./Toolbar";
import { ColorEditor, FontEditor, ImageEditor } from "./Editors";
import { Courgette } from '@next/font/google'


import * as htmlToImage from "html-to-image";

import styles from "./QuoteEditor.module.css";

const courgette = Courgette({
  subsets: ['latin'],
  weight: '400'
})

export default function QuoteEditor() {
  /** Enum-like object */
  const Modes = Object.freeze({
    PREVIEW: "preview",
    SET_IMAGE: "setImage",
    SET_COLOR: "setColor",
    SET_FONT: "setFont",
  });


  //----------------------
  //Essai fonction modifyFont
  //-------------------------


  const [ defaultPolice, setDefaultPolice] = useState(`${courgette.className}`)

  const [ userPolice, setUserPolice] = useState(defaultPolice)

 
  const modifyPolice = (dataInChild) => {
    console.log(dataInChild)
  }
  /* const editors = {
    [Modes.PREVIEW]: null,
    [Modes.SET_COLOR]: <ColorEditor />,
    [Modes.SET_FONT]: <FontEditor />,
    [Modes.SET_IMAGE]: <ImageEditor />,
  }; */

  const editors = {
    preview: null,
    setColor: <ColorEditor />,
    setFont: <FontEditor
    changeFontFunc = {modifyPolice} />,
    setImage: <ImageEditor />,
  };

  const [mode, setMode] = useState(Modes.PREVIEW);

  function handleModeChange(modeName) {
    console.log(`I need to switch to ${modeName} mode!`);
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

  // dummy data for testing
  const quote = {
    content:
      "Sois fainéant, tu vivras content.",
    author: { name: "Coluche" },
  };
  // dummy style for testing
  const viewStyle = {
    image: "/backgrounds/background-g3981561ff_1920.jpg",
    contentFont: "serif",
    contentFontSize: "2rem",
    authorFont: "cursive",
    authorFontSize: "2em",
    fgColor: "white",
    bgColor: "#00000000",
  };

  // debug
  console.log(mode, editors[mode]);
  /* for (const key of Object.keys(Modes)) {
    console.log(key);
    if (key !== mode) {
      console.log(`%c${key} does not match ${mode}`, "color: red;");
    }
    if (key === mode) {
      console.log(`%c${key} matches ${mode}!`, "color: green;");
    }
  } */

  const editor = editors[mode];

  return (
    <>
      <button onClick={getImage}>Click me</button>
      <Toolbar onModeChange={handleModeChange} />
      <QuoteView
        quote={quote}
        viewStyle={viewStyle}
        className={styles.quoteView}
        // onClick={getImage}
      />
      {/* <ImageEditor /> */}
      {editor}
      <Navbar page={"editor"} />
    </>
  );
}
