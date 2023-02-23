module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('color',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        color:{
            type: DataTypes.STRING
        }
    },
    {
        timestamps: false
    })
}
