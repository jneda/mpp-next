module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('author',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        name:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "Le nom de l'auteur doit être déclaré"},
                notNull: {msg: "Le nom de l'auteur doit être déclaré"}
            }
        }
    },
    {
        timestamps: false
    })
}