import styles from "./Editor.module.css";
import { useState, useEffect } from "react";
import fonts from "@/components/Fonts";

export default function ColorEditor(props) {

  const [ selectedText, setSelectedText ] = useState("quote")

  function selectText(e) {
    setSelectedText(e.target.id)
  } 

  const handleColorChange = (event) => {
    const newColor = event.target.value;
    props.colorChange(newColor, selectedText);
  };
  return (
    <div
      style={{
        background: "rgba(232,97,131,0.3561799719887955)",
        color: "white",
      }}
      className={styles.editor}
    >
        <div>
        <input type="color" id="head" name="head"
              defaultValue="#0000" onInput={handleColorChange}/>
        <label className={`${fonts.merriweather.className} ${styles.labelColor}`} htmlFor="head">Changer la Couleur</label>
      </div>
      <div>
          <button className={`${fonts.merriweather.className} ${styles.selectedBtn}`} id="quote" disabled={selectedText == "quote"} onClick={selectText}>Citation</button> 
          <button className={`${fonts.merriweather.className} ${styles.selectedBtn}`}  id="author" disabled={selectedText == "author"} onClick={selectText}>Auteur</button>
        </div>
    </div>
  );
}
