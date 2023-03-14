import { Task } from "db/sequelize";
import { UserTasks } from "db/sequelize";

export default async function createTask(req,res){
    try{
        const data = JSON.parse(req.body)
        console.log(data)
        const similarTask = await Task.findOne({where: {content: data.content}})
        let task_id;
        if(similarTask){
            const task = await UserTasks.create({
                taskId: similarTask.id,
                userId: data.userId
            })
            task_id = task.taskId
        }
        else{
            const task = await Task.create({
                content: data.content
            })
            await UserTasks.create({
                taskId: task.id,
                userId: data.userId
            })
            task_id = task.id
        }
        const message = `Votre nouvelle tâche a bien été enregistrée.`;
        return res.status(200).json({message, data:data, id: task_id})
    }
    catch(err){
        const message = "Echec lors de la création de la nouvelle tâche. Merci de réessayer dans quelques instants.";
        res.status(500).json({message})
    }
}