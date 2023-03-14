import { createContext, useState } from "react";

export const MessageData = createContext(null);

function MessageContext({children}){
    const [infoMessage, setInfoMessage] = useState();

    return(
        <MessageData.Provider value={{infoMessage, setInfoMessage}}>
            {children}
        </MessageData.Provider>
    )
}

export default MessageContext;