import styles from "./Editor.module.css";
import { useState } from "react";

export default function ImageEditor({ backgrounds, ...props }) {
  const basePath = "backgrounds/";

  const [ clickedBackground, setClickedBackground ] = useState("/backgrounds/background-g3981561ff_1920.jpg");

  function setBackground(element) {

    setClickedBackground(() => {
      const newClickedBackground =  element.target.getAttribute("src");
      props.changeBackground(newClickedBackground);
      // setActualPolice(newClickedPolice);
      return newClickedBackground;
      
    });

  }


  return (
    <div
      style={{
        background: "rgba(255,255,255,0.4)",
        color: "white",
      }}
      className={styles.editorImage}
    >
      <ul className={styles.imageList}>
        {backgrounds.map((background) => (
          <li key={background.id}>
            <img
              src={`${basePath}${background.imagePath}`}
              alt={background.path}
              className={styles.imagePreview}
              onClick={setBackground}
            />
          </li>
        ))}
      </ul>
    </div>
  );
}
