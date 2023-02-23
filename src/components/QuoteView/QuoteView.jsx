import styles from "./QuoteView.module.css";

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
          className={styles.quoteContent}
          style={{
            fontFamily: contentFont,
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
