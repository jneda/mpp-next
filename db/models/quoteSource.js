module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('quoteSource',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        content:{
            type: DataTypes.TEXT,
            allowNull: false,
            validate: {
                notEmpty: {msg: "La citation ne peut pas être vide"},
                notNull: {msg: "La citation est un champ obligatoire"}
            }
        }
    },
    {
        timestamps: false
    })
}
