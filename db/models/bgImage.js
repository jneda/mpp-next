module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('bgImage',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        imagePath:{
            type: DataTypes.STRING,
        },
        imageCredit:{
            type: DataTypes.STRING
        }
    },
    {
        timestamps: false
    })
}
