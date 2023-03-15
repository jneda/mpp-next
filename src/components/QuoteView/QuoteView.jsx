import styles from "./QuoteView.module.css";
import { useState } from "react";
import { Courgette } from "@next/font/google";
import fonts from "../Fonts";

export default function QuoteView({ id, quote, viewStyle, className }) {
  console.log(
    `INFO QuoteView received props: ${JSON.stringify({
      id,
      quote,
      viewStyle,
      className,
    }, null, 1)}`
  );
  const {
    bgImage,
    contentFont,
    contentFontSize,
    authorFont,
    authorFontSize,
    fgColor,
    fgaColor,
    bgColor,
  } = viewStyle;

  // console.log("Quoteview Content Font", contentFont);

  return (
    <article
      id={id}
      className={`${className} ${styles.quoteView}`}
      style={{
        backgroundImage: `url(${bgImage})`,
        backgroundColor: bgColor,
      }}
    >
      <blockquote className={styles.blockquote}>
        <p
          className={`${styles.quoteContent} ${fonts[contentFont].className}`}
          style={{
            fontSize: contentFontSize,
            color: fgColor,
          }}
          id="quote-element"
        >
          {quote.content}
        </p>
        <p
          id="author-element"
          className={`${styles.quoteAuthor} ${fonts[authorFont].className}`}
          style={{
            fontSize: authorFontSize,
            color: fgaColor,
          }}
        >
          {quote.author}
        </p>
      </blockquote>
    </article>
  );
}
