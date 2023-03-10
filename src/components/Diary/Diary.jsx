import Navbar from "../Navbar/Navbar";
import { useState } from "react";

import style from "./diary.module.css";
import DiaryPage from "../DiaryPage/DiaryPage";
import DiaryAddButton from "../DiaryAddButton/DiaryAddButton";

export default function Diary(props) {

  const { diaryNotes, userTasks } = props;
  // console.log("[Diary component] props:", props);
  // console.log("number of diary entries:", diaryNotes.length);


  const [page, setPage] = useState(true);
  const [color, setColor] = useState(["#fff", "#897b7b"]);
  const [editionMode, setEditionMode] = useState(false);
  const [diaryContents, setDiaryContents] = useState(diaryNotes);
  const [taskContents, setTaskContents] = useState(userTasks);
  const [editingTasks, setEditingTasks] = useState(false)
  let path = "backgrounds/bg01.jpg";

  console.log(diaryContents)

  function handleClickDiary() {
    setPage(true);
    setColor(["#fff", "#897b7b"]);
    setEditionMode(false);
    setEditingTasks(false);
  }

  function handleClickTodo() {
    setPage(false);
    setColor(["#897b7b", "#fff"]);
    setEditionMode(false);
    setEditingTasks(false);
  }

  return (
    <>
      <div
      // className={styles.background}
      // style={{
      //   backgroundImage: `url(${path})`,
      //   display: 'flex',
      //   flexDirection: 'column',
      //   alignItems: 'center'
      // }}
      >
        <div className={style.btns}>
          <div>
            <button
              className={style.journal}
              onClick={handleClickDiary}
              style={
                page
                  ? { backgroundColor: "#fca444" }
                  : { backgroundColor: "#d9d9d9" }
              }
            >
              <svg
                width="28"
                height="28"
                viewBox="0 0 28 28"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M27.1141 0.313232C21.7879 0.5056 17.4416 1.61318 14.0852 3.3263C13.9054 3.41806 13.7563 3.55941 13.6514 3.73184L12.6447 5.38641C12.4605 5.68919 11.9996 5.60327 11.9369 5.25445C11.8873 4.97889 11.5698 4.84719 11.3448 5.01383C10.9712 5.29055 10.6156 5.57667 10.2784 5.8714C10.1906 5.9482 10.1257 6.04762 10.0889 6.15837L9.59964 7.63385C9.51789 7.88038 9.16236 7.85913 9.11057 7.60461C9.06916 7.40117 8.81497 7.33222 8.68069 7.49056C8.07067 8.20982 7.55129 8.96531 7.12294 9.74865C6.30515 11.2442 8.12917 11.9183 9.2412 10.6264C11.6583 7.81855 14.5569 5.44002 17.3662 3.69791C17.6127 3.54506 17.9352 3.62392 18.0878 3.87052C18.2438 4.12247 18.1634 4.45279 17.9117 4.60934C13.8688 7.12485 9.61167 11.0501 7.03263 15.5764C6.8982 15.8123 7.07098 16.1015 7.34253 16.1015C7.40742 16.1015 7.47112 16.084 7.52664 16.0504C8.47898 15.4744 9.41543 14.7876 10.345 14.0257C10.4933 13.9042 10.3997 13.6665 10.2082 13.6764C9.98396 13.688 9.91338 13.3784 10.1205 13.2916L12.0861 12.4688C12.1468 12.4434 12.2025 12.4078 12.2509 12.3633C14.7965 10.0265 17.3292 7.30875 20.0204 4.9588C20.1828 4.81698 20.1139 4.54926 19.9029 4.50526C19.6473 4.45199 19.6215 4.09723 19.8667 4.00755L22.1316 3.17894C22.2186 3.14711 22.3005 3.10259 22.3748 3.04734C23.885 1.9257 25.4556 0.975234 27.1138 0.313297C27.1139 0.313254 27.114 0.313232 27.1141 0.313232ZM2.81564 17.1578C2.34095 17.1578 1.95614 17.5426 1.95614 18.0173C1.95614 18.492 2.34095 18.8768 2.81564 18.8768H8.83082C9.30552 18.8768 9.69033 18.492 9.69033 18.0173C9.69033 17.5426 9.30552 17.1578 8.83082 17.1578H2.81564ZM3.12809 19.9332C3.12809 19.9332 3.12807 19.9332 3.12806 19.9332L1.48202 21.3545C1.33075 21.4851 1.22229 21.6582 1.17077 21.8513L0.145292 25.6952C0.0352119 26.1078 0.145057 26.548 0.436075 26.8605C0.670786 27.1126 0.99971 27.2558 1.34413 27.2558H10.4574C10.8016 27.2558 11.1304 27.1129 11.3653 26.8612C11.6572 26.5483 11.7675 26.1072 11.6572 25.6938L10.8202 22.5563C10.6458 21.9025 10.2874 21.3126 9.78749 20.8565C9.13642 20.2625 8.28689 19.9332 7.40557 19.9332H3.1281C3.1281 19.9332 3.12809 19.9332 3.12809 19.9332Z"
                  fill={color[0]}
                />
              </svg>
              Mon journal
            </button>
            <button
              className={style.todo}
              onClick={handleClickTodo}
              style={
                page
                  ? { backgroundColor: "#d9d9d9" }
                  : { backgroundColor: "#fca444" }
              }
            >
              <svg
                width="26"
                height="24"
                viewBox="0 0 26 24"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M25.2186 3.49684L22.3637 0.67764C22.2633 0.578893 22.1279 0.52298 21.9858 0.52298C21.844 0.52298 21.7082 0.578893 21.6079 0.67764L13.3013 8.87822C12.187 9.97834 10.3954 9.97849 9.28089 8.87855C9.07224 8.67256 8.73408 8.67256 8.52509 8.87855L5.66948 11.6978C5.56912 11.7965 5.51282 11.9309 5.51282 12.0708C5.51282 12.2105 5.56912 12.3448 5.66948 12.4439L10.8965 17.603C10.9965 17.7017 11.1323 17.7576 11.2744 17.7576C11.2807 17.7576 11.2866 17.7543 11.2929 17.7543C11.2982 17.7543 11.3039 17.7573 11.3095 17.7573C11.4466 17.7573 11.5827 17.7056 11.6874 17.6026L25.2186 4.24333C25.4273 4.03668 25.4273 3.70283 25.2186 3.49684Z"
                  fill={color[1]}
                />
                <path
                  d="M19.0808 12.5894C18.7663 12.8999 18.5893 13.3234 18.5893 13.7653V15.114C18.5893 17.8087 16.4048 19.9932 13.7102 19.9932H11.2026C7.22572 19.9932 4.00187 16.7693 4.00187 12.7925C4.00187 8.81563 7.22573 5.59177 11.2026 5.59177H13.6194C14.0484 5.59177 14.4602 5.42279 14.7655 5.12141C15.8034 4.09685 15.0779 2.32919 13.6194 2.32919H2.41822C2.41758 2.32919 2.41707 2.32971 2.41707 2.33034C2.41707 2.33097 2.41656 2.33148 2.41593 2.33147C2.40875 2.33126 2.4021 2.32919 2.39455 2.32919C1.47183 2.32919 0.724724 3.05697 0.701168 3.96211C0.701139 3.9632 0.700247 3.96408 0.699155 3.96408C0.698044 3.96408 0.697144 3.96498 0.697144 3.96609V21.6187C0.697144 21.6199 0.698119 21.6208 0.699323 21.6208C0.700506 21.6208 0.701473 21.6218 0.701504 21.623C0.724781 22.5133 1.44922 23.2285 2.35104 23.2514C2.35221 23.2515 2.35315 23.2524 2.35315 23.2536C2.35315 23.2548 2.35411 23.2557 2.3553 23.2557H2.39455H2.39488H20.1963H20.1966H20.2359C20.237 23.2557 20.238 23.2548 20.238 23.2536C20.238 23.2524 20.239 23.2515 20.2401 23.2514C21.1423 23.2285 21.8664 22.5133 21.8897 21.623C21.8897 21.6218 21.8907 21.6208 21.8918 21.6208C21.893 21.6208 21.894 21.6199 21.894 21.6187V13.7653C21.894 12.2983 20.1247 11.5588 19.0808 12.5894Z"
                  fill={color[1]}
                />
              </svg>
              Ma to do list
            </button>
          </div>
          <span
            className={style.triangle}
            style={page ? { marginLeft: "25%" } : { marginLeft: "75%" }}
          ></span>
        </div>

        <div>
        {editionMode ?
          <DiaryPage page={page} editionMode={editionMode} setEditionMode={setEditionMode} userId={props.userId} diaryContents={diaryContents} setDiaryContents={setDiaryContents}/>
        :
          <DiaryAddButton page={page} setEditionMode={setEditionMode} editingTasks={editingTasks} setEditingTasks={setEditingTasks} />
        }
      </div>
        {page ? (
          diaryNotes.length > 0 ? diaryContents.map(entry => (<DiaryPage key={entry.id} page={page} data={entry} diaryContents={diaryContents} setDiaryContents={setDiaryContents} />)) 
          // (
          //   <>
          //     <DiaryPage page={page} diary={props.diaryNotes} />
          //   </>
          // )
           : (
            <div className={style.noNotes}>
              <h3>Notes personnelles</h3>
              <p>
                Vous n'avez aucune note de journal <br /> pour le moment
              </p>
            </div>
          )
        ) : (
          <>
            <DiaryPage page={page} taskContents={taskContents} setTaskContents={setTaskContents} editingTasks={editingTasks} setEditingTasks={setEditingTasks} userId={props.userId}/>
          </>
        )}
      </div>
      <Navbar page={"diary"}/>
    </>
  );
}
