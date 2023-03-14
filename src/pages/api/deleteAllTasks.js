import { UserTasks } from "db/sequelize";

export default async function deleteAllTask(req,res){
    try{
        const data = JSON.parse(req.body)
        const tasks = await UserTasks.findAll({where: {userId: data.userId} })
        console.log(tasks)
        if(tasks.length === 0 ){
            const message = "Vous n'avez aucune tâches.";
            return res.status(404).json({message})
        }
        tasks.map(async(task) =>{
            await task.destroy()
            // console.log('destroyed task:', result)
        })
        const message = "Toutes vos tâches ont correctement été supprimées"
        return res.status(200).json({message})
    }
    catch(err){
        const message = "les tâches n'ont pas pu être supprimés correctement. Réessayer dans quelques instants.";
        console.log(err)
        res.status(500).json({message});
    }        
}
