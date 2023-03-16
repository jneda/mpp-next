import loginlogo from "../../../public/icons/login.svg";

import style from "./LoginBtn.module.css";

export default function LoginBtn() {
    return (
        <div className={style.center}>
            <img className={style.logo} src={loginlogo.src} alt="Color Logo Application"></img>
        </div>
    );
  }