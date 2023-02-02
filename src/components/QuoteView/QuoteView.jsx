import "./QuoteView.css";

export default function QuoteView({ quote, viewStyle }) {
  //console.log(quote, viewStyle);
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
      className="quote-view"
      style={{
        backgroundImage: `url(${image})`,
        backgroundColor: bgColor
      }}
    >
      <blockquote>
        <p
          className="quote-content"
          style={{
            fontFamily: contentFont,
            fontSize: contentFontSize,
            fontColor: fgColor
          }}
        >
          {quote.content}
        </p>
        <p
          className="quote-author"
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
