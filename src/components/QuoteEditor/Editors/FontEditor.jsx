import styles from "./Editor.module.css";
<<<<<<< HEAD
import { Courgette } from '@next/font/google';
import { Merriweather } from '@next/font/google';
import { Caveat } from '@next/font/google';
import { Zeyada } from '@next/font/google';
import { Great_Vibes } from '@next/font/google';
import { useState, useEffect } from "react";




const courgette = Courgette({
  subsets: ['latin'],
  weight: '400'
})

const GreatVibes = Great_Vibes({
  subsets: ['latin'],
  weight: '400'
})

const zeyada = Zeyada({
  subsets: ['latin'],
  weight: '400'
})

const merriweather = Merriweather({
  subsets: ['latin'],
  weight: '400'
})

const caveat = Caveat({
  subsets: ['latin'],
  weight: '400'
})
=======
import { useState, useEffect } from "react";
import fonts from "@/components/Fonts";
>>>>>>> marilyn/quotesModulations



//Faire un tableau de polices et mapper pour créer les li

export default function FontEditor(props) {
<<<<<<< HEAD
  const [ defaultPolice, setDefaultPolice] = useState(`${courgette.className}`)
  //Dans le state j'appelle la classe correspondant à la font de la li cliquée qui sera placée dans la div citation
  const [ actualPolice, setActualPolice ] = useState(defaultPolice)

  const [ clickedPolice, setClickedPolice ] = useState(actualPolice)
=======
  const [ defaultPolice, setDefaultPolice] = useState(`${fonts.courgette.className}`)
  //Dans le state j'appelle la classe correspondant à la font de la li cliquée qui sera placée dans la div citation
  // const [ actualPolice, setActualPolice ] = useState(defaultPolice)

  const [ clickedPolice, setClickedPolice ] = useState(null)

  const [ selectedText, setSelectedText ] = useState("quote")
>>>>>>> marilyn/quotesModulations

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
<<<<<<< HEAD
      callToParent(newClickedPolice, actualPolice);
      setActualPolice(newClickedPolice);
=======
      props.changeFontFunc(newClickedPolice, selectedText);
      // setActualPolice(newClickedPolice);
>>>>>>> marilyn/quotesModulations
      return newClickedPolice;
      
    });

  }

<<<<<<< HEAD
  function callToParent(clickedPolice, actualPolice) {
    
    props.changeFontFunc(clickedPolice, actualPolice);
  }

=======
  // function callToParent(clickedPolice) {
    
    
  // }

  function selectText(e) {
    setSelectedText(e.target.id)
  } 

  function setArrow(e) {
    const editor = document.getElementById("editor");
    const list = document.getElementById("policeList");
    const buttons = document.querySelectorAll(`.${styles.selectedBtn}`);

    e.target.classList.toggle(`${styles.clickedArrow}`);

    editor.classList.toggle(`${styles.translateEditor}`);
    list.classList.toggle(`${styles.translateList}`);
    for ( let item of buttons) {
      item.classList.toggle(`${styles.translateList}`)};
  }
>>>>>>> marilyn/quotesModulations

  return (
    <div
      style={{
        background: "rgba(232,97,131,0.3561799719887955)",
        color: "white",
      }}
      className={styles.editor}
      id="editor"
    >
<<<<<<< HEAD
        <ul>
          <li  className={`${zeyada.className} ${styles.policeItem}`} onClick={setPolice}>{`Il est temps de rallumer les étoiles`}</li>
          <li  className={`${merriweather.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${caveat.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${GreatVibes.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
        </ul>
      FontEditor
=======
        <ul  className= {styles.policeItem} id="policeList">
          <li  className={`${fonts.zeyada.className}`} onClick={setPolice}>{`Il est temps de rallumer les étoiles`}</li>
          <li  className={`${fonts.merriweather.className}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${fonts.caveat.className}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${fonts.GreatVibes.className}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
        </ul>
        <div className={`${styles.arrow}`}onClick={setArrow}></div>
        <div>
          <button className={styles.selectedBtn} id="quote" disabled={selectedText == "quote"} onClick={selectText}>Appliquer à la Quote</button> 
          <button className={styles.selectedBtn} id="author" disabled={selectedText == "author"} onClick={selectText}>Appliquer à l'auteur</button>
        </div>
        <div>
          <input type="range" className={styles.range} id="fontSize-range" min="2" max="5" defaultValue="2" onInput={(event) => {
             document.getElementById('display-fontSize-range').value= event.target.value;
             const newSize = event.target.value;
             const quoteElement = document.getElementById("quote-element");
             const authorElement = document.getElementById("author-element");
             if(selectedText == "quote"){
             quoteElement.style.fontSize = `${newSize}rem`;
             } else {
              authorElement.style.fontSize = `${newSize}rem`;
             };
             }}/>
          <input type="text" id="display-fontSize-range" value="2" readOnly/>
        </div>
>>>>>>> marilyn/quotesModulations
    </div>
  );
}