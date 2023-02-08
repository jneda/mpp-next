module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('quoteView',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        image:{
            type: DataTypes.STRING
        }
    },
    {
        timestamps: true,
        createdAt: 'date',
        updatedAt: false

    })
}
