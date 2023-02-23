import Navbar from "../Navbar/Navbar";

import styles from "./Homepage.module.css";

export default function Homepage() {
  let path = "backgrounds/bg01.jpg";
  return (
    <>
      <div
        className={styles.background}
        style={{
          backgroundImage: `url(${path})`
        }}
      ></div>
      <Navbar page={"homepage"} />
    </>
  );
}
