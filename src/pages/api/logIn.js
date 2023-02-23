import { User } from 'db/sequelize';
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const privateKey = require('../../auth/private_key');

export default async function logUser(req, res) {
    const { email, password } = JSON.parse(req.body);
    
    const user = await User.findOne({ where: { email: email } });
    if (!user) {
        const message = `Aucun utilisateur ne correspond à cette adresse email.`;
        return res.status(404).json({ message });
    }
    
    const passwordVerify = await bcrypt.compare(password, user.password);
    if (!passwordVerify) {
        const message = `Le mot de passe est incorrect.`;
        return res.status(401).json({ message });
    }

    const token = jwt.sign(
        { userId: user.id },
        privateKey,
        { expiresIn: '24h' }
    );
    const message = `L'utilisateur a été connecté avec succès.`;
    return res.status(200).json({ message, data: user, token });
}