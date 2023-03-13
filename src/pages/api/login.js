import { User } from "db/sequelize";
const bcrypt = require("bcrypt");
import { withSessionRoute } from "@/session/withSession";

export default withSessionRoute(loginRoute);

export async function loginRoute(req, res) {
  try {
    const { email, password } = JSON.parse(req.body);

    // call toJSON method to transform Sequelize model instance to a JS object
    // helps in removing the password later
    let user = await User.findOne({ where: { email: email } });

    // unhappy paths
    if (!user) {
      const message = `Aucun utilisateur ne correspond à cette adresse email.`;
      return res.status(404).json({ message });
    }

    user = user.toJSON();
    
    const passwordVerify = await bcrypt.compare(password, user.password);
    if (!passwordVerify) {
      const message = `Le mot de passe est incorrect.`;
      return res.status(401).json({ message });
    }

    // don't store user password into session
    delete user.password;

    req.session.user = user;
    await req.session.save();

    const message = `L'utilisateur a été connecté avec succès.`;
    return res.status(200).json({ message, data: user });
  } catch (error) {
    console.error(error.message);
    return res.status(500).json({ message: "Erreur serveur." });
  }
}
