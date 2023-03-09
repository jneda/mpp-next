import styles from './diaryPage.module.css'
import { useState } from 'react'

export default function DiaryPage(props) {
    const [notes, setNotes] = useState('')
    const [newTask, setNewTask] = useState('')

    function handleChangesNotes(e){
        setNotes(e.target.value)
    }

    function handleChangeTask(e){
        setNewTask(e.target.value)
    }


    function handleClickValidate(){
        props.setDiaryContents(props.diaryContents, {id: Date.now(), content: notes, date:todayDate});  /*ne marche pas...*/
        fetch('api/createNote',{
            method: 'POST',
            body: JSON.stringify({note: notes, userId: props.userId}) 
        })
        .then( _ => setNotes(''))
    }

    function handleClickCancel(){
        props.setEditionMode(false)
    }

    function handleSubmitTask(e){
        e.preventDefault();
        props.setTaskContents(props.taskContents, {id: Date.now(), content: newTask})
        fetch('api/createTask',{
            method: 'POST',
            body: JSON.stringify({content: newTask, userId: props.userId})
        })
        .then(_ => setNewTask(''))
    }

    const todayDate = new Date().toLocaleString().substring(0, 10);


    return(
        <div className={styles.page}>
            <div className={styles.inters}>
                <div className={styles.inter1} onClick={handleClickValidate} >V</div>
                <div className={styles.inter2} onClick={handleClickCancel}>X</div>
                <div className={styles.inter3}></div>
            </div>
            <div className={styles.marge}></div>
            <div className={styles.decor}>
                <span className={styles.dot}></span>
                <span className={styles.dot}></span>
                <span className={styles.dot}></span>
                <span className={styles.dot}></span>
                <span className={styles.dot}></span>
                <span className={styles.dot}></span>
                <span className={styles.dot}></span>
                <span className={styles.dot}></span>
            </div>
            <div className={styles.txt}>
                {props.page? 
                    props.data ?
                    <>
                        <h1>{props.data.date.substring(0, 10).split('-').reverse().join('/')}</h1>
                        <textarea className={styles.textArea} onChange={handleChangesNotes} value={props.data.content}></textarea>
                    </>
                    :
                    <>
                        <h1>{todayDate}</h1>
                        <textarea className={styles.textArea} onChange={handleChangesNotes} value={notes}></textarea>
                    </>
                :
                <>
                <h2 className={styles.todoTitle}>Ma to do list</h2>
                    <ul>
                        {props.taskContents ? props.taskContents.map(task =>(
                            <li key={task.id}>
                                <input type="checkbox" />       
                                <span>{task.content}</span>
                                <div>
                                    <button>del</button>
                                </div>
                            </li>
                        ))
                        :
                        <>
                            <p>Il n'y a encore aucune tâche pour le moment.</p>
                        </>
                        }
                        {props.editingTasks && 
                            <form onSubmit={handleSubmitTask}>
                                <input type="text" value={newTask} onChange={handleChangeTask}/>
                                <button type="submit">Valider</button>
                            </form>
                        }
                    </ul>
                </>
                }
            </div>
        </div>
    )
}