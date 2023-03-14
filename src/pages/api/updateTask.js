import { UserTasks } from "db/sequelize";

export default async function updateTask(req,res){
    const data = JSON.parse(req.body)
    console.log(data)
    try{
        const task = await UserTasks.findOne({where: {taskId: data.id}})
    task.update({checked: data.checked})
    .then(task =>{
        const message = `Checkbox actualisée`;
        return res.status(200).json({message, data: task})
    })
    }
    catch(err){
        const message = "Impossible d'actualiser la tâche. Réessayer dans quelques instants.";
        res.status(500).json({message})
    }
}