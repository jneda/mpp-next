import Navbar from "@/components/Navbar/Navbar";
import styles from "../components/Homepage/Homepage.module.css";

export default function HomePage() {
  let path = "backgrounds/bg01.jpg";
  return (
    <>
      <div
        className={styles.background}
        style={{
          backgroundImage: `url(${path})`
        }}
      ></div>
      <Navbar />
    </>
  );
}