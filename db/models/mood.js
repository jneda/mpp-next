module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('mood',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        label:{
            type: DataTypes.STRING,
            allowNull: false
        }
    },
    {
        timestamps: false
    })
}

