import { Role, User } from "db/sequelize";
const bcrypt = require("bcrypt");

export default async function signUser(req, res) {
  try {
    const { name, email, password } = JSON.parse(req.body);
    const hashPassword = await bcrypt.hash(password, 10);

    const user = await User.build({
      name: name,
      email: email,
      password: hashPassword,
    });

    // give new user the user role by default
    const userRole = await Role.findOne({ where: { label: "user" } });
    user.setRole(userRole);

    await user.save();

    console.log(user.toJSON());
    let userWithoutPassword = user.toJSON();
    delete userWithoutPassword.password;

    const message = `Inscription réussie! Vous êtes maintenant enregistré en tant qu'utilisateur.`;
    res.status(200).json({ message, data: userWithoutPassword });
  } catch (error) {
    console.error(error.message);
    return res.status(500).json({ message: "Erreur serveur." });
  }
}
