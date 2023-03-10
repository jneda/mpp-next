import { UserTasks } from "db/sequelize";
import { Op } from "sequelize";

export default async function deleteTask(req,res){
    const data = JSON.parse(req.body)
    UserTasks.findOne({where: { [Op.and]: [{taskId: data.taskId},{userId: data.userId}] }})
    .then(task =>{
        const taskDeleted = task;
        return UserTasks.destroy({where: { [Op.and]: [{taskId: data.taskId},{userId: data.userId}] }})
        .then(_ =>{
            const message = `La tâche à bien été supprimée.`;
            return res.status(200).json({message, data:taskDeleted})
        }) 
    })     
}
