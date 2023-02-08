module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('quoteList',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        label:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "Votre tableau doit avoir un nom"},
                notNull: {msg: "Votre tableau doit avoir un nom"}
            }
        }
    },
    {
        timestamps: false
    })
}
