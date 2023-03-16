import Navbar from "../Navbar/Navbar";
import styles from "./QuoteGallery.module.css";

export default function QuoteGallery({ quoteCards }) {
  const imgElements = quoteCards.map((quoteCard) => {
    return (
      <li className={styles.quoteGalleryLi}>
        <img
          className={styles.quoteView}
          key={quoteCard.id}
          src={`quoteviews/${quoteCard.image}`}
          alt={quoteCard.image}
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
