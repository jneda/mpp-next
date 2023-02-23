module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('font',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        fontPath:{
            type: DataTypes.STRING
        }
    },
    {
        timestamps: false
    })
}
