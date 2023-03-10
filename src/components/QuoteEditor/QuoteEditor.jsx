import { useEffect, useState } from "react";
import Navbar from "../Navbar/Navbar";
import QuoteView from "../QuoteView/QuoteView";
import Toolbar from "./Toolbar";
import { ColorEditor, FontEditor, ImageEditor } from "./Editors";
import fonts from "../Fonts";


import * as htmlToImage from "html-to-image";

import styles from "./QuoteEditor.module.css";
console.log(fonts);

export default function QuoteEditor() {

    // dummy style for testing
    const dummyStyle = {
      image: "/backgrounds/background-g3981561ff_1920.jpg",
      contentFont: "GreatVibes",
      contentFontSize: "2rem",
      authorFont: "caveat",
      authorFontSize: "2em",
      fgColor: "#00000",
      fgaColor:"#00000",
      bgColor: "#00000000",
    };
  
    const [ viewstyle, setViewStyle ] = useState({...dummyStyle});

  const handleFontSizeChange = (newSize, selectedText) => {

    let fontProperty;
    
    if(selectedText == "quote"){
      fontProperty = {contentFontSize:`${newSize}rem`}
    } else {
      fontProperty = {authorFontSize:`${newSize}rem`}
    }
    setViewStyle({...viewstyle, ...fontProperty});
  };

  const handleColorChange = (newColor, selectedText) => {

    let fontProperty;
    
      if(selectedText == "quote"){
        fontProperty = {fgColor:`${newColor}`}
      } else {
        fontProperty = {fgaColor:`${newColor}`}
      }

    setViewStyle({...viewstyle, ...fontProperty});
  };




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

 
  const modifyPolice = (clickedData, selectedText) => {
    console.log("Coucou c'est la police", clickedData, selectedText);

    const keyValues = Object.entries(fonts);

    const fontNames = keyValues.map(([key , value]) => {
     return clickedData === value.className ? key : null
    });

    const [fontName] = fontNames.filter(font => font!=null)



    let fontProperty;

    if(selectedText == "quote"){
      fontProperty = {contentFont:fontName}
    } else {
      fontProperty = {authorFont:fontName}
    }


    setViewStyle({...viewstyle, ...fontProperty});

    console.log({...viewstyle, ...fontProperty});


  }
  /* const editors = {
    [Modes.PREVIEW]: null,
    [Modes.SET_COLOR]: <ColorEditor />,
    [Modes.SET_FONT]: <FontEditor />,
    [Modes.SET_IMAGE]: <ImageEditor />,
  }; */

  const editors = {
    preview: null,
    setColor: <ColorEditor
    colorChange={handleColorChange}/>,
    setFont: <FontEditor
    onFontSizeChange={handleFontSizeChange}
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

  // debug
  // console.log(mode, editors[mode]);
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
        viewStyle={viewstyle}
        className={styles.quoteView}
        // onClick={getImage}
      />
      {/* <ImageEditor /> */}
      {editor}
      <Navbar page={"editor"} />
    </>
  );
}
