import { DiaryEntry } from "db/sequelize";

export default async function updateDiaryEntry(req,res){
    const data = JSON.parse(req.body)
    console.log(data)
    const entry = await DiaryEntry.findOne({where: {id: data.noteId}})
    const updatedNote = await entry.update({content: data.content})
    const message = `La note a bien été mise à jour.`;
    return res.status(200).json({message, data: updatedNote})
}