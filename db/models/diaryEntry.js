module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('diaryEntry',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        content:{
            type: DataTypes.TEXT,
        }
    },
    {
        timestamps: true,
        createdAt: 'date',
        updatedAt: 'update'
    })
}
