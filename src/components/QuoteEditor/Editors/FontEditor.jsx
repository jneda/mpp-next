import styles from "./Editor.module.css";
import { Courgette } from '@next/font/google';
import { Merriweather } from '@next/font/google';
import { Caveat } from '@next/font/google';
import { Zeyada } from '@next/font/google';
import { Great_Vibes } from '@next/font/google';


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

export default function FontEditor() {

  function setPolice(event) {
    //Je souhaite récupérer le nom de la classe de la li cliquée et l'ajouter à ma div de texte test
    
    const clickedPolice = event.target.classList[0];
   
    const textDiv = document.querySelector(`.${styles.testFontText}`)
    // console.log(textDiv)

    const textDivClass = textDiv.classList[1];
    console.log(clickedPolice)

    textDiv.classList.replace(textDivClass, `${clickedPolice}`);
  }

  return (
    <div
      style={{
        background: "hotpink",
        color: "white",
      }}
      className={styles.editor}
    >
        <div className={`${styles.testFontText} ${caveat.className}`} id="test-font">
          Le cheval c'est génial
        </div>
        <ul>
          <li  className={`${zeyada.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${merriweather.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${caveat.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
          <li  className={`${GreatVibes.className} ${styles.policeItem}`} onClick={setPolice}>Il est temps de rallumer les étoiles</li>
        </ul>
      FontEditor
    </div>
  );
}
