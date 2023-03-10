import styles from "./QuoteView.module.css";
import { useState } from "react";
import { Courgette } from '@next/font/google'
<<<<<<< HEAD

const courgette = Courgette({
  subsets: ['latin'],
  weight: '400'
})
=======
import fonts from "../Fonts";

>>>>>>> marilyn/quotesModulations

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

<<<<<<< HEAD

  const [ defaultPolice, setDefaultPolice] = useState(`${courgette.className}`)
=======
  console.log("Quoteview Content Font", contentFont);
>>>>>>> marilyn/quotesModulations

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
<<<<<<< HEAD
          id="text-font-police"
          className={`${styles.quoteContent} ${defaultPolice}`}
          style={{
            // fontFamily: contentFont,
=======
          className={`${styles.quoteContent} ${fonts[contentFont].className}`}
          style={{
>>>>>>> marilyn/quotesModulations
            fontSize: contentFontSize,
            fontColor: fgColor
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
            fontColor: fgColor
          }}
        >
          {quote.author.name}
        </p>
      </blockquote>
    </article>
  );
}
