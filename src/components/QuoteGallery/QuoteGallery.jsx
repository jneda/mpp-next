import LoginBtn from "../LoginBtn/LoginBtn";
import Navbar from "../Navbar/Navbar";
import styles from "./QuoteGallery.module.css";
import Link from "next/link";

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
      <div className={styles.quoteTopMenu}>
      <Link href="/login" key="login">
        <LoginBtn/>
      </Link>
      <input className={styles.quoteSearchBar} type="text" placeholder="Rechercher une citation"></input>
      </div>
      <ul className={styles.quoteGallery}>{imgElements}</ul>
      <Navbar page={"quotes"}/>
    </>
  );
}
