module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('role',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        label:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "Le role pas être un champ vide"},
                notNull: {msg: "Un role doit être déclaré"}
            }
        }
    },
    {
        timestamps: false
    })
}