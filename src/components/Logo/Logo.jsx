import logo from "../../../public/icons/logo.svg";

import style from "./Logo.module.css";

export default function Logo() {
    return (
        <div className={style.center}>
            <img className={style.logo} src={logo.src} alt="Logo Application"></img>
        </div>
    );
  }