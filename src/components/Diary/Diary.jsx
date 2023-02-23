import Navbar from "../Navbar/Navbar";
import { useState } from "react";

import styles from "../Homepage/Homepage.module.css";
import style from './diary.module.css'

export default function App() {
  const [page, setPage] = useState(true)
  let path = "backgrounds/bg01.jpg";

  function handleClickDiary(){
    setPage(true)
  }

  function handleClickTodo(){
    setPage(false)
  }

  return (
    <>
      <div
        className={styles.background}
        style={{
          backgroundImage: `url(${path})`,
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center'
        }}
      >

        <div className={style.btns}>
          <div>
            <button className={style.journal} onClick={handleClickDiary} style={page ? {backgroundColor: '#fca444'} : {backgroundColor: ''}}>Journal</button>
            <button className={style.todo} onClick={handleClickTodo} style={page ? {backgroundColor: ''} : {backgroundColor: '#fca444'}}>To do list</button>
          </div>
          <span className={style.triangle} style={page ? {marginLeft: '25%'} : {marginLeft: '75%'}}></span>
        </div>

        <div className={style.page}>
          <div className={style.inters}>
            <div className={style.inter1}></div>
            <div className={style.inter2}></div>
            <div className={style.inter3}></div>
          </div>

          <div className={style.marge}></div>
          <div className={style.decor}>
            <span className={style.dot}></span>
            <span className={style.dot}></span>
            <span className={style.dot}></span>
            <span className={style.dot}></span>
            <span className={style.dot}></span>
            <span className={style.dot}></span>
            <span className={style.dot}></span>
            <span className={style.dot}></span>
          </div>
          <div className={style.txt}>
            <h1>{page? 'Mon journal' : 'Ma to do list'}</h1>
            <ul className={style.todolist}>
            </ul>
          </div>
        </div>
      </div>
      <Navbar page={"diary"} />
    </>
  );
}
