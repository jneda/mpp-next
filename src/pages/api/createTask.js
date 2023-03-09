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
        .then(data =>{
            const message = `Votre nouvelle tâche a bien été enregistrée.`;
            return res.status(200).json({message, data:data})
        })     
    })
}