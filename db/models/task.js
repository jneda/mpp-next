module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('task',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        content:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "Veuillez préciser une activité"},
                notNull: {msg: "Veuillez préciser une activité"}
            }
        },
        approved:{
            type: DataTypes.BOOLEAN,
            defaultValue: false,
        }
    },
    {
        timestamps: false
    })
}
