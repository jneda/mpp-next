import styles from "./QuoteView.module.css";
import { useState } from "react";
import { Courgette } from '@next/font/google'

const courgette = Courgette({
  subsets: ['latin'],
  weight: '400'
})

export default function QuoteView({ id, quote, viewStyle, className }) {
  const {
    image,
    contentFont,
    contentFontSize,
    authorFont,
    authorFontSize,
    fgColor,
    bgColor
  } = viewStyle;


  const [ defaultPolice, setDefaultPolice] = useState(`${courgette.className}`)

  return (
    <article
      id={id}
      className={`${className} ${styles.quoteView}`}
      style={{
        backgroundImage: `url(${image})`,
        backgroundColor: bgColor
      }}
    >
      <blockquote className={styles.blockquote}>
        <p
          id="text-font-police"
          className={`${styles.quoteContent} ${defaultPolice}`}
          style={{
            // fontFamily: contentFont,
            fontSize: contentFontSize,
            fontColor: fgColor
          }}
        >
          {quote.content}
        </p>
        <p
          className={styles.quoteAuthor}
          style={{
            fontFamily: authorFont,
            fontSize: authorFontSize,
            fontColor: fgColor
          }}
        >
          {quote.author.name}
        </p>
      </blockquote>
    </article>
  );
}
