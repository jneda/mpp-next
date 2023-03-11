import styles from "./Editor.module.css";
import { useState, useEffect } from "react";
import fonts from "@/components/Fonts";



//Faire un tableau de polices et mapper pour créer les li

export default function FontEditor(props) {
  const [ defaultPolice, setDefaultPolice] = useState(`${fonts.courgette.className}`)
  //Dans le state j'appelle la classe correspondant à la font de la li cliquée qui sera placée dans la div citation
  // const [ actualPolice, setActualPolice ] = useState(defaultPolice)

  const [ clickedPolice, setClickedPolice ] = useState(null)

  const [ selectedText, setSelectedText ] = useState("quote")

  const [ fontSize, setFontSize ] = useState(2)

  function setPolice(element) {
    // 1) Au clic j'appelle setPolice qui récupère l'élément cliqué
    // 2) setPolice appelle une autre fonction qui change le state clickedPolice
    // 3) le state contient lui même une fonction callback
    // 4) Cette fonction définit une constante qui contient la mise à jour de la police cliquée
    // la mise à jour de l'état dans React est asynchrone, si j'appelais séparément setClickedPolice et setActualPolice, la valeur de clickedPolice ne sera pas mise à jour au premier clic
    // 5) J'appelle ma fonction callToParent qui fait le lien avec l'éditeur pour y remonter mes states
    // 6) la fonction retourne obligatoirement la nouvelle valeur cliquée
    setClickedPolice(() => {
      const newClickedPolice =  element.target.classList[0];
      props.changeFontFunc(newClickedPolice, selectedText);
      // setActualPolice(newClickedPolice);
      return newClickedPolice;
      
    });

  }

  // function callToParent(clickedPolice) {
    
    
  // }

  function selectText(e) {
    setSelectedText(e.target.id)
  } 

  function setArrow(e) {
    const editor = document.getElementById("editor");
    const list = document.getElementById("policeList");
    const buttons = document.querySelectorAll(`.${styles.selectedBtn}`);
    const labelRange = document.getElementById('labelRange');

    e.target.classList.toggle(`${styles.clickedArrow}`);

    editor.classList.toggle(`${styles.translateEditor}`);
    list.classList.toggle(`${styles.translateList}`);
    labelRange.classList.toggle(`${styles.translateList}`);
    for ( let item of buttons) {
      item.classList.toggle(`${styles.translateList}`)};
  }

  const handleFontSizeChange = (event) => {
    const newSize = event.target.value;
    props.onFontSizeChange(newSize, selectedText);
  };

  const handleFontRange = (event) => {
   setFontSize(event.target.value)
  };

  
     const keyValues = Object.entries(fonts);



  return (
    <div
      style={{
        background: "rgba(255,255,255,0.4)",
        color: "white",
      }}
      className={styles.editor}
      id="editor"
    >
      
       <ul className={`${styles.policeItem}`} id="policeList">
       {keyValues.map(([key , value]) => {
          return <li className={`${value.className}`}onClick={setPolice}>Dreams come true<span className={`${fonts.merriweather.className} ${styles.fontSpan}`}>{key.toUpperCase()}</span> </li>
       })}
       </ul>
        <div className={`${styles.arrow}`}onClick={setArrow}></div>
        <div>
          <button className={`${fonts.merriweather.className} ${styles.selectedBtn}`} id="quote" disabled={selectedText == "quote"} onClick={selectText}>Citation</button> 
          <button className={`${fonts.merriweather.className} ${styles.selectedBtn}`}  id="author" disabled={selectedText == "author"} onClick={selectText}>Auteur</button>
        </div>
        <div  className={`${styles.sizePolice}`}>
          <input type="range"step="0.1" className={styles.range} id="fontSize-range" name="fontSize-range" min="1" max="5" defaultValue="2" onInput={(event) => {
            handleFontSizeChange(event);
            handleFontRange(event);
          }}/>
          <label className={`${styles.labelRange} ${fonts.merriweather.className}`}id="labelRange" htmlFor="fontSize-range">{`Taille de la police : ${fontSize}`}</label>
        </div>
    </div>
  );
}