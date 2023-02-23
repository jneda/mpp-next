module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('user',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        name:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "Le nom est obligatoire"},
                notNull: {msg: "La nom est obligatoire"}
            }
        },
        email:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                isEmail: {msg: "l'email doit être un mail valide"},
                notEmpty: {msg: "Le nom est obligatoire"},
                notNull: {msg: "La nom est obligatoire"}
            }
        },
        password:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "un mot de passe doit être écrit"},
                notNull: {msg: "un mot de passe doit être écrit"}
            }
        },
        avatar:{
            type: DataTypes.BLOB
        },

    },
    {
        timestamps: false
    })
}

