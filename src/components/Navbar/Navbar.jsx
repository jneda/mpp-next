import { svgs } from "./Icon/index";

import styles from "./Navbar.module.css";

export default function Navbar() {
  const color = "#A92360";
  const style = {
    color: color,
    width: "100%"
  };

  const icons = svgs.map((svg) => {
    console.log(svg)
    return (
      <a href={svg.href} key={svg.href} className={styles.navbarLink}>
        {svg.component({ style: style })}
      </a>
    );
  });

  return <nav className={styles.navbar}>{icons}</nav>;
}
