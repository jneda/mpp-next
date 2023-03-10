import { DiaryEntry } from "db/sequelize";


export default async function deleteTask(req,res){
    const data = JSON.parse(req.body)
    DiaryEntry.findOne({where: { id: data.id}})
    .then(entry =>{
        const noteDeleted = entry;
        return DiaryEntry.destroy({where: { id: data.id}})
        .then(_ =>{
            const message = `La note de journal à bien été supprimée.`;
            return res.status(200).json({message, data:noteDeleted})
        }) 
    }) 
    .catch(error =>{
        const message = 'La note de journal n\'a pas pu être supprimée. Merci de réessayer dans quelques instants';
        res.status(500).json({message, data: error});
    })    
}
