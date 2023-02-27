import styles from "./Editor.module.css";
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



//Faire un tableau de polices et mapper pour créer les li

export default function FontEditor(props) {
  const [ defaultPolice, setDefaultPolice] = useState(`${courgette.className}`)
  //Dans le state j'appelle la classe correspondant à la font de la li cliquée qui sera placée dans la div citation
  const [ actualPolice, setActualPolice ] = useState(defaultPolice)

  const [ clickedPolice, setClickedPolice ] = useState(actualPolice)

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
      callToParent(newClickedPolice, actualPolice);
      setActualPolice(newClickedPolice);
      return newClickedPolice;
      
    });

  }

  function callToParent(clickedPolice, actualPolice) {
    
    props.changeFontFunc(clickedPolice, actualPolice);
  }


  return (
    <div
      style={{
        background: "hotpink",
        color: "white",
      }}
      className={styles.editor}
    >
        <ul>
          <li  className={`${zeyada.className} ${styles.policeItem}`} onClick={setPolice}>{`Il est temps de rallumer les étoiles`}</li>
          <li  className={`${merriweather.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${caveat.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${GreatVibes.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
        </ul>
      FontEditor
    </div>
  );
}