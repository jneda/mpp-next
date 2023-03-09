import { DiaryEntry } from "db/sequelize";

export default async function createDiaryEntry(req,res){
    const data = JSON.parse(req.body)
    console.log(data.note)
    await DiaryEntry.create({
        content: data.note,
        userId: data.userId
    })
    .then(entry =>{
        const message = `Votre note a bien été enregistrée`;
        res.status(200).json({message, id: entry.id, data: data})
    })
}