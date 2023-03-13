import styles from './diaryPage.module.css'
import { useState, useEffect } from 'react'

export default function DiaryPage(props) {
    const [notes, setNotes] = useState('')
    const [newTask, setNewTask] = useState('')
    const [onEdit, setOnEdit] = useState(false)
   

    function handleChangesNotes(e){
        setNotes(e.target.value)
    }

    function handleChangeTask(e){
        setNewTask(e.target.value)
    }


    function handleClickValidate(){
        fetch('api/createNote',{
            method: 'POST',
            body: JSON.stringify({note: notes, userId: props.userId}) 
        })
        .then(res => res.json())
        .then(data => {
            props.setDiaryContents([{id: data.id, content: notes, date:todayDate}, ...props.diaryContents]);
        })
        setNotes('')
        if(props.editionMode){
            props.setEditionMode(false)
        }
    }

    function handleClickValidateEdition(){
        const id = props.data.id;
        let tab = [...props.diaryContents]
        const nodeIndex = tab.findIndex(note => note.id == id)
        tab.splice(nodeIndex, 1)
        const date = props.data.date.substring(0, 10).split('-').reverse().join('/')
        props.setDiaryContents([{id:id, content: notes, date: date} ,...tab])

        fetch('api/updateNote',{
            method: 'PUT',
            body: JSON.stringify({noteId: id, content: notes})
        })
        .then( _ =>{
            setNotes('')
            setOnEdit(false)
        })
    }

    function handleClickCancel(){
        if(props.editionMode){
            props.setEditionMode(false)
        }
        setOnEdit(false)
    }

    function hancleClickCreateTask(){
        props.setEditingTasks(true)
    }

    function handleChangeCheck(task, e){       
        const id = parseInt(e.target.name)
        let tab = [...props.taskContents]
        const taskIndex = tab.findIndex(task => (
            task.id === id
        ))
        tab[taskIndex].checked = !task.checked
        props.setTaskContents(tab)
        fetch('api/updateTask',{
            method: 'PUT',
            body: JSON.stringify({checked: task.checked, id: id})
        })
        .then(res => res.json())
        .then(data => console.log(data))
    }

    function handleClickEditionNote(){
        setOnEdit(true)
        setNotes(props.data.content)
    }

    function handleChangesEditionNotes(e){
        setNotes(e.target.value)
    }


    function handleClickDeleteNote(){
        const noteId = props.data.id;
        let tab = [...props.diaryContents];
        const nodeIndex = tab.findIndex(note => note.id == noteId);
        tab.splice(nodeIndex, 1)
        props.setDiaryContents(tab)
        fetch('api/deleteNote',{
            method: 'DELETE',
            body: JSON.stringify({id: noteId})
        })
    }

    function handleClickDeleteTask(e){
        const taskId = e.target.parentNode.parentNode.id;
        const userId = props.userId;
        let tab = [...props.taskContents];
        const taskIndex = tab.findIndex(task => task.id == taskId);
        tab.splice(taskIndex, 1)
        props.setTaskContents(tab)
        fetch('api/deleteTask',{
            method: 'DELETE',
            body: JSON.stringify({taskId: taskId, userId: userId})
        })
        .then(res => res.json())
        .then(data => console.log(data))
    }

    function handleSubmitTask(e){
        e.preventDefault();
        fetch('api/createTask',{
            method: 'POST',
            body: JSON.stringify({content: newTask, userId: props.userId})
        })
        .then(res => res.json())
        .then(data => {
            props.setTaskContents([...props.taskContents, {id: data.data.taskId, content: newTask, checked: false}])
        })
        setNewTask('')
    }

    const todayDate = new Date().toLocaleString().substring(0, 10);


    return(
        <div className={styles.page}>
            <div className={styles.inters}>
                {props.editionMode ?
                    <>
                    <div className={styles.inter1} onClick={handleClickValidate} >V</div>
                    <div className={styles.inter2} onClick={handleClickCancel}>X</div>
                    <div className={styles.inter3}></div>
                    </>
                :
                onEdit ?
                    <>
                    <div className={styles.inter1} onClick={handleClickValidateEdition} >V</div>
                    <div className={styles.inter2} onClick={handleClickCancel}>X</div>
                    <div className={styles.inter3}></div>
                    </>
                :
                props.page ? 
                    <>
                    <div className={styles.inter1}></div>
                    <div className={styles.inter2} onClick={handleClickDeleteNote}>Suppr</div>
                    <div className={styles.inter3} onClick={handleClickEditionNote}>Edit</div>
                    </>
                :
                <>
                    <div className={styles.inter1} onClick={hancleClickCreateTask}>create</div>
                    <div className={styles.inter2}>deleteAll</div>
                    <div className={styles.inter3}>list</div>
                </>     
                }
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
                        {onEdit ?
                            <textarea className={styles.textArea} onChange={handleChangesEditionNotes} value={notes}></textarea>
                        :
                            <p id={props.data.id} className={styles.pData}>{props.data.content}</p>
                        }
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
                            <li key={task.id} id={task.id}>
                                <input type="checkbox" className={styles.check} name={task.id} checked={task.checked} onChange={(e) => handleChangeCheck(task, e)}/>       
                                <span>{task.content}</span>
                                <div>
                                    <button onClick={e =>handleClickDeleteTask(e)}>del</button>
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