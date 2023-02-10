import Navbar from "../Navbar/Navbar";
import QuoteView from "../QuoteView/QuoteView";
import Toolbar from "./Toolbar";

import * as htmlToImage from "html-to-image";

import styles from "./QuoteEditor.module.css";

export default function QuoteEditor() {
  function getImage() {
    var node = document.querySelector(".quote-view");
    htmlToImage
      .toSvg(node)
      .then(function (dataUrl) {
        /* var img = new Image();
        img.src = dataUrl;
        document.body.appendChild(img); */
        var link = document.createElement("a");
        link.download = "my-image-name.jpeg";
        link.href = dataUrl;
        link.click();
      })
      .catch(function (error) {
        console.error("oops, something went wrong!", error);
      });
  }

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
      authorFontSize: authorFontSize
    };
    console.log(sizes);
  }

  const quote = {
    content:
      "L'homme qui déplace une montagne commence par déplacer les petites pierres.",
    author: { name: "Confucius" }
  };
  const viewStyle = {
    image: "backgrounds/bg02.jpg",
    contentFont: "serif",
    contentFontSize: "2rem",
    authorFont: "cursive",
    authorFontSize: "2em",
    fgColor: "white",
    bgColor: "#00000000"
  };

  return (
    <>
      <button onClick={getImage}>Click me</button>
      <Toolbar />
      <QuoteView quote={quote} viewStyle={viewStyle} className={styles.quoteView}/>
      <Navbar page={"editor"}/>
    </>
  );
}
