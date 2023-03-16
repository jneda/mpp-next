import logocouleur from "../../../public/icons/logocouleur.svg";

import style from "./LogoColor.module.css";

export default function LogoColor() {
    return (
        <div className={style.center}>
            <img className={style.logo} src={logocouleur.src} alt="Color Logo Application"></img>
        </div>
    );
  }