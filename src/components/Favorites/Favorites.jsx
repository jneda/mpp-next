import Navbar from "../Navbar/Navbar";

import styles from "../Homepage/Homepage.module.css";

export default function App() {
  let path = "backgrounds/bg01.jpg";
  return (
    <>
      <div
        className={styles.background}
        style={{
          backgroundImage: `url(${path})`
        }}
      >
        <h1>Mes favoris</h1>
      </div>
      <Navbar page={"favorites"} />
    </>
  );
}