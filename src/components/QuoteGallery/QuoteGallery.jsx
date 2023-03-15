import Link from "next/link";
import Navbar from "../Navbar/Navbar";
import styles from "./QuoteGallery.module.css";

export default function QuoteGallery({ quoteCards }) {
  const imgElements = quoteCards.map((quoteCard) => {
    return (
      <li className={styles.quoteGalleryLi} key={quoteCard.id}>
        <Link href={`/editor/${quoteCard.id}`}>
          <img
            className={styles.quoteView}
            src={`quoteviews/${quoteCard.image}`}
            alt={quoteCard.image}
          />
        </Link>
      </li>
    );
  });

  return (
    <>
      {/* Ici la barre de recherche etc. */}
      <ul className={styles.quoteGallery}>{imgElements}</ul>
      <Navbar page={"quotes"} />
    </>
  );
}
