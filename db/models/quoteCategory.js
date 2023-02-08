module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('quoteCategory',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        label:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "La catégorie ne peut pas être un champ vide"},
                notNull: {msg: "La catégorie ne peut pas être nulle"}
            }
        }
    },
    {
        timestamps: false
    })
}