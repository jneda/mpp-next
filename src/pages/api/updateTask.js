import { UserTasks } from "db/sequelize";

export default async function updateTask(req,res){
    const data = JSON.parse(req.body)
    console.log(data)

    const task = await UserTasks.findOne({where: {taskId: data.id}})
    task.update({checked: data.checked})
    .then(task =>{
        const message = `Checkbox actualisée`;
        return res.status(200).json({message, data: task})
    })
}