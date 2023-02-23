module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('userStyle',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        label:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "Un nom doit être renseigné"},
                notNull: {msg: "Un nom doit être renseigné"}
            }
        }
    },
    {
        timestamps: false
    })
}


//id fg color
//id bg color
