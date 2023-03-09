import { Task } from "db/sequelize";

export default async function deleteTask(req,res){
    const data = JSON.parse(req.body)
    console.log(data)

    Task.findOne({where: {id: data.id}})
    .then(task =>{
        const taskDeleted = task;
        return Task.destroy({where: {id: data.id}})
        .then(_ =>{
            const message = `La tâche à bien été supprimée.`;
            return res.status(200).json({message, data:taskDeleted})
        }) 
    })     
}
