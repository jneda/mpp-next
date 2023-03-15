// import styles from "./Editor.module.css";
import styles from "./editorStyles.module.css"

import { useState, useEffect } from "react";
import fonts from "@/components/Fonts";

export default function ColorEditor(props) {

  const [ selectedText, setSelectedText ] = useState("quote")

  function selectText(e) {
    setSelectedText(e.target.id)
  } 

  // const handleColorChange = (event) => {
  //   const newColor = event.target.value;
  //   props.colorChange(newColor, selectedText);
  // };

  const handleColorChange = (event) => {
    const newColor = event.target.value
    document.getElementById('color_front').style.backgroundColor = `${newColor}`;
    props.colorChange(newColor, selectedText)
  };
  
  const changeSpanColor = (event) => {
    document.getElementById('colour').click();
  };
  
  return (
    <div
      style={{
        background: "rgba(255,255,255,0.4)",
        color: "white",
      }}
      className={`${styles.editor} ${styles.center} ${styles.padd}`}
    >
      <span className={`${styles.spanColor1}`}id="color_front" onClick={changeSpanColor}></span>
      <input className={styles.inputColor1} type='color' defaultValue='#fefefe' id='colour' onInput={handleColorChange}></input>
      <div className={styles.btnsDiv}>
          <button className={`${fonts.merriweather.className} ${styles.selectedBtn}`} id="quote" disabled={selectedText == "quote"} onClick={selectText}>Citation</button> 
          <button className={`${fonts.merriweather.className} ${styles.selectedBtn}`}  id="author" disabled={selectedText == "author"} onClick={selectText}>Auteur</button>
      </div>
      <p className={`${styles.textUnderColor} ${fonts.merriweather.className}`}>Cliquez sur le coeur pour changer la couleur</p>
    </div>
  );
}




