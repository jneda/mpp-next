import { Task } from "db/sequelize";
import { UserTasks } from "db/sequelize";

export default async function createTask(req,res){
    const data = JSON.parse(req.body)
    console.log(data)

    Task.create({
        content: data.content
    })
    .then(task =>{
        UserTasks.create({
            taskId: task.id,
            userId: data.userId
        })         
    })
    .then(data =>{
        const message = `Votre nouvelle tâche a bien été enregistrée.`;
        res.status(200).json({message, data:data})
    })

    /*
    await DiaryEntry.create({
        content: data.note,
        userId: data.userId
    })
    const message = `Votre note a bien été enregistrée`;
    res.status(200).json({message, data: data})*/
}