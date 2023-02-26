import Link from "next/link";
import { svgs } from "./Icon/index";

import styles from "./Navbar.module.css";

export default function Navbar({ page }) {
  // console.log(page);

  const color = "#A92360";
  const style = {
    color: color,
    width: "3rem",
  };

  const icons = svgs
    .filter((svg) => svg.href !== page)
    .map((svg) => {
      return (
        <Link href={svg.href} key={svg.href} className={styles.navbarLink}>
          {svg.component({ style: style })}
        </Link>
      );
    });

  return <nav className={styles.navbar}>{icons}</nav>;
}
