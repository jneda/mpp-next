import styles from './diaryAddButton.module.css'

export default function DiaryAddButton(props) {

    return(
        <div className={styles.button}>
            <svg onClick={props.handleClick} width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path fillRule="evenodd" clipRule="evenodd" d="M24 5.5C13.7827 5.5 5.5 13.7827 5.5 24C5.5 34.2172 13.7827 42.5 24 42.5C34.2172 42.5 42.5 34.2172 42.5 24C42.5 13.7827 34.2172 5.5 24 5.5ZM2.5 24C2.5 12.1259 12.1259 2.5 24 2.5C35.8742 2.5 45.5 12.1259 45.5 24C45.5 35.8742 35.8742 45.5 24 45.5C12.1259 45.5 2.5 35.8742 2.5 24Z" fill="#A92360"/>
              <path fillRule="evenodd" clipRule="evenodd" d="M24 14.0149C24.8284 14.0149 25.5 14.6865 25.5 15.5149V32.4854C25.5 33.3138 24.8284 33.9854 24 33.9854C23.1714 33.9854 22.5 33.3138 22.5 32.4854V15.5149C22.5 14.6864 23.1716 14.0149 24 14.0149Z" fill="#A92360"/>
              <path fillRule="evenodd" clipRule="evenodd" d="M34 24C34 24.8284 33.3284 25.5 32.5 25.5H15.5295C14.7011 25.5 14.0295 24.8284 14.0295 24C14.0296 23.1714 14.7011 22.5 15.5296 22.5H32.5C33.3284 22.5 34 23.1716 34 24Z" fill="#A92360"/>
            </svg>
        </div>
    )
}