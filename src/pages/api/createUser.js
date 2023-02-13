import {User} from 'db/sequelize';
const bcrypt = require('bcrypt');  


export default async function signUser(req,res){
    const hashPassword = await bcrypt.hash(req.body.password, 10)
    await User.create({
        name: req.body.name,
        email: req.body.email,
        password: hashPassword
    })
    const message = `Inscription réussi! Vous êtes maintenant enregistré en tant qu'utilisateur.`;
    res.status(200).json({message, data: req.body})
}