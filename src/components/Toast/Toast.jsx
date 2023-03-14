import styles from "./toast.module.css";
import { MessageData } from "@/context/MsgContext";
import { useContext } from "react";

export default function Toast(props) {

    const {infoMessage, setInfoMessage} = useContext(MessageData)

    if(infoMessage != undefined){
        setTimeout(()=>{setInfoMessage()}, 2000)
    }

    return (
        <>
        {infoMessage != undefined &&
        <div className={styles.toast}>
            <div>
                {infoMessage}
            </div>
        </div>
        }
        </>
    );
}