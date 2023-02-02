import Navbar from "../Navbar/Navbar";
import styles from "./QuoteGallery.module.css";

export default function QuoteGallery() {
  /*   
  const quotes = [
    {
      content:
        "Quand on ne peut revenir en arrière, on ne doit se préoccuper que de la meilleure façon d’aller de l’avant.",
      author: { name: "Paulo Coehlo" }
    },
    {
      content:
        "Ce n’est pas parce que c’est difficile qu’on n’ose pas le faire, mais parce qu’on n’ose pas le faire que c’est difficile.",
      author: { name: "Sénèque" }
    },
    {
      content:
        "Les gens qui réussissent ont l’habitude de faire ce que les gens qui échouent n’aiment pas faire.",
      author: { name: "Thomas Edison" }
    }
  ];

  const viewStyle = {
    image: "backgrounds/bg02.jpg",
    contentFont: "serif",
    contentFontSize: "1em",
    authorFont: "cursive",
    authorFontSize: "1em",
    fgColor: "white",
    bgColor: "#00000000"
  };

  const quoteViews = quotes.map((quote) => {
    return (
      <li>
        <QuoteView quote={quote} viewStyle={viewStyle} />
      </li>
    );
  });

  //<QuoteView quote={quote} viewStyle={viewStyle} />
  */

  const imagePaths = ["qv_01.png", "qv_02.png", "qv_03.png"];

  const imgElements = imagePaths.map((path) => {
    return (
      <li className={styles.quoteGalleryLi}>
        <img
          className={styles.quoteView}
          key={path}
          src={`quoteviews/${path}`}
          alt={path}
        />
      </li>
    );
  });

  return (
    <>
      {/* Ici la barre de recherche etc. */}
      <ul className={styles.quoteGallery}>{imgElements}</ul>
      <Navbar />
    </>
  );
}
